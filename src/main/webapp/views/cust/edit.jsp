<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>회원 정보 수정</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
  <h2 class="mb-4 fw-bold text-primary">👤 회원 정보 수정</h2>

  <form action="/admin/cust/edit" method="post">
    <input type="hidden" name="custId" value="${cust.custId}" />

    <div class="mb-3">
      <label class="form-label">이름</label>
      <input type="text" class="form-control" name="custName" value="${cust.custName}" required>
    </div>

    <div class="mb-3">
      <label class="form-label">비밀번호</label>
      <input type="password" class="form-control" name="custPwd" value="${cust.custPwd}" required>
    </div>

    <div class="mb-3">
      <label class="form-label">주소</label>
      <input type="text" class="form-control" name="address" value="${cust.address}" required>
    </div>

    <div class="mb-3">
      <label class="form-label">전화번호</label>
      <input type="text" class="form-control" name="custPhone" value="${cust.custPhone}" required>
    </div>

    <div class="mb-3">
      <label class="form-label">이메일</label>
      <input type="email" class="form-control" name="custEmail" value="${cust.custEmail}">
    </div>

    <button type="submit" class="btn btn-primary">수정 완료</button>
    <a href="/admin/cust/list" class="btn btn-secondary">목록으로</a>
  </form>
</div>

</body>
</html>
