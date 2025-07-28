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
        <a href="#" onclick="openModal('findId')" style="margin-right: 10px;">아이디 찾기</a>
        <a href="#" onclick="openModal('resetPwd')" style="margin-right: 10px;">비밀번호 재설정</a>
        <a href="#" onclick="openModal('signup')">회원가입</a>
      </div>
    </div>

    <button type="submit"
            style="width: 100%; padding: 12px; background-color: #ff4d4d; color: white; font-weight: bold; border: none; margin-top: 20px;">
      로그인
    </button>
  </form>
</div>

<!-- 모달 -->
<div id="popupModal" class="modal-backdrop" style="display: none;">
  <div class="modal-box">
    <span class="close-btn" onclick="closeModal()">&times;</span>
    <div id="modalContent"></div>
  </div>
</div>

<script>
  function openModal(type) {
    const modal = document.getElementById("popupModal");
    const content = document.getElementById("modalContent");
    let html = "";

    if (type === 'signup') {
      html = `
        <div class="modal-title">회원가입</div>
        <input type='text' class='form-field' placeholder='아이디'/>
        <input type='password' class='form-field' placeholder='비밀번호'/>
        <input type='text' class='form-field' placeholder='이름'/>
        <div style='text-align: right; margin-top: 15px;'>
          <button onclick='closeModal()'>가입 완료</button>
        </div>
      `;
    } else if (type === 'findId') {
      html = `
        <div class="modal-title">아이디 찾기</div>
        <input type='text' class='form-field' placeholder='이메일'/>
        <div style='text-align: right; margin-top: 15px;'>
          <button onclick='closeModal()'>확인</button>
        </div>
      `;
    } else if (type === 'resetPwd') {
      html = `
        <div class="modal-title">비밀번호 재설정</div>
        <input type='text' class='form-field' placeholder='아이디'/>
        <div style='text-align: right; margin-top: 15px;'>
          <button onclick='closeModal()'>확인</button>
        </div>
      `;
    }

    content.innerHTML = html;
    modal.style.display = "flex";
  }

  function closeModal() {
    document.getElementById("popupModal").style.display = "none";
  }
</script>

</body>
</html>
