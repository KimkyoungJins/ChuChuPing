<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8"/>
  <title>로그인</title>
  <style>
    body {
      background-color: pink;
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .login-container {
      background-color: #ffe6f7;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .login-container h1 {
      color: #cc0066;
      text-align: center;
      margin-bottom: 20px;
    }
    .login-container input {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    .login-container button {
      width: 100%;
      padding: 10px;
      background-color: #ff6699;
      color: white;
      border: none;
      border-radius: 5px;
      font-weight: bold;
      cursor: pointer;
    }
    .login-container button:hover {
      background-color: #ff3366;
    }
    .error {
      color: red;
      text-align: center;
    }
  </style>
</head>
<body>
<div class="login-container">
  <h1>로그인</h1>
  <c:if test="${not empty error}">
    <p class="error">${error}</p>
  </c:if>
  <form action="${pageContext.request.contextPath}/login" method="post">
    <label for="name">아이디:</label>
    <input type="text" name="name" id="name" required />

    <label for="password">비밀번호:</label>
    <input type="password" name="password" id="password" required />

    <button type="submit">로그인</button>
  </form>
</div>
</body>
</html>
