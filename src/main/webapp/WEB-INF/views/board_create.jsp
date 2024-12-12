<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>게시물 생성</title>
    <style>
        body {
            background-color: pink;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .create-container {
            background-color: #ffe6f7;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .create-container h1 {
            color: #cc0066;
            text-align: center;
            margin-bottom: 20px;
        }
        .create-container form {
            display: flex;
            flex-direction: column;
        }
        .create-container label {
            margin: 10px 0 5px 0;
            color: #99004c;
        }
        .create-container input, .create-container select, .create-container textarea {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .create-container button {
            margin-top: 20px;
            padding: 10px;
            background-color: #ff6699;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }
        .create-container button:hover {
            background-color: #ff3366;
        }
    </style>
</head>
<body>
<div class="create-container">
    <h1>게시물 생성</h1>
    <form action="${pageContext.request.contextPath}/submitBoard" method="post">
        <label for="title">제목:</label>
        <input type="text" name="title" id="title" required />

        <label for="content">내용:</label>
        <textarea name="content" id="content" rows="5" required></textarea>

        <label for="characterId">캐릭터 선택:</label>
        <select name="characterId" id="characterId" required>
            <option value="" disabled selected>캐릭터를 선택하세요</option>
            <c:forEach var="character" items="${characters}">
                <option value="${character.id}">${character.name}</option>
            </c:forEach>
        </select>

        <button type="submit">게시물 생성</button>
    </form>
</div>
</body>
</html>
