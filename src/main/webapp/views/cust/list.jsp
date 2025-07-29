<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>회원관리(Admin)</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    th, td {
      vertical-align: middle !important;
    }
  </style>
</head>
<body>

<div class="container mt-5">
  <h2 class="mb-4 fw-bold text-primary">👥 회원관리 (Admin)</h2>

  <table class="table table-hover table-bordered text-center align-middle">
    <thead class="table-light">
    <tr>
      <th>ID</th>
      <th>이름</th>
      <th>주소</th>
      <th>전화번호</th>
      <th>이메일</th>
      <th>가입일</th>
      <th>수정일</th>
      <th>관리</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="c" items="${custs}">
      <tr>
        <td>${c.custId}</td>
        <td>${c.custName}</td>
        <td>${c.address}</td>
        <td>${c.custPhone}</td>
        <td>${c.custEmail}</td>
        <td><fmt:formatDate value="${c.custRegdate}" pattern="yyyy-MM-dd HH:mm" /></td>
        <td><fmt:formatDate value="${c.custUpdate}" pattern="yyyy-MM-dd HH:mm" /></td>
        <td>
          <a href="/admin/cust/edit?custId=${c.custId}" class="btn btn-sm btn-warning">수정</a>
          <a href="/admin/cust/delete?custId=${c.custId}" class="btn btn-sm btn-danger"
             onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

</body>
</html>
