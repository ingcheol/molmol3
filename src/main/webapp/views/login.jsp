<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <title>로그인</title>
  <style>
    body {
      font-family: sans-serif;
      background-color: #f5f5f5;
    }

    .form-field {
      width: 100%;
      padding: 10px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
    }

    .error-msg {
      color: red;
      margin-bottom: 10px;
      font-size: 14px;
    }

    .modal-backdrop {
      display: none;
      position: fixed;
      top: 0; left: 0;
      width: 100vw; height: 100vh;
      background-color: rgba(0, 0, 0, 0.5);
      justify-content: center;
      align-items: center;
      z-index: 999;
    }

    .modal-box {
      background-color: white;
      width: 500px;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
      position: relative;
    }

    .modal-title {
      font-size: 20px;
      font-weight: bold;
      margin-bottom: 10px;
    }

    .close-btn {
      position: absolute;
      top: 12px;
      right: 15px;
      font-size: 20px;
      font-weight: bold;
      cursor: pointer;
    }
  </style>
</head>
<body>

<div style="width: 400px; margin: 100px auto;">
  <h2 style="text-align: left;">로그인</h2>

  <c:if test="${loginstate eq 'fail'}">
    <div class="error-msg">아이디 또는 비밀번호가 잘못되었습니다.</div>
  </c:if>

  <form action="/loginimpl" method="post">
    <input type="text" name="id" placeholder="아이디" class="form-field"/>
    <input type="password" name="pwd" placeholder="비밀번호" class="form-field"/>

    <div style="display: flex; justify-content: space-between; align-items: center; font-size: 14px;">
      <label><input type="checkbox" name="remember"/> 아이디 저장</label>
      <div>
        <a href="#" onclick="openModal('signup')">회원가입</a>
      </div>
    </div>

    <button type="submit"
            style="width: 100%; padding: 12px; background-color: #ff4d4d; color: white; font-weight: bold; border: none; margin-top: 20px;">
      로그인
    </button>
  </form>
</div>

<!-- 회원가입 모달 -->
<div id="popupModal" class="modal-backdrop">
  <div class="modal-box">
    <span class="close-btn" onclick="closeModal()">&times;</span>
    <div id="modalContent"></div>
  </div>
</div>

<script>
  function openModal(type) {
    const modal = document.getElementById("popupModal");
    const content = document.getElementById("modalContent");

    if (type === 'signup') {
      content.innerHTML = `
        <form action="/registerimpl" method="post">
          <div class="modal-title">회원가입</div>
          <input name="custId" class="form-field" placeholder="아이디" required />
          <input name="custPwd" type="password" class="form-field" placeholder="비밀번호" required />
          <input name="custName" class="form-field" placeholder="이름" required />
          <input name="custPhone" class="form-field" placeholder="전화번호" required />
          <input name="custEmail" type="email" class="form-field" placeholder="이메일" required />
          <input name="address" class="form-field" placeholder="주소" required />
          <div style="text-align: right; margin-top: 15px;">
            <button type="submit">가입 완료</button>
          </div>
        </form>
      `;
      modal.style.display = "flex";
    }
  }

  function closeModal() {
    document.getElementById("popupModal").style.display = "none";
  }
</script>

</body>
</html>
