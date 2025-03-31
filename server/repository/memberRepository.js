import { db } from "./db.js";

/**
 * 회원가입
 * @param {object} formData - 회원가입 폼 데이터 객체
 * @param {string} formData.name - 이름
 * @param {string} formData.birthdate - 생년월일 (YYYYMMDD 형식)
 * @param {string} formData.id - 아이디
 * @param {string} formData.pwd - 비밀번호
 * @param {string} formData.email - 이메일 주소
 * @param {string} formData.phone - 전화번호 (숫자 11자리)
 * @returns {Promise<{result_rows: number}>} - 회원 가입 결과 (affectedRows: 1 성공, 0 실패)
 */

/**
 * 회원가입
 */
export const registerMember = async (formData) => {
  const sql = `
        insert into casetibuy_member(name, birthdate, id, pwd, email, phone, mdate)
                                                        values(?,?,?,?,?,?, now())
    `;
  const values = [
    formData.name, // name 컬럼
    formData.birthdate, // birthdate 컬럼
    formData.id, // id 컬럼
    formData.pwd, // pwd 컬럼
    formData.email, // email 컬럼
    formData.phone, // phone 컬럼
  ];
  const [result, fields] = await db.execute(sql, values);

  return { result_rows: result.affectedRows };
};

/**
 * 아이디 중복체크
 */

export const getIdCheck = async ({ id }) => {
  const sql = `
        select count(id) as result from casetibuy_member where id = ?
    `;
  const [result, fields] = await db.execute(sql, [id]);

  return result[0];
};

/**
 * 로그인
 */
export const checkLogin = async ({ id, pwd }) => {
  const sql = `
        select count(*) as result_rows from casetibuy_member where id = ? and pwd = ?
    `;
    const values=[id,pwd];
    const [result] = await db.execute(sql, values);
    
    return result[0];
}

/**
 * 회원 정보 조회
 * @param {string} userId - JWT 토큰에서 추출한 사용자 아이디
 * @returns {Promise<Object>} 회원 정보 객체
 */
export const getUserInfo = async (userId) => {
    const sql = `
        SELECT name, birthdate, id, pwd, email, phone, mdate
        FROM casetibuy_member
        WHERE id = ?
    `;
    const [result] = await db.execute(sql, [userId]);
    return result[0];
}

/**
 * 계정 정보 수정
 * @param {object} formData
 * @param {string} formData.oldId - 기존 아이디 (변경 전)
 * @param {string} formData.newPwd - 변경할 비밀번호
 * @param {string} formData.name - 변경할 이름
 * @param {string} formData.birthdate - 변경할 생년월일
 * @param {string} formData.email - 변경할 이메일
 * @param {string} formData.phone - 변경할 전화번호
 */
export async function updateMember(formData) {
  const connection = await db.getConnection();
  try {
    await connection.beginTransaction();

    const sql = `
                UPDATE casetibuy_member
                  SET pwd = ?,
                      name = ?,
                      birthdate = ?,
                      email = ?,
                      phone = ?,
                      mdate = NOW()
                WHERE id = ?
              `;
    const values = [
      formData.newPwd,
      formData.name,
      formData.birthdate,
      formData.email,
      formData.phone,
      formData.oldId, // WHERE 조건
    ];
    const [result] = await connection.execute(sql, values);

    await connection.commit();
    return { result_rows: result.affectedRows };
  } catch (error) {
    await connection.rollback();
    throw error;
  } finally {
    connection.release();
  }
}

/**
 * 계정 삭제 함수
 * @param {string} userId - 삭제할 사용자 아이디
 * @returns {Promise<Object>} 삭제 결과 (affectedRows)
 */
export const deleteMember = async (userId) => {
  const sql = `DELETE FROM casetibuy_member WHERE id = ?`;
  const [result] = await db.execute(sql, [userId]);
  return result;
};