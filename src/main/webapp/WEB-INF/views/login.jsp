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
      margin: 0; /* 기본 마진 제거 */
    }
    .login-container {
      background-color: #ffe6f7;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      width: 300px; /* 고정 너비 설정 */
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    .login-container h1 {
      color: #cc0066;
      text-align: center;
      margin-bottom: 20px;
    }

    .register-section a {
      display: inline-block;
      padding: 10px 20px;
      background-color: #ff6b6b;
      color: white;
      border: none;
      border-radius: 8px;
      text-decoration: none;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: background-color 0.3s, transform 0.2s;
      margin-top: 20px; /* 로그인 폼과의 간격 추가 */
    }

    .register-section a:hover {
      background-color: #ff4c4c;
      transform: translateY(-2px);
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
      margin-top: 10px; /* 버튼과 입력 필드 간격 */
    }
    .login-container button:hover {
      background-color: #ff3366;
    }
    .error {
      color: red;
      text-align: center;
      margin-bottom: 10px; /* 오류 메시지와 입력 필드 간격 */
    }
  </style>
  <script>
    function confirmDelete() {
      return confirm("정말로 삭제하시겠습니까?");
    }
  </script>
</head>
<body>
<div class="login-container">
  <h1>로그인</h1>
  <c:if test="${not empty error}">
    <p class="error">${error}</p>
  </c:if>
  <form action="${pageContext.request.contextPath}/login" method="post" style="width: 100%;">
    <label for="name">아이디:</label>
    <input type="text" name="name" id="name" required />

    <label for="password">비밀번호:</label>
    <input type="password" name="password" id="password" required />

    <button type="submit">로그인</button>
  </form>

  <%-- 회원가입 버튼 추가하기 --%>
  <div class="register-section">
    <a href="${pageContext.request.contextPath}/register">회원가입</a>
  </div>
</div>
</body>
</html>
