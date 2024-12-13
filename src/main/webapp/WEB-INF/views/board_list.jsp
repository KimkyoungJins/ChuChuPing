<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시물 리스트</title>
    <style>
        /* 기본 스타일 */
        body {
            background-color: #ffe6f0; /* 더 연한 분홍색 배경 */
            font-family: 'Noto Sans KR', Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* 헤더 스타일 */
        .header {
            background-color: #ff99cc; /* 밝은 분홍색 배경 */
            padding: 30px 0;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .header h1 {
            margin: 0;
            color: #fff;
            font-size: 48px;
            letter-spacing: 2px;
        }

        /* 컨테이너 스타일 */
        .container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            padding: 40px 60px;
            max-width: 1200px;
            margin: 0 auto;
        }

        /* 게시물 리스트 섹션 */
        .board-section {
            width: 70%;
            background-color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        .board-section h2 {
            color: #ff6699;
            margin-bottom: 20px;
            font-size: 32px;
            border-bottom: 2px solid #ff99cc;
            padding-bottom: 10px;
        }

        /* 게시물 생성 버튼 */
        .create-button {
            text-align: right;
            margin-bottom: 20px;
        }

        .create-button a {
            display: inline-block;
            padding: 12px 25px;
            background-color: #ff6699;
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 25px;
            transition: background-color 0.3s, transform 0.3s;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .create-button a:hover {
            background-color: #ff3366;
            transform: translateY(-2px);
        }

        /* 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 15px 20px;
            text-align: center;
            color: #555;
            border-bottom: 1px solid #f2f2f2;
        }

        th {
            background-color: #ff99cc;
            color: white;
            font-size: 18px;
        }

        tr:nth-child(even) {
            background-color: #f9f2f7;
        }

        tr:hover {
            background-color: #ffe6f0;
        }

        /* 캐릭터 이미지 스타일 */
        img.board-character {
            width: 80px;
            height: auto;
            margin: 10px 0;
            border: 3px solid #ff99cc;
            border-radius: 10px;
            transition: transform 0.3s;
        }

        img.board-character:hover {
            transform: scale(1.05);
        }

        img.character-image {
            width: 100px;
            height: auto;
            border: 3px solid #ff99cc;
            border-radius: 10px;
            margin-bottom: 15px;
            transition: transform 0.3s;
        }

        img.character-image:hover {
            transform: scale(1.1);
        }

        /* 액션 버튼 스타일 */
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .action-buttons form {
            display: inline;
            margin: 0;
        }

        .action-buttons button {
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s, transform 0.3s;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .action-buttons .edit-btn {
            background-color: #66cc99;
        }

        .action-buttons .edit-btn:hover {
            background-color: #339966;
            transform: translateY(-2px);
        }

        .action-buttons .delete-btn {
            background-color: #ff6666;
        }

        .action-buttons .delete-btn:hover {
            background-color: #cc0000;
            transform: translateY(-2px);
        }

        /* 버튼 아이콘 */
        .action-buttons button svg {
            width: 16px;
            height: 16px;
        }

        /* 캐릭터 섹션 스타일 */
        .character-section {
            width: 25%;
            text-align: center;
            background-color: #ffe6f7;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        .character-section h2 {
            color: #ff6699;
            margin-bottom: 20px;
            font-size: 28px;
        }

        /* 반응형 디자인 */
        @media (max-width: 992px) {
            .container {
                flex-direction: column;
                padding: 20px;
            }

            .board-section, .character-section {
                width: 100%;
                margin-bottom: 20px;
            }
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


                    <td>
                        <a href="${pageContext.request.contextPath}/boardDetail?boardId=${board.id}">${board.title}</a>
                    </td>

                    <td>${board.createdAt}</td>
                    <td>${board.views}</td>
                    <td class="action-buttons">
                        <!-- 삭제 기능 -->
                        <form action="${pageContext.request.contextPath}/deleteBoard" method="post" onsubmit="return confirmDelete();">
                            <input type="hidden" name="boardId" value="${board.id}"/>
                            <button type="submit" class="delete-btn">
                                <!-- 삭제 아이콘 -->
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                                </svg>
                                삭제
                            </button>
                        </form>
                        <!-- 수정 기능 -->
                        <form action="${pageContext.request.contextPath}/editBoard" method="get">
                            <input type="hidden" name="boardId" value="${board.id}"/>
                            <button type="submit" class="edit-btn">
                                <!-- 수정 아이콘 -->
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-9 4l9-9"/>
                                </svg>
                                수정
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- 캐릭터 이미지 섹션 -->
    <div class="character-section">
        <h2>티니핑들</h2>
        <img class="character-image" src="${pageContext.request.contextPath}/images/HACHUPING.png" alt="하츄핑"/>
        <img class="character-image" src="${pageContext.request.contextPath}/images/LALAPING.png" alt="라라핑"/>
        <img class="character-image" src="${pageContext.request.contextPath}/images/POSHILPING.png" alt="포실핑"/>
        <img class="character-image" src="${pageContext.request.contextPath}/images/SHASHAPING.png" alt="샤샤핑"/>
        <img class="character-image" src="${pageContext.request.contextPath}/images/SANDPING.png" alt="샌드핑"/>
    </div>
</div>
</body>
</html>
