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

        /* 검색 폼 스타일 */
        .search-form input {
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .search-form button {
            padding: 10px;
            background-color: #ff6699;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .search-form button:hover {
            background-color: #ff3366;
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

        /* 반응형 디자인 */
        @media (max-width: 992px) {
            .container {
                flex-direction: column;
                padding: 20px;
            }

            .board-section {
                width: 100%;
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
            <!-- 검색 폼 추가 -->
            <form class="search-form" action="${pageContext.request.contextPath}/boards" method="get" style="display: inline;">
                <input type="text" name="query" value="${searchQuery}" placeholder="검색어 입력">
                <button type="submit">검색</button>
            </form>
            <!-- 게시물 생성하기 버튼 -->
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
                    <td>
                        <form action="${pageContext.request.contextPath}/deleteBoard" method="post" onsubmit="return confirmDelete();">
                            <input type="hidden" name="boardId" value="${board.id}">
                            <button type="submit" class="delete-btn">삭제</button>
                        </form>
                        <form action="${pageContext.request.contextPath}/editBoard" method="get">
                            <input type="hidden" name="boardId" value="${board.id}">
                            <button type="submit" class="edit-btn">수정</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
