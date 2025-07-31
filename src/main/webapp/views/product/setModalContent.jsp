<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
  .set-card {
    border: 1.5px solid #eee;
    border-radius: 18px;
    padding: 28px 16px 24px 16px;
    margin: 16px 10px;
    background: #fff;
    box-shadow: 0 2px 12px rgba(0,0,0,0.04);
    display: flex;
    flex-direction: column;
    align-items: center;
    transition: box-shadow .25s;
  }
  .set-card:hover {
    box-shadow: 0 4px 24px rgba(0,0,0,0.11);
  }
  .set-product-img {
    width: 120px; height: 120px; object-fit: contain; margin-bottom: 18px; background: #f7f7f7;
    border-radius: 12px;
    border: 1px solid #f1f1f1;
    box-shadow: 0 1px 4px rgba(0,0,0,0.02);
  }
  .set-card .price {
    color: #1777ff; font-weight: bold; font-size: 1.2rem;
  }
  .set-card .product-name {
    font-weight: 700; font-size: 1.1rem; text-align: center; min-height: 42px;
  }
  .set-card form {
    width: 100%;
  }
  .btn-cart {
    background: #ffc300;
    color: #212529;
    font-weight: 700;
    width: 100%;
    border-radius: 7px;
    margin-top: 9px;
    border: none;
    font-size: 1.07rem;
    transition: background .2s;
  }
  .btn-cart:hover {
    background: #ffb300;
  }
</style>

<div class="container">
  <div class="row mb-3 justify-content-center">
    <c:forEach var="product" items="${products}">
      <div class="col-12 col-md-4 d-flex">
        <div class="set-card w-100">
          <img src="${product.image}" alt="${product.productName}" class="set-product-img" />
          <div class="product-name mb-1">${product.productName}</div>
          <div class="price mb-2">
            <fmt:formatNumber value="${product.productPrice}" pattern="#,###"/>원
          </div>
          <form action="/cart/add" method="post" class="d-flex flex-column align-items-center">
            <input type="hidden" name="productId" value="${product.productId}"/>
            <input type="number" name="productQt" min="1" value="1" class="form-control mb-2" style="width:80px;"/>
            <button type="submit" class="btn btn-cart">장바구니 담기</button>
          </form>
        </div>
      </div>
    </c:forEach>
  </div>

  <form action="/cart/addSet" method="post">
    <c:forEach var="p" items="${products}">
      <input type="hidden" name="productIds" value="${p.productId}"/>
    </c:forEach>
    <button type="submit" class="btn btn-primary w-100 mt-3">세트 전체 장바구니 담기</button>
  </form>

</div>
