<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>깔롱드 - 로그인</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 20px;
    }

    .login-container {
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      box-shadow: 0 20px 40px rgba(0,0,0,0.1);
      padding: 40px;
      width: 100%;
      max-width: 450px;
      position: relative;
      overflow: hidden;
    }

    .login-container::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 4px;
      background: linear-gradient(90deg, #FF6B6B, #FFA63D);
    }

    .brand-logo {
      text-align: center;
      margin-bottom: 30px;
    }

    .brand-logo h1 {
      font-size: 2.5rem;
      font-weight: 700;
      background: linear-gradient(45deg, #FF6B6B, #FFA63D);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      margin-bottom: 8px;
    }

    .brand-logo p {
      color: #7f8c8d;
      font-size: 1rem;
    }

    .login-form {
      margin-bottom: 20px;
    }

    .form-group {
      position: relative;
      margin-bottom: 25px;
    }

    .form-field {
      width: 100%;
      padding: 15px 20px 15px 50px;
      border: 2px solid #e9ecef;
      border-radius: 12px;
      font-size: 16px;
      transition: all 0.3s ease;
      background: white;
    }

    .form-field:focus {
      outline: none;
      border-color: #FF6B6B;
      box-shadow: 0 0 0 0.2rem rgba(255, 107, 107, 0.25);
      transform: translateY(-2px);
    }

    .form-icon {
      position: absolute;
      left: 18px;
      top: 50%;
      transform: translateY(-50%);
      color: #7f8c8d;
      font-size: 16px;
      transition: color 0.3s ease;
    }

    .form-field:focus + .form-icon {
      color: #FF6B6B;
    }

    .error-msg {
      background: linear-gradient(135deg, #ff6b6b, #ff8e8e);
      color: white;
      padding: 12px 20px;
      border-radius: 12px;
      margin-bottom: 20px;
      font-size: 14px;
      display: flex;
      align-items: center;
      gap: 10px;
      animation: shake 0.5s ease-in-out;
    }

    @keyframes shake {
      0%, 100% { transform: translateX(0); }
      25% { transform: translateX(-5px); }
      75% { transform: translateX(5px); }
    }

    .form-options {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 25px;
      font-size: 14px;
    }

    .checkbox-wrapper {
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .checkbox-wrapper input[type="checkbox"] {
      width: 18px;
      height: 18px;
      accent-color: #FF6B6B;
    }

    .signup-link {
      color: #FF6B6B;
      text-decoration: none;
      font-weight: 600;
      transition: all 0.3s ease;
    }

    .signup-link:hover {
      color: #FFA63D;
      text-decoration: underline;
    }

    .login-btn {
      width: 100%;
      padding: 15px;
      background: linear-gradient(45deg, #FF6B6B, #FFA63D);
      color: white;
      border: none;
      border-radius: 12px;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
    }

    .login-btn::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
      transition: left 0.5s;
    }

    .login-btn:hover::before {
      left: 100%;
    }

    .login-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 10px 20px rgba(255, 107, 107, 0.3);
    }

    .login-btn:active {
      transform: translateY(0);
    }

    /* 모달 스타일 */
    .modal-backdrop {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100vw;
      height: 100vh;
      background-color: rgba(0, 0, 0, 0.6);
      backdrop-filter: blur(5px);
      justify-content: center;
      align-items: center;
      z-index: 999;
      animation: fadeIn 0.3s ease;
    }

    @keyframes fadeIn {
      from { opacity: 0; }
      to { opacity: 1; }
    }

    .modal-box {
      background: white;
      width: 90%;
      max-width: 500px;
      border-radius: 20px;
      box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
      position: relative;
      overflow: hidden;
      animation: slideUp 0.3s ease;
    }

    @keyframes slideUp {
      from {
        transform: translateY(50px);
        opacity: 0;
      }
      to {
        transform: translateY(0);
        opacity: 1;
      }
    }

    .modal-header {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      padding: 20px 30px;
      position: relative;
    }

    .modal-title {
      font-size: 1.5rem;
      font-weight: 600;
      margin: 0;
    }

    .close-btn {
      position: absolute;
      top: 15px;
      right: 20px;
      background: none;
      border: none;
      color: white;
      font-size: 24px;
      cursor: pointer;
      width: 35px;
      height: 35px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: all 0.3s ease;
    }

    .close-btn:hover {
      background: rgba(255, 255, 255, 0.2);
      transform: rotate(90deg);
    }

    .modal-content {
      padding: 30px;
    }

    .signup-form .form-field {
      margin-bottom: 20px;
      padding-left: 20px;
    }

    .signup-btn {
      width: 100%;
      padding: 12px;
      background: linear-gradient(45deg, #FF6B6B, #FFA63D);
      color: white;
      border: none;
      border-radius: 12px;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      margin-top: 15px;
    }

    .signup-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 16px rgba(255, 107, 107, 0.3);
    }

    .signup-btn:disabled {
      background: #95a5a6;
      cursor: not-allowed;
      transform: none;
      box-shadow: none;
    }

    /* 로딩 애니메이션 */
    .loading-overlay {
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: rgba(255, 255, 255, 0.95);
      display: none;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      z-index: 1000;
      border-radius: 20px;
    }

    .loading-spinner {
      width: 50px;
      height: 50px;
      border: 4px solid #f3f3f3;
      border-top: 4px solid #FF6B6B;
      border-radius: 50%;
      animation: spin 1s linear infinite;
      margin-bottom: 20px;
    }

    @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }

    .loading-text {
      color: #FF6B6B;
      font-weight: 600;
      font-size: 16px;
      text-align: center;
    }

    .success-animation {
      display: none;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      text-align: center;
    }

    .success-icon {
      width: 80px;
      height: 80px;
      background: linear-gradient(45deg, #FF6B6B, #FFA63D);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 20px;
      animation: successPop 0.6s ease;
    }

    .success-icon i {
      color: white;
      font-size: 40px;
    }

    @keyframes successPop {
      0% {
        transform: scale(0);
        opacity: 0;
      }
      50% {
        transform: scale(1.2);
      }
      100% {
        transform: scale(1);
        opacity: 1;
      }
    }

    .success-message {
      color: #2c3e50;
      font-weight: 600;
      font-size: 18px;
      margin-bottom: 10px;
    }

    .success-submessage {
      color: #7f8c8d;
      font-size: 14px;
    }

    .back-home {
      position: absolute;
      top: 20px;
      left: 20px;
      background: rgba(255, 255, 255, 0.9);
      border: none;
      padding: 10px 15px;
      border-radius: 50px;
      color: #667eea;
      text-decoration: none;
      font-weight: 600;
      display: flex;
      align-items: center;
      gap: 8px;
      transition: all 0.3s ease;
      backdrop-filter: blur(10px);
    }

    .back-home:hover {
      background: white;
      transform: translateX(-5px);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    @media (max-width: 480px) {
      .login-container {
        padding: 30px 25px;
        margin: 0 15px;
      }

      .brand-logo h1 {
        font-size: 2rem;
      }

      .modal-content {
        padding: 20px;
      }
    }
  </style>
</head>
<body>

<a href="/" class="back-home">
  <i class="fas fa-arrow-left"></i>
  홈으로
</a>

<div class="login-container">
  <div class="brand-logo">
    <h1>깔롱드</h1>
    <p>스타 패션의 모든 것</p>
  </div>

  <c:if test="${loginstate eq 'fail'}">
    <div class="error-msg">
      <i class="fas fa-exclamation-triangle"></i>
      아이디 또는 비밀번호가 잘못되었습니다.
    </div>
  </c:if>

  <form action="/loginimpl" method="post" class="login-form">
    <div class="form-group">
      <input type="text" name="id" placeholder="아이디를 입력하세요" class="form-field" required/>
      <i class="fas fa-user form-icon"></i>
    </div>

    <div class="form-group">
      <input type="password" name="pwd" placeholder="비밀번호를 입력하세요" class="form-field" required/>
      <i class="fas fa-lock form-icon"></i>
    </div>

    <div class="form-options">
      <div class="checkbox-wrapper">
        <input type="checkbox" name="remember" id="remember"/>
        <label for="remember">아이디 저장</label>
      </div>
      <a href="#" onclick="openModal('signup')" class="signup-link">
        <i class="fas fa-user-plus"></i> 회원가입
      </a>
    </div>

    <button type="submit" class="login-btn">
      <i class="fas fa-sign-in-alt"></i>
      로그인
    </button>
  </form>
</div>

<!-- 회원가입 모달 -->
<div id="popupModal" class="modal-backdrop">
  <div class="modal-box">
    <div class="modal-header">
      <h2 class="modal-title">
        <i class="fas fa-user-plus"></i>
        회원가입
      </h2>
      <button class="close-btn" onclick="closeModal()">
        <i class="fas fa-times"></i>
      </button>
    </div>
    <div class="modal-content">
      <div id="modalContent"></div>

      <!-- 로딩 오버레이 -->
      <div class="loading-overlay" id="loadingOverlay">
        <div class="loading-spinner"></div>
        <div class="loading-text">회원가입 처리 중...</div>
      </div>

      <!-- 성공 애니메이션 -->
      <div class="loading-overlay success-animation" id="successAnimation">
        <div class="success-icon">
          <i class="fas fa-check"></i>
        </div>
        <div class="success-message">회원가입 완료!</div>
        <div class="success-submessage">환영합니다. 잠시 후 로그인 페이지로 이동합니다.</div>
      </div>
    </div>
  </div>
</div>

<script>
  function openModal(type) {
    const modal = document.getElementById("popupModal");
    const content = document.getElementById("modalContent");

    if (type === 'signup') {
      content.innerHTML = `
          <form action="/registerimpl" method="post" class="signup-form" id="signupForm">
            <div class="form-group">
              <input name="custId" class="form-field" placeholder="아이디" required />
            </div>
            <div class="form-group">
              <input name="custPwd" type="password" class="form-field" placeholder="비밀번호" required />
            </div>
            <div class="form-group">
              <input name="custName" class="form-field" placeholder="이름" required />
            </div>
            <div class="form-group">
              <input name="custPhone" class="form-field" placeholder="전화번호 (예: 010-1234-5678)" required />
            </div>
            <div class="form-group">
              <input name="custEmail" type="email" class="form-field" placeholder="이메일" required />
            </div>
            <div class="form-group">
              <input name="address" class="form-field" placeholder="주소" required />
            </div>
            <button type="submit" class="signup-btn" id="signupBtn">
              <i class="fas fa-check"></i>
              가입 완료
            </button>
          </form>
        `;
      modal.style.display = "flex";

      // 회원가입 폼 제출 이벤트 처리
      const signupForm = document.getElementById('signupForm');
      const signupBtn = document.getElementById('signupBtn');
      const loadingOverlay = document.getElementById('loadingOverlay');
      const successAnimation = document.getElementById('successAnimation');

      signupForm.addEventListener('submit', function(e) {
        // 버튼 비활성화 및 로딩 표시
        signupBtn.disabled = true;
        signupBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> 처리 중...';
        loadingOverlay.style.display = 'flex';

        // 잠시 후 실제 폼 제출 (시각적 효과를 위해)
        setTimeout(() => {
          // 실제 폼 제출은 브라우저가 처리하도록 함
          signupForm.submit();
        }, 1000);

        // 기본 제출 방지 (위의 setTimeout에서 수동 제출)
        e.preventDefault();
      });
    }
  }

  function closeModal() {
    const modal = document.getElementById("popupModal");
    const loadingOverlay = document.getElementById('loadingOverlay');
    const successAnimation = document.getElementById('successAnimation');

    // 모든 오버레이 숨기기
    loadingOverlay.style.display = 'none';
    successAnimation.style.display = 'none';

    modal.style.display = "none";
  }

  // 모달 외부 클릭시 닫기
  document.getElementById("popupModal").addEventListener("click", function(e) {
    if (e.target === this) {
      closeModal();
    }
  });

  // ESC 키로 모달 닫기
  document.addEventListener("keydown", function(e) {
    if (e.key === "Escape") {
      closeModal();
    }
  });

  // 폼 필드 애니메이션
  document.querySelectorAll('.form-field').forEach(field => {
    field.addEventListener('focus', function() {
      this.parentElement.style.transform = 'scale(1.02)';
    });

    field.addEventListener('blur', function() {
      this.parentElement.style.transform = 'scale(1)';
    });
  });
</script>

</body>
</html>