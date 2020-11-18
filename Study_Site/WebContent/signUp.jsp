<%@ page contentType="text/html; charset=utf-8"%>


<html>
<head>
<title>Database SQL</title>
</head>
<body>
<!-- 아이디, 이메일, 이름, 비밀번호, 만든시간, 업데이트 시간, 주키는 아이디 -->
	<form method="post" action="signUp_process.jsp">
		<p>아이디 : <input type="text" name="id">
		<p>이메일 : <input type="text" name="email">
		<p>이름 : <input type="text" name="name">
		<p>비밀번호 : <input type="password" name="passwd">
		
		
		<p><input type="submit" value="전송">
	</form>
</body>
</html>