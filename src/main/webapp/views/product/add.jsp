<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>상품 등록</title>
    <style>
        .drop-zone {
            border: 2px dashed #aaa;
            padding: 30px;
            text-align: center;
            background-color: #f9f9f9;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .drop-zone:hover {
            background-color: #eee;
        }

        #preview {
            object-fit: cover;
            aspect-ratio: 1/1;
        }

    </style>
</head>
<body>
<div class="container mt-5">
    <h2>상품 등록</h2>
    <form action="/admin/product/add" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label class="form-label">상품명</label>
            <input type="text" name="productName" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">가격</label>
            <input type="number" name="productPrice" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">카테고리 ID</label>
            <input type="text" name="cateId" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">이미지 업로드</label>
            <div class="drop-zone" onclick="document.getElementById('imageFile').click()"
                 ondragover="event.preventDefault()"
                 ondrop="handleDrop(event)">
                클릭하거나 이미지를 드래그하여 업로드
                <input type="file" name="imageFile" id="imageFile" accept="image/*"
                       style="display:none;" onchange="previewImage(event)">
                <img id="preview" src="#" alt="미리보기"/>
            </div>
        </div>

        <button type="submit" class="btn btn-primary">등록</button>
    </form>
</div>

<script>
    function previewImage(event) {
        const reader = new FileReader();
        reader.onload = function () {
            const output = document.getElementById('preview');
            output.src = reader.result;
            output.style.display = 'block';
        };
        reader.readAsDataURL(event.target.files[0]);
    }

    function handleDrop(event) {
        event.preventDefault();
        const files = event.dataTransfer.files;
        if (files.length > 0) {
            document.getElementById('imageFile').files = files;
            previewImage({target: {files: files}});
        }
    }
</script>
</body>
</html>
