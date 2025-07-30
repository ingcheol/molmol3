<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Top - 깔롱드</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-3">
    <a href="/" class="btn btn-secondary">&larr; 홈으로</a>
</div>
<div class="container mt-5">
    <h2 class="text-center mb-4">👜가방 상품 리스트</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach var="p" items="${plist}">
            <div class="col">
                <div class="card h-100 shadow-sm">
                    <img src="${p.image}" class="card-img-top" style="height:300px; object-fit:contain;" alt="${p.productName}">
                    <div class="card-body text-center">
                        <h6 class="text-muted">${p.cateName}</h6>
                        <h5>${p.productName}</h5>
                        <p class="fw-bold text-primary">
                            <fmt:formatNumber value="${p.productPrice}" type="number" pattern="#\,###원"/>
                        </p>
                        <a href="/product/see?productId=${p.productId}" class="btn btn-outline-primary btn-sm">상세 보기</a>

                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>