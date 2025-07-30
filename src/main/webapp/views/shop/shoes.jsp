<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<div class="container mt-3">
  <a href="/" class="btn btn-secondary">&larr; 홈으로</a>
</div>
<div class="container mt-5">
  <h2 class="text-center mb-4">신발 상품 리스트</h2>
  <div class="row row-cols-1 row-cols-md-3 g-4">
    <c:forEach var="p" items="${plist}">
      <div class="col">
        <div class="card h-100 shadow-sm">
          <img src="${p.image}" class="card-img-top" style="height:300px; object-fit:contain;" alt="${p.productName}">
          <div class="card-body text-center">
            <h6 class="text-muted">${p.cateName}</h6>
            <h5>${p.productName}</h5>
            <p class="fw-bold text-primary">
              <fmt:formatNumber value="${p.productPrice}" type="number" pattern="#\,###원"/>
            </p>
            <a href="/product/see?productId=${p.productId}" class="btn btn-outline-primary btn-sm">상세 보기</a>

          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>


<!-- ✅ Bootstrap 기능 작동을 위한 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
