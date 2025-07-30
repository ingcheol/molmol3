<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
  <title>결제하기</title>
  <meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #1b2838;
      color: white;
      font-family: 'Segoe UI', sans-serif;
    }
    .section-box {
      background-color: #2a475e;
      padding: 30px;
      border-radius: 12px;
      margin-bottom: 30px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.4);
    }
    .section-title {
      font-size: 1.5rem;
      font-weight: bold;
      margin-bottom: 20px;
      border-bottom: 1px solid #66c0f4;
      padding-bottom: 10px;
    }
    .btn-checkout {
      background-color: #66c0f4;
      border: none;
      color: #0e1c25;
      font-weight: bold;
    }
    .btn-checkout:hover {
      background-color: #8acde9;
    }
  </style>
</head>
<body>
<div class="container my-5">

  <!-- 🧍 고객 정보 -->
  <div class="section-box">
    <div class="section-title">🧾 고객 정보</div>
    <p><strong>이름:</strong> ${logincust.custName}</p>
    <p><strong>주소:</strong> ${logincust.address}</p>
    <p><strong>전화번호:</strong> ${logincust.custPhone}</p>
  </div>

  <!-- 🛒 장바구니 상품 정보 -->
  <div class="section-box">
    <div class="section-title">🛒 장바구니 목록</div>
    <table class="table table-dark table-striped">
      <thead>
      <tr>
        <th>상품명</th>
        <th>수량</th>
        <th>가격</th>
        <th>총합</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="item" items="${cartList}">
        <tr>
          <td>${item.productName}</td>
          <td>${item.productQt}</td>
          <td><fmt:formatNumber value="${item.productPrice}" pattern="#,###" /></td>
          <td><fmt:formatNumber value="${item.productQt * item.productPrice}" pattern="#,###" /></td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
    <div class="text-end fs-5">
      <strong>총 결제금액:
        <fmt:formatNumber value="${totalAmount}" pattern="#,###" />원
      </strong>
    </div>
  </div>

  <!-- 💳 결제 수단 선택 -->
  <div class="section-box">
    <div class="section-title">💳 결제 수단</div>
    <form action="/order/checkout" method="post">
      <div class="form-check">
        <input class="form-check-input" type="radio" name="paymentMethod" value="CARD" id="pay1" checked>
        <label class="form-check-label" for="pay1">신용카드</label>
      </div>
      <div class="form-check">
        <input class="form-check-input" type="radio" name="paymentMethod" value="BANK" id="pay2">
        <label class="form-check-label" for="pay2">무통장입금</label>
      </div>
      <div class="form-check mb-4">
        <input class="form-check-input" type="radio" name="paymentMethod" value="CASH" id="pay3">
        <label class="form-check-label" for="pay3">현금결제</label>
      </div>
      <button type="submit" class="btn btn-checkout w-100 py-2 fs-5">✅ 결제하기</button>
    </form>
  </div>

</div>
</body>
</html>
