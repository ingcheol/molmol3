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
<div class="container mt-5">
  <h2 class="text-center fw-bold mb-4" style="letter-spacing: 1px;">스타일링 팁</h2>
  <p class="text-center text-muted mb-5">일상 속에서도 스타일리시하게! 연예인처럼 연출할 수 있는 꿀팁 모음</p>

  <div class="row g-4">
    <div class="col-md-4">
      <div class="card h-100 shadow-sm border-0">
        <img src="/image/blog/blog1.jpg" class="card-img-top" alt="레이어드 팁">
        <div class="card-body">
          <h5 class="card-title fw-semibold">레이어드의 정석</h5>
          <p class="card-text">셔츠 위에 니트를 걸치거나 얇은 자켓을 더해보세요. 계절감을 살리면서도 멋스러워집니다.</p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card h-100 shadow-sm border-0">
        <img src="/image/blog/blog2.jpg" class="card-img-top" alt="컬러 팁">
        <div class="card-body">
          <h5 class="card-title fw-semibold">컬러 매치 꿀팁</h5>
          <p class="card-text">한 톤 또는 보색 조합으로 스타일을 통일하세요. 간단한 룩도 세련돼 보여요.</p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card h-100 shadow-sm border-0">
        <img src="/image/blog/blog3.jpg" class="card-img-top" alt="악세서리 팁">
        <div class="card-body">
          <h5 class="card-title fw-semibold">악세서리로 포인트 주기</h5>
          <p class="card-text">심플한 옷엔 큰 귀걸이, 반짝이는 네크리스 하나면 분위기가 확 달라져요.</p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card h-100 shadow-sm border-0">
        <img src="/image/blog/blog4.jpg" class="card-img-top" alt="모노톤 팁">
        <div class="card-body">
          <h5 class="card-title fw-semibold">모노톤의 세련미</h5>
          <p class="card-text">블랙, 화이트, 그레이의 조합은 언제나 정답! 클래식한 무드를 완성합니다.</p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card h-100 shadow-sm border-0">
        <img src="/image/blog/blog5.jpg" class="card-img-top" alt="포인트 아이템 팁">
        <div class="card-body">
          <h5 class="card-title fw-semibold">포인트 아이템 활용</h5>
          <p class="card-text">전체 코디가 밋밋할 땐, 독특한 신발이나 가방 하나로 포인트를 줘보세요.</p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card h-100 shadow-sm border-0">
        <img src="/image/blog/blog6.jpg" class="card-img-top" alt="꾸안꾸 팁">
        <div class="card-body">
          <h5 class="card-title fw-semibold">꾸안꾸의 미학</h5>
          <p class="card-text">트레이닝복도 핏과 매치만 잘하면 ‘꾸민 듯 안 꾸민 듯’한 매력이 뿜뿜!</p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card h-100 shadow-sm border-0">
        <img src="/image/blog/blog7.jpg" class="card-img-top" alt="핏 팁">
        <div class="card-body">
          <h5 class="card-title fw-semibold">핏은 곧 완성도</h5>
          <p class="card-text">자신의 체형에 맞는 핏을 찾는 게 가장 중요해요. 어깨선, 기장, 전체 밸런스를 고려하세요.</p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card h-100 shadow-sm border-0">
        <img src="/image/blog/blog8.jpg" class="card-img-top" alt="선글라스 팁">
        <div class="card-body">
          <h5 class="card-title fw-semibold">선글라스의 마법</h5>
          <p class="card-text">단 하나만으로도 룩을 완성시키는 선글라스, 얼굴형에 맞게 고르는 센스를 발휘해봐요!</p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card h-100 shadow-sm border-0">
        <img src="/image/blog/blog9.jpg" class="card-img-top" alt="신발 코디 팁">
        <div class="card-body">
          <h5 class="card-title fw-semibold">신발로 마무리</h5>
          <p class="card-text">옷이 완벽해도 신발이 흐트러지면 전체 인상이 망가져요. 끝은 발끝에서 결정됩니다.</p>
        </div>
      </div>
    </div>
  </div>
</div>



<!-- ✅ Bootstrap 기능 작동을 위한 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
