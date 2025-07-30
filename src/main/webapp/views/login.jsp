<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>ONLYPETS - 스타 착용 갤러리</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">

  <style>
    .card-img-top {
      width: 100%;
      height: 300px;
      object-fit: contain;
      background-color: white;
      display: block;
      margin: 0 auto;
    }

    .card {
      margin-bottom: 30px;
      border: none;
    }
    .card-body {
      text-align: center;
    }

    <!-- 상단 메뉴 스타일 -->
    .highlight-link {
      color: #007bff !important;
      text-decoration: underline !important;
      font-weight: bold !important;
    }

    body {
      font-family: sans-serif;
      background-color: #f5f5f5;
    }

    .form-field {
      width: 100%;
      padding: 10px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
    }

    .error-msg {
      color: red;
      margin-bottom: 10px;
      font-size: 14px;
    }

    .modal-backdrop {
      display: none;
      position: fixed;
      top: 0; left: 0;
      width: 100vw; height: 100vh;
      background-color: rgba(0, 0, 0, 0.5);
      justify-content: center;
      align-items: center;
      z-index: 999;
    }

    .modal-box {
      background-color: white;
      width: 500px;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
      position: relative;
    }

    .modal-title {
      font-size: 20px;
      font-weight: bold;
      margin-bottom: 10px;
    }

    .close-btn {
      position: absolute;
      top: 12px;
      right: 15px;
      font-size: 20px;
      font-weight: bold;
      cursor: pointer;
    }


  </style>
</head>
<body>

<!-- ✅ 상단 네비게이션 (메인과 동일) -->
<nav class="navbar navbar-expand-lg bg-light text-uppercase fs-6 p-3 border-bottom align-items-center">
  <div class="container-fluid">
    <div class="row justify-content-between align-items-center w-100">
      <div class="col-auto">
        <span class="navbar-brand" style="
                font-size: 32px;
                font-weight: bold;
                background: linear-gradient(90deg, #FF6B6B, #FFA63D);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;">
          깔롱드
        </span>
      </div>
    </div>

    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
            aria-controls="offcanvasNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
         aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menu</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                aria-label="Close"></button>
      </div>

      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-end flex-grow-1 gap-1 gap-md-5 pe-3">
          <!-- HOME -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle active" href="#" id="dropdownHome" data-bs-toggle="dropdown"
               aria-expanded="false">Home</a>
            <ul class="dropdown-menu" aria-labelledby="dropdownHome">
              <li><a class="dropdown-item" href="/main/best">베스트 착장</a></li>
              <li><a class="dropdown-item" href="/main/new">신상 착장</a></li>
            </ul>
          </li>

          <!-- SHOP -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdownShop" data-bs-toggle="dropdown"
               aria-expanded="false">Shop</a>
            <ul class="dropdown-menu list-unstyled" aria-labelledby="dropdownShop">
              <li><a href="/shop/top" class="dropdown-item item-anchor">상의</a></li>
              <li><a href="/shop/bottom" class="dropdown-item item-anchor">하의</a></li>
              <li><a href="/shop/hat" class="dropdown-item item-anchor">모자</a></li>
              <li><a href="/shop/shoes" class="dropdown-item item-anchor">신발</a></li>
              <li><a href="/shop/bag" class="dropdown-item item-anchor">가방</a></li>
              <li><a href="/shop/accessory" class="dropdown-item item-anchor">악세사리</a></li>
            </ul>
          </li>

          <!-- BLOG -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdownBlog" data-bs-toggle="dropdown"
               aria-expanded="false">Blog</a>
            <ul class="dropdown-menu list-unstyled" aria-labelledby="dropdownBlog">
              <li><a href="/blog/star" class="dropdown-item item-anchor">스타 INSTAGRAM</a></li>
              <li><a href="/blog/tip" class="dropdown-item item-anchor">스타일링 팁</a></li>
              <li><a href="/blog/review" class="dropdown-item item-anchor">사용자 후기</a></li>
              <li><a href="/blog/video" class="dropdown-item item-anchor">스타일 영상</a></li>
            </ul>
          </li>

          <!-- PAGES -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdownPages" data-bs-toggle="dropdown"
               aria-expanded="false">Pages</a>
            <ul class="dropdown-menu list-unstyled" aria-labelledby="dropdownPages">
              <li><a href="/pages/information" class="dropdown-item item-anchor">내 정보</a></li>
              <li><a href="/wishlist" class="dropdown-item item-anchor">찜 목록</a></li>
              <li><a href="/cart" class="dropdown-item item-anchor">장바구니</a></li>
              <li><a href="/pages/orders" class="dropdown-item item-anchor">주문 내역</a></li>
              <li><a href="/pages/review" class="dropdown-item item-anchor">리뷰 작성</a></li>
            </ul>
          </li>

          <!-- WISHLIST, CART, LOGIN -->
          <li class="nav-item">
            <a class="nav-link highlight-link" href="/wishlist">WISHLIST(0)</a>
          </li>
          <li class="nav-item">
            <a class="nav-link highlight-link" href="/cart">CART(0)</a>
          </li>
          <li class="nav-item">
            <a class="nav-link highlight-link" href="/login">LOGIN</a>
          </li>

        </ul>
      </div>
    </div>
  </div>
</nav>


<!-- ✅ 본문 내용 -->
<div>
  <a href="/" class="btn btn-secondary">홈으로</a>
</div>
<title>로그인</title>
<div style="width: 400px; margin: 100px auto;">
  <h2 style="text-align: left;">로그인</h2>

  <c:if test="${loginstate eq 'fail'}">
    <div class="error-msg">아이디 또는 비밀번호가 잘못되었습니다.</div>
  </c:if>

  <form action="/loginimpl" method="post">
    <input type="text" name="id" placeholder="아이디" class="form-field"/>
    <input type="password" name="pwd" placeholder="비밀번호" class="form-field"/>

    <div style="display: flex; justify-content: space-between; align-items: center; font-size: 14px;">
      <label><input type="checkbox" name="remember"/> 아이디 저장</label>
      <div>
        <a href="#" onclick="openModal('signup')">회원가입</a>
      </div>
    </div>

    <button type="submit"
            style="width: 100%; padding: 12px; background-color: #ff4d4d; color: white; font-weight: bold; border: none; margin-top: 20px;">
      로그인
    </button>
  </form>
</div>

<!-- 회원가입 모달 -->
<div id="popupModal" class="modal-backdrop">
  <div class="modal-box">
    <span class="close-btn" onclick="closeModal()">&times;</span>
    <div id="modalContent"></div>
  </div>
</div>

<script>
  function openModal(type) {
    const modal = document.getElementById("popupModal");
    const content = document.getElementById("modalContent");

    if (type === 'signup') {
      content.innerHTML = `
        <form action="/registerimpl" method="post">
          <div class="modal-title">회원가입</div>
          <input name="custId" class="form-field" placeholder="아이디" required />
          <input name="custPwd" type="password" class="form-field" placeholder="비밀번호" required />
          <input name="custName" class="form-field" placeholder="이름" required />
          <input name="custPhone" class="form-field" placeholder="전화번호" required />
          <input name="custEmail" type="email" class="form-field" placeholder="이메일" required />
          <input name="address" class="form-field" placeholder="주소" required />
          <div style="text-align: right; margin-top: 15px;">
            <button type="submit">가입 완료</button>
          </div>
        </form>
      `;
      modal.style.display = "flex";
    }
  }

  function closeModal() {
    document.getElementById("popupModal").style.display = "none";
  }
</script>

  <!-- ✅ Bootstrap 기능 작동을 위한 JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

