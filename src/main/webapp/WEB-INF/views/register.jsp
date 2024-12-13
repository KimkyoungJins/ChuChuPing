<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8"/>
  <title>회원가입</title>
  <style>
    body {
      background-color: #ffe6f7;
      font-family: Arial, sans-serif;
    }

    .container {
      max-width: 400px;
      margin: 100px auto;
      background: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 8px 16px rgba(0,0,0,0.1);
    }

    h1 {
      color: #cc0066;
      text-align: center;
      margin-bottom: 20px;
    }

    label {
      display: block;
      margin-bottom: 10px;
      font-weight: bold;
      color: #99004c;
    }

    input[type="text"], input[type="password"] {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-sizing: border-box;
      margin-bottom: 20px;
    }

    button {
      padding: 12px 25px;
      background-color: #ff66a3;
      color: white;
      border: none;
      border-radius: 25px;
      font-weight: bold;
      cursor: pointer;
      transition: background-color 0.3s, transform 0.3s;
      width: 100%;
    }

    button:hover {
      background-color: #ff3380;
      transform: translateY(-2px);
    }

    .error {
      color: red;
      margin-bottom: 10px;
      text-align: center;
    }

    .login-link {
      text-align: center;
      margin-top: 15px;
    }

    .login-link a {
      color: #cc0066;
      text-decoration: none;
    }

    .login-link a:hover {
      text-decoration: underline;
    }

  </style>
</head>
<body>
<div class="container">
  <h1>회원가입</h1>
  <c:if test="${not empty error}">
    <p class="error">${error}</p>
  </c:if>
  <form action="${pageContext.request.contextPath}/register" method="post">
    <label for="name">아이디(이름)</label>
    <input type="text" id="name" name="name" required>

    <label for="password">비밀번호</label>
    <input type="password" id="password" name="password" required>

    <button type="submit">회원가입</button>
  </form>
  <div class="login-link">
    <p>이미 계정이 있나요? <a href="${pageContext.request.contextPath}/login">로그인</a></p>
  </div>
</div>
</body>
</html>
