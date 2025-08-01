<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>깔롱드 - 리뷰 작성</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <style>
    body {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      min-height: 100vh;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      padding: 20px 0;
    }

    .main-container {
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      box-shadow: 0 20px 40px rgba(0,0,0,0.1);
      margin: 30px auto;
      padding: 40px;
      max-width: 1000px;
    }

    .page-title {
      text-align: center;
      margin-bottom: 40px;
    }

    .page-title h1 {
      font-size: 2.5rem;
      font-weight: 700;
      background: linear-gradient(45deg, #FF6B6B, #FFA63D);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      margin-bottom: 10px;
    }

    .page-title p {
      color: #7f8c8d;
      font-size: 1.1rem;
    }

    .btn-back {
      background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
      border: none;
      color: white;
      padding: 10px 20px;
      border-radius: 25px;
      text-decoration: none;
      display: inline-flex;
      align-items: center;
      gap: 8px;
      margin-bottom: 30px;
      transition: all 0.3s ease;
    }

    .btn-back:hover {
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(108, 117, 125, 0.4);
      color: white;
    }

    .order-section {
      margin-bottom: 40px;
    }

    .section-title {
      color: #2c3e50;
      font-weight: 600;
      margin-bottom: 20px;
      display: flex;
      align-items: center;
      gap: 10px;
    }

    /* 주문내역 페이지와 동일한 카드 스타일 적용 */
    .order-card {
      border: none;
      border-radius: 15px;
      overflow: hidden;
      transition: all 0.3s ease;
      background: white;
      box-shadow: 0 8px 25px rgba(0,0,0,0.08);
      margin-bottom: 30px;
    }

    .order-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 35px rgba(0,0,0,0.15);
    }

    .order-header {
      background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
      color: white;
      padding: 20px;
      position: relative;
      overflow: hidden;
    }

    .order-header::before {
      content: '';
      position: absolute;
      top: 0;
      right: 0;
      width: 100px;
      height: 100px;
      background: rgba(255,255,255,0.1);
      border-radius: 50%;
      transform: translate(30px, -30px);
    }

    .order-header h5 {
      margin: 0;
      font-weight: 600;
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .order-meta {
      margin-top: 8px;
      font-size: 0.9rem;
      opacity: 0.9;
    }

    .order-body {
      padding: 25px;
    }

    /* 상품 아이템 스타일 개선 */
    .product-item {
      background: #f8f9fa;
      border: none;
      border-radius: 12px;
      padding: 15px;
      margin-bottom: 15px;
      transition: all 0.2s ease;
    }

    .product-item:hover {
      background: #e3f2fd;
      transform: translateX(5px);
    }

    .product-item:last-child {
      margin-bottom: 0;
    }

    .product-info {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 10px;
    }

    .product-details h6 {
      margin: 0;
      color: #2c3e50;
      font-weight: 600;
    }

    .product-details small {
      color: #7f8c8d;
      display: flex;
      align-items: center;
      gap: 5px;
      margin-top: 5px;
    }

    .product-price {
      font-weight: 700;
      color: #e74c3c;
      font-size: 1.1rem;
    }

    .review-button {
      background: linear-gradient(45deg, #FF6B6B, #FFA63D);
      border: none;
      color: white;
      padding: 8px 20px;
      border-radius: 20px;
      font-size: 0.9rem;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      width: 100%;
    }

    .review-button:hover {
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(255, 107, 107, 0.4);
    }

    .review-button:disabled {
      background: #6c757d;
      cursor: not-allowed;
      transform: none;
      box-shadow: none;
    }

    /* 총 결제금액 섹션 */
    .total-section {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      padding: 15px 20px;
      border-radius: 12px;
      margin-top: 15px;
      text-align: center;
    }

    .total-amount {
      font-size: 1.2rem;
      font-weight: 700;
      margin: 0;
    }

    .review-modal .modal-content {
      border: none;
      border-radius: 20px;
      overflow: hidden;
    }

    .modal-header {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      border: none;
    }

    .modal-title {
      font-weight: 600;
    }

    .btn-close {
      filter: brightness(0) invert(1);
    }

    .form-label {
      font-weight: 600;
      color: #2c3e50;
      margin-bottom: 8px;
    }

    .form-control, .form-select {
      border: 2px solid #e9ecef;
      border-radius: 10px;
      padding: 12px 15px;
      transition: all 0.3s ease;
    }

    .form-control:focus, .form-select:focus {
      border-color: #FF6B6B;
      box-shadow: 0 0 0 0.2rem rgba(255, 107, 107, 0.25);
    }

    .star-rating {
      display: flex;
      gap: 5px;
      margin-bottom: 15px;
    }

    .star {
      font-size: 2rem;
      color: #ddd;
      cursor: pointer;
      transition: all 0.2s ease;
    }

    .star.active, .star:hover {
      color: #ffc107;
      transform: scale(1.1);
    }

    .btn-submit-review {
      background: linear-gradient(45deg, #FF6B6B, #FFA63D);
      border: none;
      color: white;
      padding: 12px 30px;
      border-radius: 25px;
      font-weight: 600;
      width: 100%;
      transition: all 0.3s ease;
    }

    .btn-submit-review:hover {
      transform: translateY(-2px);
      box-shadow: 0 10px 20px rgba(255, 107, 107, 0.3);
    }

    .login-required {
      text-align: center;
      padding: 60px 20px;
      color: #7f8c8d;
    }

    .login-required i {
      font-size: 4rem;
      margin-bottom: 20px;
      color: #ffc107;
    }

    .btn-login {
      background: linear-gradient(45deg, #FF6B6B, #FFA63D);
      border: none;
      color: white;
      padding: 12px 30px;
      border-radius: 25px;
      font-weight: 600;
      text-decoration: none;
      display: inline-block;
      margin-top: 20px;
      transition: all 0.3s ease;
    }

    .btn-login:hover {
      transform: translateY(-2px);
      box-shadow: 0 10px 20px rgba(255, 107, 107, 0.3);
      color: white;
    }

    .empty-orders {
      text-align: center;
      padding: 60px 20px;
      color: #7f8c8d;
    }

    .empty-orders i {
      font-size: 4rem;
      margin-bottom: 20px;
      color: #bdc3c7;
    }

    .alert {
      border-radius: 10px;
      margin-bottom: 20px;
    }

    @media (max-width: 768px) {
      .main-container {
        margin: 15px;
        padding: 20px;
      }

      .page-title h1 {
        font-size: 2rem;
      }

      .product-info {
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
      }

      .review-button {
        align-self: stretch;
        text-align: center;
      }
    }
  </style>
</head>
<body>

<div class="main-container">
  <!-- 홈으로 돌아가기 버튼 -->
  <a href="/" class="btn-back">
    <i class="fas fa-arrow-left"></i>
    홈으로 돌아가기
  </a>

  <div class="page-title">
    <h1><i class="fas fa-star"></i> 리뷰 작성</h1>
    <p>구매하신 상품에 대한 솔직한 후기를 남겨주세요</p>
  </div>

  <!-- 알림 메시지 표시 -->
  <c:if test="${not empty success}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
      <i class="fas fa-check-circle"></i> ${success}
      <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
  </c:if>

  <c:if test="${not empty error}">
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
      <i class="fas fa-exclamation-circle"></i> ${error}
      <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
  </c:if>

  <c:choose>
    <c:when test="${not empty sessionScope.logincust}">
      <!-- 주문 내역 표시 (주문내역 페이지와 동일한 구조) -->
      <div class="order-section">
        <h3 class="section-title">
          <i class="fas fa-shopping-bag"></i>
          구매한 상품들
        </h3>


        <c:choose>
          <c:when test="${not empty orderList}">
            <c:forEach var="order" items="${orderList}" varStatus="status">
              <div class="order-card">
                <div class="order-header">
                  <i class="fas fa-receipt"></i>
                  주문번호: ${order.orderId} |
                  주문일자: <fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm" />
                </div>
                <div class="order-items">
                  <c:choose>
                    <c:when test="${not empty order.orderItems}">
                      <c:forEach var="item" items="${order.orderItems}">
                        <div class="product-item">
                          <div class="product-info">
                            <div class="product-name">${item.productName}</div>
                            <div class="product-details">
                              <i class="fas fa-box"></i> 수량: ${item.quantity}개 |
                              <i class="fas fa-won-sign"></i> <fmt:formatNumber value="${item.price}" type="number"/>원
                            </div>
                          </div>
                          <button class="review-button"
                                  onclick="openReviewModal('${order.orderId}', '${item.productId}', '${item.productName}')">
                            <i class="fas fa-edit"></i> 리뷰 작성
                          </button>
                        </div>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <div class="product-item">
                        <div class="product-info">
                          <div class="product-name">주문 아이템이 없습니다</div>
                        </div>
                      </div>
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <div class="empty-orders">
              <i class="fas fa-shopping-cart"></i>
              <h4>구매 내역이 없습니다</h4>
              <p>먼저 상품을 구매한 후 리뷰를 작성해주세요.</p>
              <a href="/index" class="btn-login">
                <i class="fas fa-shopping-bag"></i>
                쇼핑하러 가기
              </a>
            </div>
          </c:otherwise>
        </c:choose>
      </div>
    </c:when>
    <c:otherwise>
      <!-- 로그인 안된 경우 -->
      <div class="login-required">
        <i class="fas fa-lock"></i>
        <h4>로그인이 필요합니다</h4>
        <p>리뷰를 작성하려면 먼저 로그인해주세요.</p>
        <a href="/login" class="btn-login">
          <i class="fas fa-sign-in-alt"></i>
          로그인하러 가기
        </a>
      </div>
    </c:otherwise>
  </c:choose>
</div>

<!-- 리뷰 작성 모달 -->
<div class="modal fade review-modal" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="reviewModalLabel">
          <i class="fas fa-star"></i> 리뷰 작성하기
        </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="/reviews/add" method="post" id="reviewForm">
          <input type="hidden" id="modalOrderId" name="orderId">
          <input type="hidden" id="modalProductId" name="productId">

          <div class="mb-4">
            <h6 class="form-label">상품 정보</h6>
            <div class="alert alert-info">
              <strong id="modalProductName"></strong><br>
              <small>주문번호: <span id="modalOrderDisplay"></span></small>
            </div>
          </div>

          <div class="mb-4">
            <label class="form-label">평점을 선택해주세요</label>
            <div class="star-rating">
              <span class="star" data-rating="1">★</span>
              <span class="star" data-rating="2">★</span>
              <span class="star" data-rating="3">★</span>
              <span class="star" data-rating="4">★</span>
              <span class="star" data-rating="5">★</span>
            </div>
            <input type="hidden" id="score" name="score" required>
            <div class="rating-text text-muted" id="ratingText">평점을 선택해주세요</div>
          </div>

          <div class="mb-4">
            <label for="content" class="form-label">리뷰 내용</label>
            <textarea id="content" name="content" class="form-control" rows="5" required
                      placeholder="상품에 대한 솔직한 후기를 작성해주세요...&#10;&#10;예시:&#10;- 재질이나 품질은 어떠셨나요?&#10;- 사이즈는 적당했나요?&#10;- 다른 분들께 추천하시겠어요?"></textarea>
          </div>

          <button type="submit" class="btn-submit-review">
            <i class="fas fa-paper-plane"></i>
            리뷰 등록하기
          </button>
        </form>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

<script>
  // 리뷰 모달 열기
  function openReviewModal(orderId, productId, productName) {
    document.getElementById('modalOrderId').value = orderId;
    document.getElementById('modalProductId').value = productId;
    document.getElementById('modalProductName').textContent = productName;
    document.getElementById('modalOrderDisplay').textContent = orderId;

    // 평점 초기화
    document.querySelectorAll('.star').forEach(star => {
      star.classList.remove('active');
    });
    document.getElementById('score').value = '';
    document.getElementById('ratingText').textContent = '평점을 선택해주세요';
    document.getElementById('content').value = '';

    new bootstrap.Modal(document.getElementById('reviewModal')).show();
  }

  // 별점 기능
  document.addEventListener('DOMContentLoaded', function() {
    const stars = document.querySelectorAll('.star');
    const scoreInput = document.getElementById('score');
    const ratingText = document.getElementById('ratingText');

    const ratingTexts = {
      1: '★☆☆☆☆ 매우 불만족',
      2: '★★☆☆☆ 불만족',
      3: '★★★☆☆ 보통',
      4: '★★★★☆ 만족',
      5: '★★★★★ 매우 만족'
    };

    stars.forEach(star => {
      star.addEventListener('click', function() {
        const rating = parseInt(this.dataset.rating);
        scoreInput.value = rating;
        ratingText.textContent = ratingTexts[rating];

        // 별점 표시 업데이트
        stars.forEach((s, index) => {
          if (index < rating) {
            s.classList.add('active');
          } else {
            s.classList.remove('active');
          }
        });
      });

      star.addEventListener('mouseenter', function() {
        const rating = parseInt(this.dataset.rating);
        stars.forEach((s, index) => {
          if (index < rating) {
            s.style.color = '#ffc107';
          } else {
            s.style.color = '#ddd';
          }
        });
      });
    });

    // 별점 영역 떠날 때 원래 상태로
    document.querySelector('.star-rating').addEventListener('mouseleave', function() {
      const currentRating = parseInt(scoreInput.value) || 0;
      stars.forEach((s, index) => {
        if (index < currentRating) {
          s.style.color = '#ffc107';
        } else {
          s.style.color = '#ddd';
        }
      });
    });
  });

  // 페이지 로드 시 애니메이션
  document.addEventListener('DOMContentLoaded', function() {
    const cards = document.querySelectorAll('.order-card');
    cards.forEach((card, index) => {
      card.style.opacity = '0';
      card.style.transform = 'translateY(30px)';

      setTimeout(() => {
        card.style.transition = 'all 0.6s ease';
        card.style.opacity = '1';
        card.style.transform = 'translateY(0)';
      }, index * 200);
    });
  });

  // 폼 제출 시 검증
  document.getElementById('reviewForm').addEventListener('submit', function(e) {
    const score = document.getElementById('score').value;
    const content = document.getElementById('content').value.trim();

    if (!score) {
      e.preventDefault();
      alert('평점을 선택해주세요.');
      return;
    }

    if (!content) {
      e.preventDefault();
      alert('리뷰 내용을 작성해주세요.');
      return;
    }

    if (content.length < 10) {
      e.preventDefault();
      alert('리뷰는 최소 10자 이상 작성해주세요.');
      return;
    }
  });

  // 호버 효과 향상
  document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.product-item').forEach(item => {
      item.addEventListener('mouseenter', function() {
        this.style.transform = 'translateX(5px) scale(1.02)';
      });

      item.addEventListener('mouseleave', function() {
        this.style.transform = 'translateX(0) scale(1)';
      });
    });
  });
</script>
</body>
</html>