<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>게시물 작성</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #ffe6f2; /* 연한 분홍색 배경 */
            font-family: Arial, sans-serif;
            color: #333;
        }
        .container {
            display: flex;
            width: 100%;
            min-height: 100vh;
        }
        .form-section {
            flex: 2;
            padding: 40px;
        }
        .character-section {
            flex: 1;
            padding: 40px;
            background-color: #ffd6e7; /* 조금 더 진한 분홍 */
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        h1, h2 {
            color: #cc0066; /* 진한 분홍 계열 폰트 */
        }
        label {
            font-weight: bold;
            display: inline-block;
            margin-bottom: 5px;
            color: #99004c;
        }
        input[type="text"], textarea {
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            box-sizing: border-box;
            margin-bottom: 20px;
            font-size: 14px;
        }
        textarea {
            height: 200px;
            resize: none;
        }
        .submit-button {
            background-color: #ff99c2;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            color: #fff;
            font-weight: bold;
            cursor: pointer;
        }
        .submit-button:hover {
            background-color: #ff66a3;
        }
        .character-section h2 {
            color: #99004c;
            margin-bottom: 20px;
        }
        .character-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
            gap: 20px;
            width: 100%;
        }
        .character-grid img {
            width: 100%;
            height: auto;
            border: 3px solid #ffe6f2;
            border-radius: 10px;
            cursor: pointer;
            transition: border-color 0.3s;
        }
        .character-grid img.selected {
            border-color: #cc0066; /* 선택 시 진한 분홍색 테두리 */
        }
        .character-info {
            margin-top: 20px;
            color: #99004c;
            text-align: center;
        }
    </style>
    <script>
        let selectedCharacterId = null;

        function selectCharacter(characterId, element) {
            // 이전에 선택된 이미지의 selected 클래스를 제거
            const images = document.querySelectorAll('.character-grid img');
            images.forEach(img => img.classList.remove('selected'));

            // 현재 선택한 이미지에 selected 클래스 추가
            element.classList.add('selected');

            // 선택한 캐릭터 ID 갱신
            selectedCharacterId = characterId;

            // 숨겨진 input에 캐릭터 ID 반영
            document.getElementById('characterIdInput').value = characterId;
        }

        function validateForm() {
            if (!selectedCharacterId) {
                alert("캐릭터를 선택해주세요!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="container">

    <!-- 게시물 작성 폼 영역 -->
    <div class="form-section">
        <h1>게시물 작성</h1>
        <form action="submitBoard" method="post" onsubmit="return validateForm();">
            <label for="title">제목:</label>
            <input type="text" name="title" id="title" required/>

            <label for="content">내용:</label>
            <textarea name="content" id="content" required></textarea>

            <!-- 선택된 캐릭터 ID를 저장할 숨겨진 필드 -->
            <input type="hidden" name="character_id" id="characterIdInput" value=""/>

            <button type="submit" class="submit-button">저장</button>
        </form>
    </div>

    <!-- 캐릭터 선택 영역 -->
    <div class="character-section">
        <h2>나만의 티니핑 선택하기</h2>
        <div class="character-grid">
            <c:forEach var="character" items="${characters}">
                <img src="${pageContext.request.contextPath}${character.imageUrl}"
                     alt="${character.name}"
                     onclick="selectCharacter(${character.id}, this)"/>
            </c:forEach>
        </div>
        <div class="character-info">
            캐릭터를 클릭하여 선택하세요.
        </div>
    </div>

</div>
</body>
</html>
