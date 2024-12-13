<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8"/>
  <title>게시물 상세보기</title>
  <style>
    body {
      background-color: pink;
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    .header {
      background-color: #ffb6c1; /* 연한 분홍색 */
      text-align: center;
      padding: 20px 0;
    }

    .header h1 {
      margin: 0;
      color: #cc0066;
    }

    .container {
      display: flex;
      flex-direction: row;
      justify-content: space-between;
      padding: 40px;
    }

    .character-section {
      width: 20%;
      background-color: #ffe6f7; /* 조금 더 연한 분홍 */
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 20px;
      border-radius: 10px;
    }

    .character-section h2 {
      color: #99004c;
      margin-bottom: 20px;
    }

    .character-section img {
      width: 100px;
      height: auto;
      border: 3px solid #ffe6f2;
      border-radius: 10px;
      margin-bottom: 20px;
    }

    .detail-section {
      width: 55%;
      background-color: #fff;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    .detail-section h2 {
      color: #cc0066;
      margin-top: 0;
    }

    .detail-info {
      margin-bottom: 20px;
    }

    .detail-info span {
      display: inline-block;
      margin: 5px 0;
      font-weight: bold;
      color: #99004c;
    }

    .detail-content {
      border: 1px solid #ccc;
      border-radius: 5px;
      padding: 20px;
      white-space: pre-wrap;
      background: #fffafc;
    }

    .actions {
      text-align: right;
      margin-top: 20px;
    }

    .actions a {
      display: inline-block;
      padding: 10px 20px;
      background-color: #ff6699;
      color: white;
      text-decoration: none;
      border-radius: 5px;
      margin-left: 10px;
    }

    .actions a:hover {
      background-color: #ff3366;
    }
  </style>
</head>
<body>
<div class="header">
  <h1>게시물 상세보기</h1>
</div>
<div class="container">
  <!-- 왼쪽 캐릭터 이미지 섹션 -->
  <div class="character-section">
    <h2>내 티니핑</h2>
    <img src="${pageContext.request.contextPath}${board.characterImage}" alt="캐릭터 이미지"/>
  </div>

  <!-- 게시물 상세 정보 섹션 -->
  <div class="detail-section">
    <h2>${board.title}</h2>
    <div class="detail-info">
      <span>작성자: ${board.userName}</span><br/>
      <span>작성일: ${board.createdAt}</span><br/>
      <span>조회수: ${board.views}</span>
    </div>
    <table>
      <tr>
        <th>조회수</th>
        <td>${board.views}</td>
      </tr>
    </table>
    <div class="detail-content">
      ${board.content}
    </div>
    <div class="actions">
      <a href="${pageContext.request.contextPath}/boards">목록으로</a>
      <!-- 수정/삭제 기능 추후 구현 -->
      <!-- <a href="${pageContext.request.contextPath}/editBoard?boardId=${board.id}">수정</a>
            <a href="${pageContext.request.contextPath}/deleteBoard?boardId=${board.id}">삭제</a> -->
    </div>
  </div>

  <!-- 오른쪽 캐릭터 이미지 섹션 -->
  <div class="character-section">
    <h2>내 티니핑</h2>
    <img src="${pageContext.request.contextPath}${board.characterImage}" alt="캐릭터 이미지"/>
  </div>
</div>
</body>
</html>
