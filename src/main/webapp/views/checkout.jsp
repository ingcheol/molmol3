<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>주문 결제</title>
</head>
<body>
<h2>주문 확인 및 결제</h2>

<form action="/order/complete" method="post">
    <div>
        <label>수령인:</label>
        <input type="text" name="receiverName" value="${cust.custName}" required>
    </div>
    <div>
        <label>연락처:</label>
        <input type="text" name="receiverPhone" value="${cust.phone}" required>
    </div>
    <div>
        <label>주소:</label>
        <input type="text" name="receiverAddress" value="${cust.address}" required>
    </div>

    <h3>장바구니 목록</h3>
    <ul>
        <c:forEach var="cart" items="${carts}">
            <li>${cart.productName} - 수량: ${cart.productQt}</li>
            <input type="hidden" name="productIds" value="${cart.productId}">
            <input type="hidden" name="productQts" value="${cart.productQt}">
        </c:forEach>
    </ul>
    <p>총합: <fmt:formatNumber value="${total}" pattern="#,###원"/></p>
    <button type="submit">결제하기</button>
</form>
</body>
</html>
