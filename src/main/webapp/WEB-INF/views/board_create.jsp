<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시물 작성</title>
</head>
<body>
<h1>게시물 작성 페이지</h1>
<form action="submitBoard" method="post">
    제목: <input type="text" name="title"/><br/>
    내용: <textarea name="content"></textarea><br/>
    <button type="submit">저장</button>
</form>
</body>
</html>
