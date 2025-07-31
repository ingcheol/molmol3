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

    <!-- 리뷰 목록 표시 -->
    <div class="mt-5">
        <h4 class="mb-4">📝 상품 리뷰</h4>
        <c:forEach var="review" items="${reviews}">
            <div class="card mb-3">
                <div class="card-body">
                    <div class="d-flex justify-content-between">
                        <div>
                            <strong>${review.custId}</strong>님
                            <span class="ms-2 text-warning">
                                <c:forEach begin="1" end="5" var="i">
                                    <c:choose>
                                        <c:when test="${i <= review.score}">&#9733;</c:when>
                                        <c:otherwise>&#9734;</c:otherwise>
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
    </div>

    <!-- 리뷰 작성 폼 -->
    <c:if test="${not empty sessionScope.logincust}">
        <div class="mt-5">
            <h5>✍️ 리뷰 작성하기</h5>
            <form action="/reviews/add" method="post" class="border p-3 rounded shadow-sm bg-light">
                <input type="hidden" name="productId" value="${product.productId}">

                <div class="mb-2">
                    <label>주문번호</label>
                    <input type="number" name="orderId" required class="form-control">
                </div>
                <div class="mb-2">
                    <label>평점</label>
                    <select name="score" class="form-select" required>
                        <option value="5">★★★★★</option>
                        <option value="4">★★★★☆</option>
                        <option value="3">★★★☆☆</option>
                        <option value="2">★★☆☆☆</option>
                        <option value="1">★☆☆☆☆</option>
                    </select>
                </div>
                <div class="mb-2">
                    <label>리뷰 내용</label>
                    <textarea name="content" class="form-control" rows="3" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary w-100">리뷰 작성</button>
            </form>
        </div>
    </c:if>
    <c:if test="${empty sessionScope.logincust}">
        <div class="alert alert-warning mt-3">
            <a href="/login" class="btn btn-outline-dark">로그인 후 리뷰 작성 가능</a>
        </div>
    </c:if>
</div>
</body>
</html>
