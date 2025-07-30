<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>장바구니</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
  <a href="/" class="btn btn-secondary mb-3">&larr; 홈으로</a>
  <h2 class="mb-4">🛒 장바구니</h2>

  <c:choose>
    <c:when test="${empty carts}">
      <p>장바구니가 비어 있습니다.</p>
    </c:when>
    <c:otherwise>
      <table class="table align-middle">
        <thead class="table-light">
        <tr>
          <th>상품</th>
          <th>수량</th>
          <th>가격</th>
          <th>총합</th>
          <th>조작</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${carts}">
          <tr>
            <td class="d-flex align-items-center">
              <img src="${c.image}" alt="${c.productName}" style="width:60px; height:60px; object-fit:cover; margin-right:10px;">
              <span>${c.productName}</span>
            </td>
            <td>
              <form action="/cart/update" method="post" class="d-inline-block">
                <input type="hidden" name="cartId" value="${c.cartId}">
                <input type="number" name="quantity" value="${c.productQt}" min="1" class="form-control d-inline-block" style="width:80px;">
                <button type="submit" class="btn btn-sm btn-primary mt-1">변경</button>
              </form>
            </td>
            <td><fmt:formatNumber value="${c.productPrice}" type="number" pattern="#,###원"/></td>
            <td><fmt:formatNumber value="${c.productPrice * c.productQt}" type="number" pattern="#,###원"/></td>
            <td>
              <form action="/cart/delete" method="post">
                <input type="hidden" name="cartId" value="${c.cartId}">
                <button type="submit" class="btn btn-sm btn-danger">삭제</button>
              </form>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>

      <!-- ✅ 총 금액 표시 -->
      <div class="d-flex justify-content-end mt-3">
        <h5 class="fw-bold">
          총 결제 금액:
          <fmt:formatNumber value="${total}" type="number" pattern="#,###원"/>
        </h5>
      </div>

    </c:otherwise>
  </c:choose>
</div>
</body>
</html>
