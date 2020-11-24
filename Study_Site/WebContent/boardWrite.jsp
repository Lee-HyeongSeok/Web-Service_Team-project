<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Study Cafe </title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- CSS -->
	<link rel="stylesheet"
		  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<!-- JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/login.css">
	<link rel="icon" href="image/favicon.png">
</head>
<body>
<!-- header -->
<div class="jumbotron text-center mb-0">
	<h1>Study Cafe</h1>
	<p>Connective Programming study community</p>
</div>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<!-- 리스트 : 부트스트랩은 모바일 우선이라 화면이 작으면 아래로 쌓아서 내려온다 -->
	<ul class="navbar-nav navbar-dark">
		<li class="nav-item active"><a class="nav-link" href="main.jsp">HOME</a></li>
	</ul>
	<!-- Search -->
	<form class="form-inline ml-auto" action="">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<ul class="navbar-nav navbar-dark">
				<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
				<li class="nav-item"><a class="nav-link disabled" href="#">카페소개</a></li>
				<li class="nav-item dropdown">
					<!-- 드롭다운 메뉴-->
					<a class="nav-link dropdown-toggle" href="#"
					   data-toggle="dropdown"> Dropdown </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Link 1</a>
						<a class="dropdown-item" href="#">Link 2</a>
						<a class="dropdown-item" href="#">Link 3</a>
					</div>
				</li>
			</ul>
		</nav>
		<!-- inline여야 간격이 없이 메뉴처럼 나온다. ml-atuo : 우측으로 붙게하기-->
		<input class="form-control mr-sm-2" type="text" placeholder="Search">
		<!-- form-control 입력창 꾸며주는 클래스 -->
		<button class="btn btn-success" type="submit">Search</button>
	</form>
</nav>




<!-- content -->
<div class="container pt-3">
	<div class="row">
		<!-- left content -->
		<div class="col-sm-3">

			<% if(request.isRequestedSessionIdValid()){%>
			<table>
				<tr>
					<td>
                <span style = "font-size:1.0em;  color: black; margin:4px">
    	            <%=request.getParameterValues("name")%>님<br> 환영합니다.
	            </span>
					</td>
				</tr>
			</table>
			<hr>
			<%@include file="Logout_sidebar.jsp" %>
			<% }else{%>
			<%@include file="Login_sidebar.jsp" %>
			<%}%>
			<hr>
			<!-- side menu (link) -->
			<%@include file="sidebar.jsp" %>
		</div>
		<!-- right content -->
		<div class="col-sm-8">
			<form class ="was-validated" name="BoardWriteForm" method="post" action="boardWrite_process.jsp" >
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control is-invalid" id="title" name="title" required>
				</div>
				<div class="mb-3">
					<div class="input-group is-invalid">
						<div class="input-group-prepend">
							<label class="input-group-text" for="categoryId">카테고리</label>
						</div>
						<select class="custom-select" id="categoryId" name="categoryId" required>
							<option value="">카테고리를 선택하세요</option>
							<%
								sql = "select * from category where not id=1";
								pstmt = conn.prepareStatement(sql);
								rs = pstmt.executeQuery();
        						while (rs.next()) { %>
							<option value = "<%=rs.getInt("id")%>"><%=rs.getString("category")%></option>
							<%}
        						if (rs != null)
            						rs.close();
        						if (pstmt != null)
        							pstmt.close();
    						%>
						</select>
					</div>
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" id="content" placeholder="내용을 입력해주세요." name="content" style="height: 300px"></textarea>
				</div >
				<div style="text-align: center">
					<button type="submit" class="btn btn-primary">Submit</button>
					<button onclick="history.go(-1)" class="btn btn-primary">뒤로가기</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- footer -->
<%@include file="footer.jsp" %>

</body>
</html>