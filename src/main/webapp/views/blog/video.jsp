<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>ONLYPETS - 스타 착용 갤러리</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">

    <style>
        .card-img-top {
            width: 100%;
            height: 300px;
            object-fit: contain;
            background-color: white;
            display: block;
            margin: 0 auto;
        }

        .card {
            margin-bottom: 30px;
            border: none;
        }
        .card-body {
            text-align: center;
        }

        <!-- 상단 메뉴 스타일 -->
        .highlight-link {
            color: #007bff !important;
            text-decoration: underline !important;
            font-weight: bold !important;
        }


    </style>
</head>
<body>

<!-- ✅ 상단 네비게이션 (메인과 동일) -->
<nav class="navbar navbar-expand-lg bg-light text-uppercase fs-6 p-3 border-bottom align-items-center">
    <div class="container-fluid">
        <div class="row justify-content-between align-items-center w-100">
            <div class="col-auto">
        <span class="navbar-brand" style="
                font-size: 32px;
                font-weight: bold;
                background: linear-gradient(90deg, #FF6B6B, #FFA63D);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;">
          깔롱드
        </span>
            </div>
        </div>

        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                aria-controls="offcanvasNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
             aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menu</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                        aria-label="Close"></button>
            </div>

            <div class="offcanvas-body">
                <ul class="navbar-nav justify-content-end flex-grow-1 gap-1 gap-md-5 pe-3">
                    <!-- HOME -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle active" href="#" id="dropdownHome" data-bs-toggle="dropdown"
                           aria-expanded="false">Home</a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownHome">
                            <li><a class="dropdown-item" href="/main/best">베스트 착장</a></li>
                            <li><a class="dropdown-item" href="/main/new">신상 착장</a></li>
                            <li><a class="dropdown-item" href="/main/set">세트 착장 모음</a></li>
                        </ul>
                    </li>

                    <!-- SHOP -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdownShop" data-bs-toggle="dropdown"
                           aria-expanded="false">Shop</a>
                        <ul class="dropdown-menu list-unstyled" aria-labelledby="dropdownShop">
                            <li><a href="index.html" class="dropdown-item item-anchor">남성 연예인 의상</a></li>
                            <li><a href="index.html" class="dropdown-item item-anchor">여성 연예인 의상</a></li>
                            <li><a href="index.html" class="dropdown-item item-anchor">엑세서리</a></li>
                        </ul>
                    </li>

                    <!-- BLOG -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdownBlog" data-bs-toggle="dropdown"
                           aria-expanded="false">Blog</a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownBlog">
                            <li><a class="dropdown-item" href="/blog/star">스타 착용 갤러리</a></li>
                            <li><a class="dropdown-item" href="/blog/tip">스타일링 팁</a></li>
                            <li><a class="dropdown-item" href="/blog/review">사용자 후기</a></li>
                            <li><a class="dropdown-item" href="/blog/video">스타일 영상</a></li>
                        </ul>
                    </li>

                    <!-- PAGES -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdownPages" data-bs-toggle="dropdown"
                           aria-expanded="false">Pages</a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownPages">
                            <li><a class="dropdown-item" href="/mypage">내 정보</a></li>
                            <li><a class="dropdown-item" href="/wishlist">찜 목록</a></li>
                            <li><a class="dropdown-item" href="/cart">장바구니</a></li>
                            <li><a class="dropdown-item" href="/orders">주문 내역</a></li>
                            <li><a class="dropdown-item" href="/review/write">리뷰 작성</a></li>
                        </ul>
                    </li>

                    <!-- WISHLIST, CART, LOGIN -->
                    <li class="nav-item">
                        <a class="nav-link highlight-link" href="/wishlist">WISHLIST(0)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link highlight-link" href="/cart">CART(0)</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link highlight-link" href="/login">LOGIN</a>
                    </li>

                </ul>
            </div>
        </div>
    </div>
</nav>



<!-- ✅ 본문 내용 -->
<div class="container mt-5">
    <h2 class="text-center fw-bold mb-4" style="letter-spacing: 1px;">스타일 영상</h2>
    <p class="text-center text-muted mb-5">연예인들의 착장과 스타일링 노하우를 영상으로 만나보세요.</p>

    <div class="row g-4">
        <div class="col-md-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="ratio ratio-16x9">
                    <iframe src="https://www.youtube.com/embed/E2wMDEiC3QY" title="Karina 공항패션" allowfullscreen></iframe>
                </div>
                <div class="card-body">
                    <h5 class="card-title fw-semibold">카리나 공항룩</h5>
                    <p class="card-text">카리나의 심플하면서도 세련된 공항 착장을 체크해보세요.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="ratio ratio-16x9">
                    <iframe src="https://www.youtube.com/embed/rLoWMU4L_qE" title="아이돌 데일리룩 룩북" allowfullscreen></iframe>
                </div>
                <div class="card-body">
                    <h5 class="card-title fw-semibold">아이돌 데일리룩 룩북</h5>
                    <p class="card-text">아이돌의 실제 일상 데일리룩 모음! 스타일 연출법 참고해요.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="ratio ratio-16x9">
                    <iframe src="https://www.youtube.com/embed/zs1wH0YkJdQ" title="스타일링 튜토리얼" allowfullscreen></iframe>
                </div>
                <div class="card-body">
                    <h5 class="card-title fw-semibold">스타일링 튜토리얼</h5>
                    <p class="card-text">같은 아이템으로 다른 분위기 연출하는 팁! 실전 스타일링 가이드.</p>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- ✅ Bootstrap 기능 작동을 위한 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
