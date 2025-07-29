<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>상품 수정</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h2>상품 수정</h2>
  <form action="/admin/product/edit" method="post" enctype="multipart/form-data">
    <!-- ID는 수정 불가하므로 hidden 처리 -->
    <input type="hidden" name="productId" value="${product.productId}"/>

    <div class="mb-3">
      <label for="productName" class="form-label">상품명</label>
      <input type="text" class="form-control" id="productName" name="productName" value="${product.productName}" required>
    </div>

    <div class="mb-3">
      <label for="productPrice" class="form-label">가격</label>
      <input type="number" class="form-control" id="productPrice" name="productPrice" value="${product.productPrice}" required>
    </div>

    <div class="mb-3">
      <label for="cateId" class="form-label">카테고리 ID</label>
      <input type="text" class="form-control" id="cateId" name="cateId" value="${product.cateId}">
    </div>

    <!-- 이미지 미리보기 -->
    <c:if test="${not empty product.images}">
      <div class="mb-3">
        <label class="form-label">기존 이미지</label>
        <div>
          <c:forEach var="img" items="${product.images}">
            <img src="${img.productImgUrl}" alt="이미지" width="100" class="me-2 mb-2"/>
          </c:forEach>
        </div>
      </div>
    </c:if>

    <!-- 이미지 업로드 -->
    <div class="mb-3">
      <label for="imageFile" class="form-label">추가 이미지 업로드</label>
      <input type="file" class="form-control" id="imageFile" name="imageFile" accept="image/*">
    </div>

    <button type="submit" class="btn btn-primary">수정 완료</button>
    <a href="/admin/product/list" class="btn btn-secondary">목록으로</a>
  </form>
</div>
</body>
</html>
