import { db } from "./db.js";

/**
 * 상품 등록
 */

export const registerProduct = async (formData) => {
    const sql = `
        insert into casetibuy_product(pname,kinds, isnew, ishot, isrec, isColab, repImage, upload_file, source_file, pdate)
            values(?,?,?,?,?,?,?,?,?,now())
    `;
    const values = [
        formData.productname,
        formData.kinds,
        formData.isNew || false,
        formData.isHot || false,
        formData.isRec || false,     
        formData.isColab || false, 
        formData.repImage || null,  
        formData.uploadFile || null,
        formData.sourceFile || null
    ];
    const [result] = await db.execute(sql, values);
    return { "result_rows": result.affectedRows };
}

/**
 * 전체 상품 리스트 조회
 */
export const getList = async () => {
    const sql = `
        select pid,
               pname as name,
               kinds,
               isNew,
               isHot,
               isRec,
               isColab,
               repImage,
               upload_file,
               source_file,
               pdate
         from casetibuy_product
    `;
    const [result] = await db.execute(sql);

    return result;
}

/**
 * 상품 상세 정보 조회
 */
export const getProduct = async (pid) => {
    const sql = `
                SELECT 
                    pid,
                    pname as name,
                    kinds,
                    repImage,
                    upload_file as image,                                   
                    source_file as sourceFile,
                    pdate
                FROM
                    casetibuy_product
                WHERE
                    pid = ?
    `;

    const [result] = await db.execute(sql, [pid]); // result = [[{pid:4,~~}],[컬럼명 fields]]
    return result[0];
}

/**
 * 검색 결과 조회
 */
export const getSearch = async (search) => {
    const sql = `
      SELECT 
        pid,
        pname AS name,
        kinds,
        isNew,
        isHot,
        isRec,
        isColab,
        repImage,
        upload_file,
        source_file,
        pdate
      FROM casetibuy_product
      WHERE pname LIKE ?
    `;
    // %search% 형태로 전달하여 부분 일치를 처리
    const [result] = await db.execute(sql, [`%${search}%`]);
    return result;
  }

