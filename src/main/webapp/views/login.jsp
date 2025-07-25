<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body><%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    .modal-backdrop {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100vw;
      height: 100vh;
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
      animation: fadeIn 0.3s ease;
    }

    .close-btn {
      position: absolute;
      top: 12px;
      right: 15px;
      font-size: 20px;
      font-weight: bold;
      cursor: pointer;
    }

    @keyframes fadeIn {
      from {opacity: 0; transform: scale(0.9);}
      to {opacity: 1; transform: scale(1);}
    }

    .form-field {
      width: 100%;
      padding: 10px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
    }

    .modal-title {
      font-size: 20px;
      font-weight: bold;
      margin-bottom: 10px;
    }

    .modal-subtitle {
      margin-bottom: 15px;
    }
  </style>

  <script>
    function openModal(type) {
      const modal = document.getElementById("popupModal");
      const content = document.getElementById("modalContent");
      let html = "";

      if (type === 'signup') {
        html = `
    <div class="modal-title">회원가입</div>
    <div class="modal-subtitle">가입 정보를 입력해주세요.</div>

    <input type='text' class='form-field' placeholder='아이디'/>
    <input type='password' class='form-field' placeholder='비밀번호'/>
    <input type='password' class='form-field' placeholder='비밀번호 재입력'/>
    <input type='text' class='form-field' placeholder='이름'/>

    <div style="display: flex; gap: 10px;">
      <input type='text' class='form-field' placeholder='년(4자)' style="flex:1;">
      <select class='form-field' style="flex:1;">
        <option>월</option>
        <option>1</option><option>2</option><option>3</option><option>4</option>
        <option>5</option><option>6</option><option>7</option><option>8</option>
        <option>9</option><option>10</option><option>11</option><option>12</option>
      </select>
      <input type='text' class='form-field' placeholder='일' style="flex:1;">
    </div>

    <div style="margin-bottom: 10px;">
      <label><input type="radio" name="gender"/> 남자</label>
      <label style="margin-left: 10px;"><input type="radio" name="gender"/> 여자</label>
    </div>

    <input type='text' class='form-field' placeholder='본인 확인 이메일'/>

    <div style="display: flex; gap: 10px;">
      <select class='form-field' style="flex: 1;">
        <option>대한민국 +82</option>
        <option>일본 +81</option>
        <option>미국 +1</option>
      </select>
    </div>

    <input type='text' class='form-field' placeholder='전화번호 입력'/>

    <label style="font-size: 14px;">
      <input type='checkbox'/> 개인정보 수집 및 이용에 동의합니다.
    </label>

    <div style='text-align: right; margin-top: 15px;'>
      <button onclick='closeModal()'>가입 완료</button>
    </div>
  `;
      } else if (type === 'findId') {
        html = `
    <div class="modal-title">아이디 찾기</div>
    <div class="modal-subtitle">이메일을 입력하세요.</div>
    <input type='text' class='form-field' placeholder='이메일'/>
    <div style='text-align: right; margin-top: 15px;'>
      <button onclick='closeModal()'>확인</button>
    </div>
  `;
      } else if (type === 'resetPwd') {
        html = `
    <div class="modal-title">비밀번호 재설정</div>
    <div class="modal-subtitle">아이디를 입력하세요.</div>
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
</head>
<body>

<div style="width: 400px; margin: 100px auto;">
  <h2 style="text-align: left;">로그인</h2>

  <form action="/loginimpl" method="post">
    <input type="text" name="id" placeholder="아이디" class="form-field"/>
    <input type="password" name="pw" placeholder="비밀번호" class="form-field"/>

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

  <div style="margin-top: 30px; display: flex; justify-content: space-around;">
    <div style="text-align: center;">
      <img src="/image/naver.jpg" width="40"/><br/>네이버 로그인
    </div>
    <div style="text-align: center;">
      <img src="/image/kakao.jpg" width="40"/><br/>카카오 로그인
    </div>
    <div style="text-align: center;">
      <img src="/image/apple.jpg" width="47"/><br/>애플 로그인
    </div>
    <div style="text-align: center;">
      <img src="/image/toss.jpg" width="40"/><br/>토스 로그인
    </div>
  </div>
</div>

<!-- 모달 영역 -->
<div id="popupModal" class="modal-backdrop">
  <div class="modal-box">
    <span class="close-btn" onclick="closeModal()">&times;</span>
    <div id="modalContent"></div>
  </div>
</div>

</body>
</html>
</html>

