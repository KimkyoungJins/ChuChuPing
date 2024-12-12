<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시물 리스트</title>
    <style>
        body {
            background-color: pink;
            font-family: Arial, sans-serif;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background: #fff;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        img {
            width: 50px;
            height: auto;
        }
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
        }
        .action-buttons form {
            display: inline;
            margin: 0;
        }
    </style>
</head>
<body>

<h1 style="text-align: center;">게시물 리스트</h1>

<table>
    <thead>
    <tr>
        <th>작성자</th>
        <th>캐릭터</th>
        <th>제목</th>
        <th>작성일</th>
        <th>조회수</th>
        <th>액션</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="board" items="${boardList}">
        <tr>
            <td>${board.userName}</td>
            <td><img src="${board.characterImage}" alt="캐릭터 이미지"/></td>
            <td>${board.title}</td>
            <td>${board.createdAt}</td>
            <td>${board.views}</td>
            <td class="action-buttons">
                <!-- 삭제 기능 -->
                <form action="${pageContext.request.contextPath}/deleteBoard" method="post">
                    <input type="hidden" name="boardId" value="${board.id}"/>
                    <button type="submit">삭제</button>
                </form>
                <!-- 수정 기능 (추후 구현) -->
                <form action="#" method="post">
                    <input type="hidden" name="boardId" value="${board.id}"/>
                    <button type="button" disabled>수정(미구현)</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
