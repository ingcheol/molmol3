<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
              <li><a class="dropdown-item" href="/home/best">베스트 착장</a></li>
              <li><a class="dropdown-item" href="/home/new">신상 착장</a></li>
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
              <li><a href="/cart" class="dropdown-item item-anchor">장바구니</a></li>
              <li><a href="/pages/orders" class="dropdown-item item-anchor">주문 내역</a></li>
              <li><a href="/pages/review" class="dropdown-item item-anchor">리뷰 작성</a></li>
            </ul>
          </li>

          <!-- WISHLIST, CART, LOGIN -->
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