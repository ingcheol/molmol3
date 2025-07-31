<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/header.jsp" />


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


<!-- ✅ 본문 내용 -->
<div class="mb-3 d-flex justify-content-between">
  <div>
    <a href="/" class="btn btn-secondary">홈으로</a>
  </div>
<div class="container text-center mt-5">
  <h2>스타 INSTAGRAM</h2>
  <p>방송, 공항, SNS 속 연예인 착장을 인스타로 한눈에 확인해보세요!</p>
  <p>이미지를 클릭하세요!</p>

  <div class="row mt-4">

    <!-- 1. 카리나 -->
    <div class="col-md-4">
      <div class="card">
        <a href="https://www.instagram.com/katarinabluu/" target="_blank">
          <img src="/image/banner-image-1.jpg" class="card-img-top" alt="카리나">
        </a>
        <div class="card-body">
          <h5 class="card-title">카리나</h5>
        </div>
      </div>
    </div>

    <!-- 2. 윈터 -->
    <div class="col-md-4">
      <div class="card">
        <a href="https://www.instagram.com/imwinter/" target="_blank">
          <img src="/image/banner-image-2.jpg" class="card-img-top" alt="윈터">
        </a>
        <div class="card-body">
          <h5 class="card-title">윈터</h5>
        </div>
      </div>
    </div>

    <!-- 3. 슬기 -->
    <div class="col-md-4">
      <div class="card">
        <a href="https://www.instagram.com/hi_sseulgi/" target="_blank">
          <img src="/image/banner-image-4.jpg" class="card-img-top" alt="슬기">
        </a>
        <div class="card-body">
          <h5 class="card-title">슬기</h5>
        </div>
      </div>
    </div>

    <!-- 4. 지우 -->
    <div class="col-md-4">
      <div class="card">
        <a href="https://www.instagram.com/jiwoo_nmixx/" target="_blank">
          <img src="/image/banner-image-6.jpg" class="card-img-top" alt="지우">
        </a>
        <div class="card-body">
          <h5 class="card-title">지우</h5>
        </div>
      </div>
    </div>

    <!-- 5. 아이유 -->
    <div class="col-md-4">
      <div class="card">
        <a href="https://www.instagram.com/dlwlrma/" target="_blank">
          <img src="/image/banner-image-9.jpg" class="card-img-top" alt="아이유">
        </a>
        <div class="card-body">
          <h5 class="card-title">아이유</h5>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card">
        <a href="https://www.instagram.com/for_everyoung10/" target="_blank">
          <img src="/image/banner-image-10.jpg" class="card-img-top" alt="장원영">
        </a>
        <div class="card-body">
          <h5 class="card-title">장원영</h5>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card">
        <a href="https://www.instagram.com/reinyourheart/" target="_blank">
          <img src="/image/banner-image-11.jpg" class="card-img-top" alt="레이">
        </a>
        <div class="card-body">
          <h5 class="card-title">레이</h5>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card">
        <a href="https://www.instagram.com/igotyuandme/" target="_blank">
          <img src="/image/banner-image-12.jpg" class="card-img-top" alt="유나">
        </a>
        <div class="card-body">
          <h5 class="card-title">유나</h5>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card">
        <a href="https://www.instagram.com/chaengrang_/" target="_blank">
          <img src="/image/banner-image-13.jpg" class="card-img-top" alt="이채영">
        </a>
        <div class="card-body">
          <h5 class="card-title">이채영</h5>
        </div>
      </div>
    </div>

  </div>
</div>


<!-- ✅ Bootstrap 기능 작동을 위한 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
