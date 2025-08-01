<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/header.jsp" />

<!DOCTYPE html>
<html>
<head>
  <title>상품 목록</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
  <h2>상품 목록</h2>

  <!-- 홈 + 등록 버튼 -->
  <div class="mb-3 d-flex justify-content-between">
    <div>
      <a href="/admin/product/add" class="btn btn-primary">상품 등록</a>
    </div>
  </div>

  <table class="table table-bordered text-center align-middle">
    <thead class="table-dark">
    <tr>
      <th>이미지</th>
      <th>상품명</th>
      <th>가격</th>
      <th>카테고리</th>
      <th>등록일</th>
      <th>수정일</th>
      <th>관리</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${products}">
      <tr>
        <!-- 첫 번째 이미지 출력 -->
        <td>
          <c:choose>
            <c:when test="${not empty product.images}">
              <img src="${product.images[0].productImgUrl}" width="80" height="80"/>
            </c:when>
            <c:otherwise>
              <span>이미지 없음</span>
            </c:otherwise>
          </c:choose>
        </td>
        <td>${product.productName}</td>
        <td>₩${product.productPrice}</td>
        <td>${product.cateName}</td>
        <td>${product.regDate}</td>
        <td>${product.updateDate}</td>
        <td class="d-flex gap-1 justify-content-center">
          <a href="/admin/product/edit?productId=${product.productId}" class="btn btn-warning btn-sm">수정</a>
          <form action="/admin/product/delete" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
            <input type="hidden" name="productId" value="${product.productId}">
            <button type="submit" class="btn btn-danger btn-sm">삭제</button>
          </form>
        </td>

      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

</body>
</html>
