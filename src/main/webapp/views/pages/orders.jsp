<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>깔롱드 - 주문 내역</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="/css/style.css">

    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .main-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            margin: 30px auto;
            padding: 40px;
            max-width: 1200px;
        }

        .page-title {
            text-align: center;
            margin-bottom: 40px;
            color: #2c3e50;
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

        /* 기존 카드 스타일 향상 */
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

        .order-item {
            background: #f8f9fa;
            border: none;
            border-radius: 12px;
            padding: 15px;
            margin-bottom: 10px;
            transition: all 0.2s ease;
        }

        .order-item:hover {
            background: #e3f2fd;
            transform: translateX(5px);
        }

        .order-item:last-child {
            margin-bottom: 0;
        }

        .product-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
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

        .total-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            border-radius: 12px;
            margin-top: 20px;
            text-align: center;
        }

        .total-amount {
            font-size: 1.5rem;
            font-weight: 700;
            margin: 0;
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #7f8c8d;
        }

        .empty-state i {
            font-size: 4rem;
            margin-bottom: 20px;
            color: #bdc3c7;
        }

        .empty-state h4 {
            margin-bottom: 15px;
            color: #34495e;
        }

        .btn-shop {
            background: linear-gradient(45deg, #FF6B6B, #FFA63D);
            border: none;
            padding: 12px 30px;
            border-radius: 25px;
            color: white;
            font-weight: 600;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
            transition: all 0.3s ease;
        }

        .btn-shop:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(255, 107, 107, 0.3);
            color: white;
        }

        /* 네비게이션 바 스타일 */
        .navbar {
            background: rgba(255, 255, 255, 0.95) !important;
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 20px rgba(0,0,0,0.1);
        }

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

        .highlight-link {
            color: #007bff !important;
            text-decoration: underline !important;
            font-weight: bold !important;
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
        }
    </style>
</head>
<body>

<!-- 메인 컨테이너 -->
<div class="main-container">
    <a href="/" class="btn-back">
        <i class="fas fa-arrow-left"></i>
        홈으로 돌아가기
    </a>
    <div class="page-title">
        <h1><i class="fas fa-shopping-bag"></i> 주문 내역</h1>
        <p>구매하신 상품들을 확인해보세요</p>
    </div>

    <!-- 주문 내역 리스트 -->
    <c:forEach var="order" items="${orderList}">
        <div class="order-card">
            <div class="order-header">
                <h5>
                    <i class="fas fa-receipt"></i>
                    주문번호: ${order.orderId}
                </h5>
                <div class="order-meta">
                    <i class="fas fa-calendar-alt"></i>
                    주문일자: <fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm" />
                </div>
            </div>

            <div class="order-body">
                <div class="order-items">
                    <c:forEach var="item" items="${order.orderItems}">
                        <div class="order-item">
                            <div class="product-info">
                                <div class="product-details">
                                    <h6>${item.productName}</h6>
                                    <small>
                                        <i class="fas fa-box"></i>
                                        수량: ${item.quantity}개
                                    </small>
                                </div>
                                <div class="product-price">
                                    <fmt:formatNumber value="${item.price}" type="number"/>원
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- 총 결제금액 계산 -->
                <c:set var="totalPrice" value="0" />
                <c:forEach var="item" items="${order.orderItems}">
                    <c:set var="lineTotal" value="${item.price * item.quantity}" />
                    <c:set var="totalPrice" value="${totalPrice + lineTotal}" />
                </c:forEach>

                <div class="total-section">
                    <div class="d-flex justify-content-between align-items-center">
                        <span><i class="fas fa-credit-card"></i> 총 결제금액</span>
                        <div class="total-amount">
                            <fmt:formatNumber value="${totalPrice}" type="number"/>원
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>

    <!-- 주문 내역이 없을 때 -->
    <c:if test="${empty orderList}">
        <div class="empty-state">
            <i class="fas fa-shopping-cart"></i>
            <h4>주문 내역이 없습니다</h4>
            <p>아직 구매하신 상품이 없어요.<br>다양한 스타일의 상품들을 둘러보세요!</p>
            <!-- 수정: /index로 변경 -->
            <a href="/home/best" class="btn-shop">
                <i class="fas fa-shopping-bag"></i>
                쇼핑하러 가기
            </a>
        </div>
    </c:if>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // 페이지 로드 시 애니메이션 효과
    document.addEventListener('DOMContentLoaded', function() {
        const cards = document.querySelectorAll('.order-card');
        cards.forEach((card, index) => {
            card.style.opacity = '0';
            card.style.transform = 'translateY(30px)';

            setTimeout(() => {
                card.style.transition = 'all 0.6s ease';
                card.style.opacity = '1';
                card.style.transform = 'translateY(0)';
            }, index * 150);
        });
    });

    // 호버 효과 향상
    document.querySelectorAll('.order-item').forEach(item => {
        item.addEventListener('mouseenter', function() {
            this.style.transform = 'translateX(5px) scale(1.02)';
        });

        item.addEventListener('mouseleave', function() {
            this.style.transform = 'translateX(0) scale(1)';
        });
    });
</script>

</body>
</html>