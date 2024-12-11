<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시물 생성</title>
    <style>
        .character-option {
            display: inline-block;
            text-align: center;
            margin: 10px;
        }
        .character-option img {
            width: 80px;
            height: 80px;
            display: block;
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
<h2>게시물 생성</h2>
<form action="/boards/create" method="post">
    제목: <input type="text" name="title" required><br><br>
    내용: <textarea name="content" rows="5" cols="50" required></textarea><br><br>

    <p>캐릭터 선택:</p>
    <div>
        <c:forEach var="character" items="${characters}">
            <label class="character-option">
                <img src="${character.imageUrl}" alt="${character.name}"/>
                <input type="radio" name="characterId" value="${character.id}" required> ${character.name}
            </label>
        </c:forEach>
    </div>
    <br><br>

    <!-- 실제로는 로그인된 유저의 정보를 세션에서 가져와야 함. 여기서는 임시로 userId=1 -->
    <input type="hidden" name="userId" value="1">

    <button type="submit">생성</button>
</form>
</body>
</html>
