<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/views/header.jsp" />

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

      <c:if test="${logincust != null && logincust.custId eq 'admin'}">
        <div class="col-auto">
          <a href="/admin/product/list" class="nav-link fw-bold text-danger" style="font-size: 20px;">🔧 상품관리(Admin)</a>
        </div>
      </c:if>
    </div>

    <c:if test="${logincust != null && logincust.custId eq 'admin'}">
      <div class="col-auto">
        <a href="/admin/cust/list" class="nav-link fw-bold text-danger" style="font-size: 20px;">🔧 회원관리(Admin)</a>
      </div>
    </c:if>
    <c:choose>
      <c:when test="${not empty logincust}">
        <li class="nav-link">
          <span class="btn btn-light text-uppercase mx-1 px-3 py-1">
              ${logincust.custName} 님
          </span>
        </li>
        <li class="nav-link">
          <a href="/logout" class="btn btn-outline-dark text-uppercase mx-1 px-3 py-1">
            LOGOUT
          </a>
        </li>
      </c:when>
      <c:otherwise>
        <li class="nav-link">
          <a href="/login" class="btn btn-dark text-uppercase mx-1 px-3 py-1">
            LOGIN
          </a>
        </li>
      </c:otherwise>
    </c:choose>
    </ul>
  </div>
  </div>
  </div>
  </div>
</nav>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>${product.title} | 스타 착용 아이템</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .product-img {
      width: 100%;
      max-width: 500px;
      object-fit: cover;
      border-radius: 12px;
    }
    .item-check {
      margin-bottom: 30px;
      border-bottom: 1px solid #eee;
      padding-bottom: 15px;
    }
    .price {
      color: #c0392b;
      font-weight: bold;
    }
    .thumbnail-img {
      width: 80px;
      height: 80px;
      object-fit: cover;
      border-radius: 6px;
      cursor: pointer;
      transition: 0.2s;
    }
    .thumbnail-img:hover {
      transform: scale(1.05);
    }
  </style>
</head>
<body>
<div class="container py-5">
  <div class="row">
    <!-- 좌측 이미지 -->
    <div class="col-md-6 text-center">
      <c:choose>
        <c:when test="${not empty product.images}">
          <img src="/image/pdimage/${product.images[0].productImgUrl}" alt="${product.productName}" class="product-img shadow mb-3"/>
          <div class="d-flex justify-content-center gap-2 flex-wrap">
            <c:forEach var="img" items="${product.images}">
              <img src="/image/pdimage/${img.productImgUrl}" alt="썸네일" class="thumbnail-img"/>
            </c:forEach>
          </div>
        </c:when>
        <c:otherwise>
          <img src="/image/default.jpg" alt="No Image" class="product-img shadow"/>
        </c:otherwise>
      </c:choose>
    </div>

    <!-- 우측 상품 정보 및 장바구니 담기 -->
    <div class="col-md-6">
      <h3 class="mb-3">${product.title}</h3>
      <p class="text-muted mb-4">${product.description}</p>

      <!-- 상품 구매 폼 -->
      <form action="/cart/add" method="post" id="cartForm">
        <!-- 필수 hidden 필드 -->
        <input type="hidden" name="productId" value="${product.productId}">
        <input type="hidden" name="productPrice" value="${product.productPrice}">
        <input type="hidden" name="productName" value="${product.title}">
        <input type="hidden" name="image" value="${product.images[0].productImgUrl}">
        <input type="hidden" name="prevPage" value="${param.prevPage}">

        <!-- 구성품 체크박스 -->
        <c:forEach var="item" items="${product.items}">
          <div class="form-check item-check">
            <input class="form-check-input" type="checkbox" name="selectedItems" value="${item.id}" id="item-${item.id}">
            <label class="form-check-label" for="item-${item.id}">
              <strong>${item.name}</strong><br>
              <small>${item.desc}</small><br>
              <span class="price">
                <fmt:formatNumber value="${item.price}" type="number" pattern="#,###원"/>
              </span>
            </label>
          </div>
        </c:forEach>

        <!-- 수량 선택 -->
        <div class="mb-3">
          <label class="form-label">수량 선택:</label>
          <input type="number" name="productQt" class="form-control" value="1" min="1" style="width:120px;">
        </div>

        <!-- 장바구니 버튼 -->
        <button type="button" class="btn btn-success btn-lg" onclick="confirmCart()">🛒 장바구니 담기</button>
      </form>

      <!-- 안내창 처리 스크립트 -->
      <script>
        function confirmCart(){
          if(confirm('장바구니에 추가되었습니다.\n장바구니로 가시겠습니까?')){
            document.getElementById('cartForm').submit();
          } else {
            let prevPage = '${param.prevPage}';
            if(prevPage === 'top'){
              location.href = '/shop/top';
            } else if(prevPage === 'bottom'){
              location.href = '/shop/bottom';
            } else {
              location.href = '/';
            }
          }
        }
      </script>

    </div> <!-- 우측 종료 -->
  </div> <!-- row 종료 -->
</div> <!-- container 종료 -->
</body>
</html>
