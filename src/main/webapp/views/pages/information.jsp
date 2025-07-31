<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>내 정보</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        .info-title {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 30px;
        }

        .emoji {
            font-size: 2rem;
            margin-right: 10px;
        }

        .main-btn {
            margin-top: 20px;
        }

        .table td, .table th {
            vertical-align: middle;
        }
    </style>
</head>
<body class="container py-5">

<!-- 제목 -->
<div class="info-title">
    <span class="emoji">🧑‍💼</span>내 정보
</div>

<!-- 고객 정보 테이블 -->
<table class="table table-bordered w-75">
    <tr>
        <th>아이디</th>
        <td>${cust.custId}</td>
    </tr>
    <tr>
        <th>이름</th>
        <td>${cust.custName}</td>
    </tr>
    <tr>
        <th>이메일</th>
        <td>${cust.custEmail}</td>
    </tr>
    <tr>
        <th>주소</th>
        <td>${cust.address}</td>
    </tr>
    <tr>
        <th>전화번호</th>
        <td>${cust.custPhone}</td>
    </tr>
    <tr>
        <th>가입일</th>
        <td><fmt:formatDate value="${cust.custRegdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    </tr>
    <tr>
        <th>최근수정일</th>
        <td><fmt:formatDate value="${cust.custUpdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    </tr>
</table>

<!-- 메인으로 가기 버튼 -->
<a href="/" class="btn btn-primary main-btn">
    🏠 메인으로 가기
</a>

</body>
</html>