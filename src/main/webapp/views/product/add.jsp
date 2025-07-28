<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #imageFile {
        border: 2px dashed #aaa;
        padding: 30px;
        text-align: center;
        background-color: #f8f8f8;
        cursor: pointer;
    }

    #imageFile:hover {
        background-color: #eee;
    }
</style>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2>상품 등록</h2>
    <form action="/product/add" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="productName" class="form-label">상품명</label>
            <input type="text" class="form-control" id="productName" name="productName" required>
        </div>

        <div class="mb-3">
            <label for="productPrice" class="form-label">가격</label>
            <input type="number" class="form-control" id="productPrice" name="productPrice" required>
        </div>

        <div class="mb-3">
            <label for="cateId" class="form-label">카테고리 ID</label>
            <input type="text" class="form-control" id="cateId" name="cateId">
        </div>

        <div class="mb-3">
            <label for="description" class="form-label">설명</label>
            <textarea class="form-control" id="description" name="description" rows="3"></textarea>
        </div>

        <div class="mb-3">
            <label for="imageFile" class="form-label">이미지 업로드</label>
            <input type="file" class="form-control" id="imageFile" name="imageFile" accept="image/*" onchange="previewImage(event)">
        </div>

        <div class="mb-3">
            <img id="preview" src="#" alt="미리보기" style="max-width: 300px; display: none;"/>
        </div>

        <script>
            function previewImage(event) {
                const reader = new FileReader();
                reader.onload = function(){
                    const output = document.getElementById('preview');
                    output.src = reader.result;
                    output.style.display = 'block';
                };
                reader.readAsDataURL(event.target.files[0]);
            }
        </script>


        <button type="submit" class="btn btn-primary">등록</button>
        <a href="/product/list" class="btn btn-secondary">목록으로</a>
    </form>
</div>

</body>
</html>
