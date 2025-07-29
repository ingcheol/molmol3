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
              <li><a class="dropdown-item" href="/main/set">세트 착장 모음</a></li>
            </ul>
          </li>

          <!-- SHOP -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdownShop" data-bs-toggle="dropdown"
               aria-expanded="false">Shop</a>
            <ul class="dropdown-menu list-unstyled" aria-labelledby="dropdownShop">
              <li><a href="index.html" class="dropdown-item item-anchor">남성 연예인 의상</a></li>
              <li><a href="index.html" class="dropdown-item item-anchor">여성 연예인 의상</a></li>
              <li><a href="index.html" class="dropdown-item item-anchor">엑세서리</a></li>
            </ul>
          </li>

          <!-- BLOG -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdownBlog" data-bs-toggle="dropdown"
               aria-expanded="false">Blog</a>
            <ul class="dropdown-menu" aria-labelledby="dropdownBlog">
              <li><a class="dropdown-item" href="/blog/star">스타 착용 갤러리</a></li>
              <li><a class="dropdown-item" href="/blog/tip">스타일링 팁</a></li>
              <li><a class="dropdown-item" href="/blog/review">사용자 후기</a></li>
              <li><a class="dropdown-item" href="/blog/video">스타일 영상</a></li>
            </ul>
          </li>

          <!-- PAGES -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="dropdownPages" data-bs-toggle="dropdown"
               aria-expanded="false">Pages</a>
            <ul class="dropdown-menu" aria-labelledby="dropdownPages">
              <li><a class="dropdown-item" href="/mypage">내 정보</a></li>
              <li><a class="dropdown-item" href="/wishlist">찜 목록</a></li>
              <li><a class="dropdown-item" href="/cart">장바구니</a></li>
              <li><a class="dropdown-item" href="/orders">주문 내역</a></li>
              <li><a class="dropdown-item" href="/review/write">리뷰 작성</a></li>
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
<div class="container text-center mt-5">
  <h2>스타 착용 갤러리</h2>
  <p>방송, 공항, SNS 속 연예인 착장을 한눈에 확인해보세요!</p>

  <div class="row mt-4">
    <div class="col-md-4">
      <div class="card">
        <img src="/image/banner-image-1.jpg" class="card-img-top" alt="아이유 가방">
        <div class="card-body">
          <h5 class="card-title">카리나</h5>
          <p class="card-text">꾸안꾸 느낌 강조, 가방은 깔끔한 포인트</p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card">
        <img src="/image/banner-image-2.jpg" class="card-img-top" alt="장원영 드레스">
        <div class="card-body">
          <h5 class="card-title">윈터</h5>
          <p class="card-text">몸매 라인 강조 + 우아한 분위기</p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card">
        <img src="/image/banner-image-3.jpg" class="card-img-top" alt="카리나 공항패션">
        <div class="card-body">
          <h5 class="card-title">카리나</h5>
          <p class="card-text">시크한 블랙톤 + Y2K 느낌의 비니 착장</p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card">
        <img src="/image/banner-image-4.jpg" class="card-img-top" alt="카리나 공항패션">
        <div class="card-body">
          <h5 class="card-title">슬기</h5>
          <p class="card-text">무대에서 돋보이는 시크+섹시한 레이어드 스타일</p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card">
        <img src="/image/banner-image-5.jpg" class="card-img-top" alt="카리나 공항패션">
        <div class="card-body">
          <h5 class="card-title">윈터</h5>
          <p class="card-text">힙한 무드 가득한 Y2K 스트릿 감성</p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card">
        <img src="/image/banner-image-6.jpg" class="card-img-top" alt="카리나 공항패션">
        <div class="card-body">
          <h5 class="card-title">지우</h5>
          <p class="card-text">하이힐과 매치한 고급스러운 무드의 룸웨어 스타일</p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card">
        <img src="/image/banner-image-7.jpg" class="card-img-top" alt="카리나 공항패션">
        <div class="card-body">
          <h5 class="card-title">윈터</h5>
          <p class="card-text">강렬한 태양 아래, 시크함이 돋보이는 하이패션 무드</p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card">
        <img src="/image/banner-image-8.jpg" class="card-img-top" alt="카리나 공항패션">
        <div class="card-body">
          <h5 class="card-title">슬기</h5>
          <p class="card-text">청량한 블루톤으로 완성한 데일리 스쿨걸 스타일</p>
        </div>
      </div>
    </div>


  </div>
</div>

<!-- ✅ Bootstrap 기능 작동을 위한 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
