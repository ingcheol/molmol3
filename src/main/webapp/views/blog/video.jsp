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
                        </ul>
                    </li>

                    <!-- SHOP -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdownShop" data-bs-toggle="dropdown"
                           aria-expanded="false">Shop</a>
                        <ul class="dropdown-menu list-unstyled" aria-labelledby="dropdownShop">
                            <li><a href="/shop/top" class="dropdown-item item-anchor">상의</a></li>
                            <li><a href="/shop/bottom" class="dropdown-item item-anchor">하의</a></li>
                            <li><a href="/shop/hat" class="dropdown-item item-anchor">모자</a></li>
                            <li><a href="/shop/shoes" class="dropdown-item item-anchor">신발</a></li>
                            <li><a href="/shop/bag" class="dropdown-item item-anchor">가방</a></li>
                            <li><a href="/shop/accessory" class="dropdown-item item-anchor">악세사리</a></li>
                        </ul>
                    </li>

                    <!-- BLOG -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdownBlog" data-bs-toggle="dropdown"
                           aria-expanded="false">Blog</a>
                        <ul class="dropdown-menu list-unstyled" aria-labelledby="dropdownBlog">
                            <li><a href="/blog/star" class="dropdown-item item-anchor">스타 INSTAGRAM</a></li>
                            <li><a href="/blog/tip" class="dropdown-item item-anchor">스타일링 팁</a></li>
                            <li><a href="/blog/review" class="dropdown-item item-anchor">사용자 후기</a></li>
                            <li><a href="/blog/video" class="dropdown-item item-anchor">스타일 영상</a></li>
                        </ul>
                    </li>

                    <!-- PAGES -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdownPages" data-bs-toggle="dropdown"
                           aria-expanded="false">Pages</a>
                        <ul class="dropdown-menu list-unstyled" aria-labelledby="dropdownPages">
                            <li><a href="/pages/information" class="dropdown-item item-anchor">내 정보</a></li>
                            <li><a href="/wishlist" class="dropdown-item item-anchor">찜 목록</a></li>
                            <li><a href="/cart" class="dropdown-item item-anchor">장바구니</a></li>
                            <li><a href="/pages/orders" class="dropdown-item item-anchor">주문 내역</a></li>
                            <li><a href="/pages/review" class="dropdown-item item-anchor">리뷰 작성</a></li>
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
<div class="mb-3 d-flex justify-content-between">
    <div>
        <a href="/" class="btn btn-secondary">홈으로</a>
    </div>
<div class="container mt-5">
    <h2 class="text-center fw-bold mb-4" style="letter-spacing: 1px;">스타일 영상</h2>
    <p class="text-center text-muted mb-5">연예인들의 착장과 스타일링 노하우를 영상으로 만나보세요.</p>

    <div class="row g-4">
        <div class="col-md-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="ratio ratio-16x9">
                    <iframe src="https://www.youtube.com/embed/j6alFPmYx50" title="카리나 공항룩" allowfullscreen></iframe>
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
                    <iframe src="https://www.youtube.com/embed/QNIMDJztzng" title="여름 데일리룩 추천" allowfullscreen></iframe>
                </div>
                <div class="card-body">
                    <h5 class="card-title fw-semibold">겨울 데일리룩 추천</h5>
                    <p class="card-text">추운 겨울 원영 스타일을 연출할 수 있는 데일리룩 모음집.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="ratio ratio-16x9">
                    <iframe src="https://www.youtube.com/embed/_aB_h8rjjbI" title="남친룩 스타일링" allowfullscreen></iframe>
                </div>
                <div class="card-body">
                    <h5 class="card-title fw-semibold">여친룩 스타일링</h5>
                    <p class="card-text">댄디하면서도 편안한 데이트룩! 센스 있는 여친룩 가이드.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="ratio ratio-16x9">
                    <iframe src="https://www.youtube.com/embed/Hpd3upaXfLY" title="아이돌 공항패션 모음" allowfullscreen></iframe>
                </div>
                <div class="card-body">
                    <h5 class="card-title fw-semibold">윈터 공항룩</h5>
                    <p class="card-text">트렌디한 윈터의 공항패션을 살펴보세요.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="ratio ratio-16x9">
                    <iframe src="https://www.youtube.com/embed/JHooZ1usVT0" title="셀럽 하객룩 모음" allowfullscreen></iframe>
                </div>
                <div class="card-body">
                    <h5 class="card-title fw-semibold">아이브 공항룩</h5>
                    <p class="card-text">아이브의 다양한 패션을 한눈에 살펴보세요.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="ratio ratio-16x9">
                    <iframe src="https://www.youtube.com/embed/a-64RpGgqJQ" title="청청패션 입는 법" allowfullscreen></iframe>
                </div>
                <div class="card-body">
                    <h5 class="card-title fw-semibold">엔믹스 공항룩</h5>
                    <p class="card-text">부담스럽지 않게 스타일을 아는 엔믹스 친구들의 패션.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="ratio ratio-16x9">
                    <iframe src="https://www.youtube.com/embed/eK8RmYyxWek" title="아이돌 사복 패션 탐방" allowfullscreen></iframe>
                </div>
                <div class="card-body">
                    <h5 class="card-title fw-semibold">아이돌 사복 패션 탐방</h5>
                    <p class="card-text">무대 밖에서 빛나는 아이돌들의 리얼 사복 스타일링.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="ratio ratio-16x9">
                    <iframe src="https://www.youtube.com/embed/B1BOWjFRrZc" title="OOTD 브이로그" allowfullscreen></iframe>
                </div>
                <div class="card-body">
                    <h5 class="card-title fw-semibold">블랙핑크 공항룩</h5>
                    <p class="card-text">월드 스타 블랙핑크의 의상을 한눈에 보아요.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="ratio ratio-16x9">
                    <iframe src="https://www.youtube.com/embed/jc9VmLaxtUs" title="셔츠 스타일링 꿀팁" allowfullscreen></iframe>
                </div>
                <div class="card-body">
                    <h5 class="card-title fw-semibold">연예인을 꿈꾸는 청년</h5>
                    <p class="card-text">지금부터가 시작! 연예인이 되기위한 노력 영상.</p>
                </div>
            </div>
        </div>

    </div>
</div>



<!-- ✅ Bootstrap 기능 작동을 위한 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
