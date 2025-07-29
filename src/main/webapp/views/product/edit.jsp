<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>상품 수정</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
  <h2>상품 수정</h2>

  <form action="/admin/product/edit" method="post" enctype="multipart/form-data">
    <input type="hidden" name="productId" value="${product.productId}">

    <!-- 🔹 상품명 -->
    <div class="mb-3">
      <label class="form-label">상품명</label>
      <input type="text" name="productName" value="${product.productName}" class="form-control" required>
    </div>

    <!-- 🔹 가격 -->
    <div class="mb-3">
      <label class="form-label">가격</label>
      <input type="number" name="productPrice" value="${product.productPrice}" class="form-control" required>
    </div>

    <!-- 🔹 카테고리 선택 -->
    <div class="mb-3">
      <label class="form-label">카테고리</label>
      <select name="cateId" class="form-select" required>
        <c:forEach var="cate" items="${categories}">
          <option value="${cate.cateId}" ${product.cateId == cate.cateId ? 'selected' : ''}>
              ${cate.cateName}
          </option>
        </c:forEach>
      </select>

    </div>

    <!-- 🔹 기존 이미지 보여주기 -->
    <div class="mb-3">
      <label class="form-label">기존 이미지</label><br>
      <c:if test="${not empty product.images}">
        <img src="${product.images[0].productImgUrl}" width="100" height="100" alt="기존 이미지">
      </c:if>
      <c:if test="${empty product.images}">
        <span>이미지 없음</span>
      </c:if>
    </div>

    <!-- 🔹 이미지 새로 선택 -->
    <div class="mb-3">
      <label class="form-label">이미지 변경 (선택)</label>
      <input type="file" name="imageFile" class="form-control">
    </div>

    <!-- 🔹 버튼 -->
    <div class="d-flex justify-content-between">
      <a href="/admin/product/list" class="btn btn-secondary">목록으로</a>
      <button type="submit" class="btn btn-primary">수정 완료</button>
    </div>
  </form>
</div>
</body>
</html>
