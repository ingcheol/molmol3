<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- 날짜 포맷용 --%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>상품 리스트</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
  <h2 class="mb-4">📦 상품 목록</h2>

  <table class="table table-bordered align-middle text-center">
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
    <c:forEach var="p" items="${products}">
      <tr>
        <td>
          <img src="/image/${p.image}" alt="${p.productName}" style="width: 100px; height: 100px; object-fit: cover;">
        </td>
        <td>${p.productName}</td>
        <td>₩${p.productPrice}</td>
        <td>${p.cateName}</td>
        <td>
          <fmt:formatDate value="${p.regDate}" pattern="yyyy-MM-dd HH:mm" />
        </td>
        <td>
          <fmt:formatDate value="${p.updateDate}" pattern="yyyy-MM-dd HH:mm" />
        </td>
        <td>
          <a href="/admin/product/edit?productId=${p.productId}" class="btn btn-sm btn-warning">수정</a>
          <a href="/admin/product/delete?productId=${p.productId}" class="btn btn-sm btn-danger"
             onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>

  <div class="text-end mt-3">
    <a href="/admin/product/add" class="btn btn-primary">+ 상품 등록</a>
  </div>
</div>

</body>
</html>
