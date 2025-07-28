<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>${product.title} | 스타 착용 아이템</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .product-img {
      width: 100%;
      max-width: 500px;
      object-fit: cover;
      border-radius: 12px;
    }
    .item-check {
      margin-bottom: 30px;
      border-bottom: 1px solid #eee;
      padding-bottom: 15px;
    }
    .price {
      color: #c0392b;
      font-weight: bold;
    }
    .btn-group .btn {
      min-width: 120px;
    }
    .option-select {
      margin-top: 10px;
    }
  </style>
</head>
<body>
<div class="container py-5">
  <div class="row">
    <!-- 좌측 이미지 -->
    <div class="col-md-6 text-center">
      <img src="/image/${product.image}" alt="${product.title}" class="product-img shadow">
    </div>

    <!-- 우측 상품 선택 영역 -->
    <div class="col-md-6">
      <h3 class="mb-3">${product.title}</h3>
      <p class="text-muted mb-4">${product.description}</p>

      <!-- 체크박스 리스트 -->
      <c:forEach var="item" items="${product.items}">
        <div class="item-check form-check">
          <input class="form-check-input" type="checkbox" id="${item.id}">
          <label class="form-check-label" for="${item.id}">
            <strong>${item.name}</strong><br>
            <small>${item.desc}</small><br>
            <span class="price">₩${item.price}</span>
          </label>

          <!-- 개별 옵션 -->
          <div class="option-select">
            <div class="row">
              <div class="col-6">
                <select class="form-select">
                  <option selected>컬러</option>
                  <option>아이보리</option>
                  <option>블랙</option>
                  <option>네이비</option>
                </select>
              </div>
              <div class="col-6">
                <select class="form-select">
                  <option selected>사이즈</option>
                  <option>S</option>
                  <option>M</option>
                  <option>L</option>
                  <option>XL</option>
                  <option>XXL</option>
                </select>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>

      <!-- 하단 버튼 -->
      <div class="mt-4 btn-group d-flex justify-content-between">
        <a href="/" class="btn btn-outline-primary">메인으로</a>
        <button class="btn btn-outline-dark">❤️</button>
        <button class="btn btn-outline-secondary">장바구니</button>
        <button class="btn btn-dark">구매하기</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>
