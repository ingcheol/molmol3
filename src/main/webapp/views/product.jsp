<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    .thumbnail-img {
      width: 80px;
      height: 80px;
      object-fit: cover;
      border-radius: 6px;
      cursor: pointer;
      transition: 0.2s;
    }
    .thumbnail-img:hover {
      transform: scale(1.05);
    }
  </style>
</head>
<body>
<div class="container py-5">
<div class="row">
<!-- 좌측 이미지 -->
<div class="col-md-6 text-center">
  <c:choose>
    <c:when test="${not empty product.images}">
      <!-- 대표 이미지 (첫 번째) -->
      <img src="/image/pdimage/${product.images[0].productImgUrl}" alt="${product.productName}" class="product-img shadow mb-3"/>

      <!-- 썸네일 리스트 -->
      <div class="d-flex justify-content-center gap-2 flex-wrap">
        <c:forEach var="img" items="${product.images}">
          <img src="/image/pdimage/${img.productImgUrl}" alt="썸네일"
               class="thumbnail-img"/>
        </c:forEach>
      </div>
    </c:when>
    <c:otherwise>
      <img src="/image/default.jpg" alt="No Image" class="product-img shadow"/>
    </c:otherwise>
  </c:choose>
</div>

<!-- 우측 상품 선택 영역 -->
<div class="col-md-6">
<h3 class="mb-3">${product.title}</h3>
<p class="text-muted mb-4">${product.description}</p>

<!-- 체크박스 구성품 -->
<c:forEach var="item" items="${product.items}">
  <div class="item-check form-check">
  <input class="form-check-input" type="checkbox" id="${item.id}">
  <label class="form-check-label" for="${item.id}">
  <strong>${item.name}</strong><br>
  <small>${item.desc}</small><br>
  <span
