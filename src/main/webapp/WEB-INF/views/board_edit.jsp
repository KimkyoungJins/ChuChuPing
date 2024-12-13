<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>게시물 수정</title>
  <style>
    body {
      background-color: #ffe6f7;
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 600px;
      margin: 50px auto;
      background: #fff;
      padding: 30px;
      border-radius: 10px;
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

    input[type="text"], textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-sizing: border-box;
      margin-bottom: 20px;
    }

    textarea {
      height: 200px;
      resize: none;
    }

    button {
      padding: 10px 20px;
      background-color: #ff66a3;
      color: white;
      border: none;
      border-radius: 5px;
      font-weight: bold;
      cursor: pointer;
      transition: background-color 0.3s;
      display: block;
      margin: 0 auto;
    }

    button:hover {
      background-color: #ff3380;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>게시물 수정</h1>
  <form action="${pageContext.request.contextPath}/editBoard" method="post">
    <input type="hidden" name="boardId" value="${board.id}"/>
    <label for="title">제목</label>
    <input type="text" name="title" id="title" value="${board.title}" required/>

    <label for="content">내용</label>
    <textarea name="content" id="content" required>${board.content}</textarea>

    <button type="submit">저장</button>
  </form>
</div>
</body>
</html>
