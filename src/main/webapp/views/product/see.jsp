<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/views/header.jsp" />

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

    <!-- 🔹 상품 정보 -->
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

            <!-- 🔹 장바구니 담기 -->
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

    <!-- 🔹 리뷰 조회만 (작성 기능 없음) -->
    <div class="mt-5">
        <h4 class="mb-4">📝 상품 리뷰</h4>

        <c:choose>
            <c:when test="${not empty reviews}">
                <c:forEach var="review" items="${reviews}">
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <div>
                                    <strong>${review.custId}</strong>님
                                    <span class="ms-2 text-warning">
                                        <c:forEach begin="1" end="5" var="i">
                                            <c:choose>
                                                <c:when test="${i <= review.score}">★</c:when>
                                                <c:otherwise>☆</c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </span>
                                </div>
                                <div class="text-muted">
                                    <fmt:formatDate value="${review.regDate}" pattern="yyyy-MM-dd HH:mm"/>
                                </div>
                            </div>
                            <p class="mt-2 mb-0">${review.content}</p>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="text-center py-5 text-muted">
                    <p>아직 작성된 리뷰가 없습니다.</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
</html>