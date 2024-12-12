<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #e67c97; /* 연한 분홍색 배경 */
            padding: 20px 0;
            text-align: center;
            /* border-bottom: 2px solid #ff69b4; */ /* 줄 제거 */
        }
        .header h1 {
            margin: 0;
            color: white;
            font-size: 36px;
        }
        .container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            padding: 20px;
        }
        .board-section {
            width: 70%;
        }
        .character-section {
            width: 25%;
            text-align: center;
            background-color: #ffe6f7;
            padding: 20px;
            border-radius: 10px;
        }
        h2 {
            color: #99004c;
            margin-bottom: 20px;
        }
        .create-button {
            text-align: right;
            margin-bottom: 20px;
        }
        .create-button a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #ff6699;
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .create-button a:hover {
            background-color: #ff3366;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
            color: #333;
        }
        img.board-character {
            width: 80px;
            height: auto;
            margin: 10px 0;
            border: 3px solid #ffe6f2;
            border-radius: 10px;
        }
        img.character-image {
            width: 100px;
            height: auto;
            border: 3px solid #ffe6f2;
            border-radius: 10px;
            margin-bottom: 10px;
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
    <script>
        function confirmDelete() {
            return confirm("정말로 삭제하시겠습니까?");
        }
    </script>
</head>
<body>

<div class="header">
    <h1>나만의 티니핑</h1>
</div>

<div class="container">
    <!-- 게시물 리스트 섹션 -->
    <div class="board-section">
        <div class="create-button">
            <!-- 게시물 생성하기 버튼: board_create.jsp로 이동 -->
            <a href="${pageContext.request.contextPath}/createBoard">게시물 생성하기</a>
        </div>

        <table>
            <thead>
            <tr>
                <th>작성자</th>
                <th>캐릭터</th>
                <th>제목</th>
                <th>작성일</th>
                <th>조회수</th>
                <th>수정/삭제</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="board" items="${boardList}">
                <tr>
                    <td>${board.userName}</td>
                    <td>
                        <img class="board-character" src="${pageContext.request.contextPath}${board.characterImage}" alt="캐릭터 이미지"/>
                    </td>
                    <td>${board.title}</td>
                    <td>${board.createdAt}</td>
                    <td>${board.views}</td>
                    <td class="action-buttons">
                        <!-- 삭제 기능 -->
                        <form action="${pageContext.request.contextPath}/deleteBoard" method="post" onsubmit="return confirmDelete();">
                            <input type="hidden" name="boardId" value="${board.id}"/>
                            <button type="submit">삭제</button>
                        </form>
                        <!-- 수정 기능 (추후 구현) -->
                        <form action="${pageContext.request.contextPath}/editBoard" method="get">
                            <input type="hidden" name="boardId" value="${board.id}"/>
                            <button type="submit">수정</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- 캐릭터 이미지 섹션 -->
    <div class="character-section">
        <h2>뀨?</h2>
        <img class="character-image" src="${pageContext.request.contextPath}/images/HACHUPING.png" alt="하츄핑"/>
        <img class="character-image" src="${pageContext.request.contextPath}/images/LALAPING.png" alt="라라핑"/>
        <img class="character-image" src="${pageContext.request.contextPath}/images/POSHILPING.png" alt="포실핑"/>
        <img class="character-image" src="${pageContext.request.contextPath}/images/SHASHAPING.png" alt="샤샤핑"/>
        <img class="character-image" src="${pageContext.request.contextPath}/images/SANDPING.png" alt="샌드핑"/>
    </div>
</div>
</body>
</html>
