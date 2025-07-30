<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${product.productName} 상세 보기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <a href="/" class="btn btn-secondary mb-3">&larr; 홈</a>
    <div class="row">
        <div class="col-md-6">
            <img src="${product.image}" alt="${product.productName}" style="width:300px;" class="img-fluid">

        </div>
        <div class="col-md-6">
            <h3>${product.productName}</h3>
            <p class="text-muted">${product.cateName}</p>
            <h4 class="text-primary">
                <fmt:formatNumber value="${product.productPrice}" type="number" pattern="#,###원"/>
            </h4>

            <c:choose>
                <c:when test="${not empty sessionScope.logincust}">
                    <form action="/cart/add" method="post" class="mb-3">
                        <input type="hidden" name="productId" value="${product.productId}">
                        <input type="number" name="productQt" value="1" min="1" class="form-control w-25 d-inline">
                        <button type="submit" class="btn btn-success ms-2">장바구니 담기</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <p class="text-danger mt-3">🔒 로그인 후 이용할 수 있어요.</p>
                    <a href="/login" class="btn btn-outline-secondary">로그인하러 가기</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
</body>

</html>
