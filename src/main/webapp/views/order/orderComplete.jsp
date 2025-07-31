<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <title>결제 완료</title>
  <meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #1b2838;
      color: #ffffff;
      font-family: 'Segoe UI', sans-serif;
    }
    .complete-box {
      margin-top: 100px;
      padding: 50px;
      background-color: #2a475e;
      border-radius: 15px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
    }
    .btn-main {
      background-color: #66c0f4;
      border: none;
      color: #0e1c25;
      font-weight: bold;
    }
    .btn-main:hover {
      background-color: #8acde9;
    }
  </style>
</head>
<body>
<div class="container d-flex justify-content-center">
  <div class="complete-box text-center">
    <h2 class="mb-4">✅ 결제가 완료되었습니다!</h2>
    <p class="mb-4">이용해주셔서 감사합니다.<br>결제 내역은 마이페이지에서 확인하실 수 있습니다.</p>
    <a href="/" class="btn btn-main px-4 py-2">메인으로 돌아가기</a>
  </div>
</div>
</body>
</html>
