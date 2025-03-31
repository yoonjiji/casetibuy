import * as repository from "../repository/memberRepository.js";
import jwt from "jsonwebtoken";

/**
 * 아이디 중복체크
 */
export const getIdCheck = async (req, res) => {
  // console.log('id ===', req.body)
  const result = await repository.getIdCheck(req.body);
  res.json(result);
  res.end();
};

/**
 * 회원가입
 */
export const registerMember = async (req, res) => {
  console.log("req.body -->", req.body);
  const result = await repository.registerMember(req.body);
  res.json(result);
  res.end();
};

/**
 * 로그인
 */
export const checkLogin = async (req, res) => {
  let result = await repository.checkLogin(req.body);
  if (result.result_rows === 1) {
    const userId = req.body.id; // <<< 지혜 / 추가 : 로컬에 넣을 아이디 값 >>>
    const token = jwt.sign({ userId: req.body.id }, "64dAeD");
    result = { ...result, id: userId, token: token }; // <<< 지혜 / 추가 : 로컬에 넣을 아이디 값 >>>
  }

  res.json(result);
  res.end();
};

/**
 * 회원 정보 조회 (/member/userinfo)
 */
export const getUserInfo = async (req, res) => {
  const authHeader = req.headers.authorization;
  if (!authHeader) {
    res.status(401).json({ error: "토큰이 제공되지 않았습니다." });
    return;
  }
  const token = authHeader.split(" ")[1];
  try {
    const decoded = jwt.verify(token, "64dAeD");
    const userId = decoded.userId;
    const userInfo = await repository.getUserInfo(userId);
    if (userInfo) {
      res.json(userInfo);
    } else {
      res.status(404).json({ error: "사용자 정보를 찾을 수 없습니다." });
    }
  } catch (error) {
    res.status(401).json({ error: "유효하지 않은 토큰입니다." });
  }
  res.end();
};

/**
 * 현재 비밀번호 검증
 */
export const checkPassword = async (req, res) => {
  try {
    // 클라이언트가 전송한 현재 비밀번호
    const { currentPassword } = req.body;

    // 요청 헤더의 토큰 -> userId 추출
    const authHeader = req.headers.authorization;
    if (!authHeader) {
      return res.status(401).json({ error: "토큰이 제공되지 않았습니다." });
    }
    const token = authHeader.split(" ")[1];
    const decoded = jwt.verify(token, "64dAeD");
    const userId = decoded.userId;

    // DB에서 userId로 사용자 정보 조회
    const userInfo = await repository.getUserInfo(userId);
    if (!userInfo) {
      return res.status(404).json({ error: "사용자 정보를 찾을 수 없습니다." });
    }

    // DB의 비밀번호와 비교
    if (userInfo.pwd === currentPassword) {
      res.json({ match: true });
    } else {
      res.json({ match: false });
    }
  } catch (error) {
    console.error("비밀번호 확인 중 오류 발생:", error);
    res.status(500).json({ error: "비밀번호 확인 중 오류 발생" });
  }
};

export const updateMember = async (req, res) => {
  try {
    const authHeader = req.headers.authorization;
    if (!authHeader) {
      return res.status(401).json({ error: "토큰이 제공되지 않았습니다." });
    }

    const token = authHeader.split(" ")[1];
    const decoded = jwt.verify(token, "64dAeD");
    const userId = decoded.userId; // 로그인 중인 사용자 아이디

    // request body에서 아이디(newId)는 제거
    // req.body: { currentId, name, birthdate, email, phone, currentPassword, newPassword }
    const {
      currentId,
      name,
      birthdate,
      email,
      phone,
      currentPassword,
      newPassword,
    } = req.body;

    // DB에서 현재 사용자 정보 조회
    const userInfo = await repository.getUserInfo(userId);
    if (!userInfo) {
      return res.status(404).json({ error: "사용자 정보를 찾을 수 없습니다." });
    }

    // 혹시 사용자 id 불일치 시
    if (userId !== userInfo.id) {
      return res.status(403).json({ error: "권한이 없습니다." });
    }

    // 필요한 필드만 업데이트: 아이디는 고정(userInfo.id)
    const finalName = name || userInfo.name;
    const finalBirth = birthdate || userInfo.birthdate;
    const finalEmail = email || userInfo.email;
    const finalPhone = phone || userInfo.phone;
    const finalPwd = newPassword ? newPassword : userInfo.pwd;

    // 레포지토리 함수 호출 (UPDATE 쿼리)
    const updateResult = await repository.updateMember({
      oldId: userInfo.id,     // 변경 없이 그대로 사용
      newPwd: finalPwd,
      name: finalName,
      birthdate: finalBirth,
      email: finalEmail,
      phone: finalPhone,
    });

    if (updateResult.result_rows > 0) {
      return res.status(200).json({ message: "계정 정보 수정 성공" });
    } else {
      return res.status(500).json({ error: "계정 정보 수정 실패" });
    }
  } catch (error) {
    console.error("updateMember error:", error);
    return res.status(500).json({ error: "계정 정보 수정 중 오류가 발생했습니다." });
  }
};

/**
 * 계정 삭제
 */
export const deleteMember = async (req, res) => {
  try {
    const authHeader = req.headers.authorization;
    if (!authHeader) {
      return res.status(401).json({ error: "토큰이 제공되지 않았습니다." });
    }
    const token = authHeader.split(" ")[1];
    const decoded = jwt.verify(token, "64dAeD");
    const userId = decoded.userId;

    // DB에서 해당 사용자 삭제 (repository 함수 호출)
    const result = await repository.deleteMember(userId);
    if (result.affectedRows > 0) {
      return res.status(200).json({ message: "계정이 삭제되었습니다." });
    } else {
      return res.status(500).json({ error: "계정 삭제 실패" });
    }
  } catch (error) {
    console.error("deleteMember error:", error);
    return res.status(500).json({ error: "계정 삭제 중 오류가 발생했습니다." });
  }
};