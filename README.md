# 🧑‍💻 팀명 : [3조]

## 📌 프로젝트명 : [깔롱드]

---

## 👥 팀원
- 🧑 [김형경] 
- 🧑 [신인철] 
- 🧑 [이태준] 
  

---

## 🎯 주제
> [연애인들의 착용 상품들을 ]

---

## 🛠 사용 기술

### ✅ Frontend
- HTML / CSS / JavaScript
- JSP
- Bootstrap

### ✅ Backend
- Java (Spring Framework)
- MyBatis

### ✅ Database
- MySQL

### ✅ Tools
- IntelliJ / GitHub 

---

## 💡 주요 기능 (Features)
🛒 쇼핑 기능
상품 카테고리별 조회: 상단 메뉴에서 상의/하의/가방/신발 등 카테고리 클릭 시 해당 상품 목록 조회

상품 상세 보기: 상품 이미지, 가격, 설명, 수량 선택 및 장바구니/찜 담기 가능

장바구니 기능 (Cart): 상품 수량 조절, 개별/전체 삭제, 총액 계산 후 주문 이동 가능

👤 회원 기능
회원가입/로그인/로그아웃: cust 테이블과 연동된 로그인 기능 (세션 기반 인증)

회원정보 자동 반영: 주문 시 로그인된 고객 정보(cust_id, address, name, phone) 자동 불러오기

🛍 주문 및 결제
주문 처리: 장바구니 기반으로 주문 요청 시 order_product, order_detail 테이블에 데이터 삽입

결제 처리: 주문과 동시에 payment 테이블에 결제 정보 저장 (결제 수단은 단일 방식)

배송지 자동 입력: 회원가입 시 저장된 배송지 주소가 checkout 페이지에 자동으로 반영

주문 완료 처리: 주문 완료 시 장바구니 초기화 및 success.jsp로 리다이렉트

⚙ 관리자 기능 (관리자 계정 전용)
상품 등록/수정/삭제: admin 계정으로 로그인 시 상품 관리 페이지에서 상품 직접 등록 및 수정 가능

카테고리 관리: 상품 등록 시 카테고리와 연동되는 구조로 설계됨

📄 기타 기능
내 정보 보기: /pages/information 경로에서 로그인된 사용자의 정보 확인 가능

찜/주문 목록 페이지: 각각  /cart, /pages/orders를 통해 접근 가능



---

## 😎 메인 화면

![메인화면](src/main/resources/static/image/mainimage.png)  


---

