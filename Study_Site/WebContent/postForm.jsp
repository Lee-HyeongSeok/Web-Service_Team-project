<%--
  Created by IntelliJ IDEA.
  User: gowoo
  Date: 2020-11-19
  Time: 오전 2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8"%>


<html>
<head>
    <title>Database SQL</title>
</head>
<body>
<!-- 아이디, 이메일, 이름, 비밀번호, 만든시간, 업데이트 시간, 주키는 아이디 -->
<form method="post" action="postForm_process.jsp">
    <p>제목 : <input type="text" name="title">
    <p>내용 : <textarea cols="50" rows="10" name="content"></textarea>
    <p>카테고리 : <input type="text" name="category">
    <p>user id : <input type="text" name="userId">

    <p><input type="submit" value="전송">
</form>
</body>
</html>