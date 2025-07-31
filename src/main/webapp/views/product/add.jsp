<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/header.jsp" />

<html>
<head>
    <title>상품 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>상품 등록</h2>

    <form action="/admin/product/add" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="productName" class="form-label">상품명</label>
            <input type="text" class="form-control" id="productName" name="productName" required>
        </div>

        <div class="mb-3">
            <label for="productPrice" class="form-label">가격</label>
            <input type="number" class="form-control" id="productPrice" name="productPrice" required>
        </div>

        <div class="mb-3">
            <label for="cateId" class="form-label">카테고리 선택</label>
            <select class="form-select" id="cateId" name="cateId" required>
                <option value="" disabled selected>카테고리를 선택하세요</option>
                <c:forEach var="cate" items="${categories}">
                    <option value="${cate.cateId}">${cate.cateName}</option>
                </c:forEach>
            </select>
        </div>


        <div class="mb-3">
            <label for="imageFile" class="form-label">이미지 업로드</label>
            <input type="file" class="form-control" id="imageFile" name="imageFile" accept="image/*" required>
        </div>

        <button type="submit" class="btn btn-primary">상품 등록</button>
        <a href="/admin/product/list" class="btn btn-secondary">목록으로</a>
    </form>
</div>
</body>
</html>
