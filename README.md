b# Team Project - **Casetibuy**

> **Casetify**를 벤치마킹하여 구현한 쇼핑몰 팀 프로젝트입니다.  
> **React + Node.js + MySQL** 기반의 **풀스택 SPA 쇼핑몰**을 구현하며, 클라이언트-서버-DB 간의 유기적인 연결을 중점으로 개발했습니다.

🔗 [배포 링크 바로가기](http://your-deploy-url.com)

---

## 📎 목차 바로가기

- [🏁 프로젝트 목표](#-프로젝트-목표)
- [👥 팀원 구성](#-팀원-구성)
- [⚙️ 개발 환경 및 스택](#️-개발-환경-및-스택)
- [📌 주요 기능 요약](#-주요-기능-요약)
- [🗂️ ERD / 메뉴 구조도](#-erd--메뉴-구조도)
- [💻 화면 구성](#-화면-구성)

---

## 🏁 **프로젝트 목표**

1. GitHub 기반 **협업 개발 프로세스 경험**
2. **React SPA 구조**로 빠르고 반응형 UI 구현
3. **CRUD 및 이벤트 처리**를 통한 비즈니스 로직 학습
4. **MySQL**을 활용한 데이터베이스 설계 및 연동
5. 클라이언트 ↔ 서버 ↔ DB 간의 **전체 연동 흐름** 이해

---

## 👥 **팀원 구성**

| 이름   | 담당 기능                                   |
| ------ | ------------------------------------------- |
| 정민규 | 상세페이지 / 상품리스트 / 검색 / 리뷰       |
| 강현우 | 로그인 / 회원가입 / 마이페이지 / 결제페이지 |
| 윤지혜 | 홈 / 장바구니                               |

---

## ⚙️ **개발 환경 및 스택**

### 🎨 Frontend

<p>
  <img src="https://img.shields.io/badge/React-61DAFB?style=flat&logo=React&logoColor=white"/>
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=JavaScript&logoColor=black"/>
  <img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white"/>
  <img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=CSS3&logoColor=white"/>
</p>

---

### 🛠️ Backend

<p>
  <img src="https://img.shields.io/badge/Node.js-339933?style=flat&logo=Node.js&logoColor=white"/>
  <img src="https://img.shields.io/badge/Express-000000?style=flat&logo=Express&logoColor=white"/>
  <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=MySQL&logoColor=white"/>
  <img src="https://img.shields.io/badge/MySQLWorkbench-00758F?style=flat&logo=mysql&logoColor=white"/>
</p>

---

### 🤝 Collaboration

<p>
  <img src="https://img.shields.io/badge/Git-F05032?style=flat&logo=Git&logoColor=white"/>
  <img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=GitHub&logoColor=white"/>
  <img src="https://img.shields.io/badge/Notion-000000?style=flat&logo=Notion&logoColor=white"/>
  <img src="https://img.shields.io/badge/Sourcetree-0052CC?style=flat&logo=Sourcetree&logoColor=white"/>
  <img src="https://img.shields.io/badge/VSCode-007ACC?style=flat&logo=VisualStudioCode&logoColor=white"/>
</p>

---

### 🧩 Libraries & Tools

<p>
  <img src="https://img.shields.io/badge/Axios-5A29E4?style=flat&logo=axios&logoColor=white"/>
  <img src="https://img.shields.io/badge/Swiper-6332F6?style=flat&logo=swiper&logoColor=white"/>
  <img src="https://img.shields.io/badge/Styled--Components-DB7093?style=flat&logo=styled-components&logoColor=white"/>
  <img src="https://img.shields.io/badge/CSS%20Modules-000000?style=flat&logo=cssmodules&logoColor=white"/>
  <img src="https://img.shields.io/badge/Nodemailer-34A853?style=flat&logo=gmail&logoColor=white"/>
  <img src="https://img.shields.io/badge/Bcrypt-004088?style=flat"/>
  <img src="https://img.shields.io/badge/JsonWebToken-000000?style=flat&logo=jsonwebtokens&logoColor=white"/>
  <img src="https://img.shields.io/badge/Multer-4A4A4A?style=flat"/>
  <img src="https://img.shields.io/badge/DaumPostcode-FFCD00?style=flat"/>
  <img src="https://img.shields.io/badge/ReCAPTCHA-4285F4?style=flat&logo=Google&logoColor=white"/>
</p>

---

## 📌 **주요 기능 요약**

### 🔐 **회원 관련**

- **로그인/로그아웃** (JWT 토큰 + 세션 관리)
- **회원가입** (유효성 체크)
- **마이페이지** (프로필 관리, 회원 설정, 탈퇴)

### 🛍️ **쇼핑몰 기능**

- **메인 페이지**: 슬라이드 배너, 상품 리스트 출력 (DB 연동)
- **카테고리 페이지**: 페이지네이션
- **상품 상세**: 정보 출력, 별점/리뷰 CRUD
- **장바구니**: 개별/전체 선택, 총가격 계산
- **결제 페이지**: 우편번호 검색, 유효성 검사, KakaoPay API
- **검색 페이지**: 키워드 기반 상품 필터링

---

## 🗂️ **ERD / 메뉴 구조도**

> _※ ERD와 메뉴 트리 이미지 삽입 위치_

---

## 💻 **화면 구성**

1️⃣ 로그인 / 회원가입 </br>
![로그인 / 회원가입](https://github.com/user-attachments/assets/da88b954-8a38-44ba-9010-f3d491710650) </br>

2️⃣ 마이페이지 / 회원설정 / 회원탈퇴 </br>
![mypage](https://github.com/user-attachments/assets/aa5e469a-a533-478e-951a-ca71e52398f7) </br>

3️⃣ 메인페이지 </br>
![home](https://github.com/user-attachments/assets/c311df74-cfe5-483e-86be-440e9b5b2114)</br>

4️⃣ 카테고리별 상품 페이지  
5️⃣ 장바구니 / 결제페이지
6️⃣ 상품 상세페이지
7️⃣ 검색 페이지
8️⃣

---
