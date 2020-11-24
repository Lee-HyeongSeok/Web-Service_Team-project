<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Study Cafe</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- CSS -->
	<link rel="stylesheet"
		  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<!-- JS -->
	<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="../css/login.css">


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
		<li class="nav-item active"><a class="nav-link" href="../main.jsp">HOME</a></li>
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
			<%@include file="/Logout_sidebar.jsp" %>
			<% }else{%>
			<%@include file="/Login_sidebar.jsp" %>
			<%}%>
			<hr>
			<!-- side menu (link) -->
			<%@include file="/sidebar.jsp" %>
		</div>
		<!-- right content -->
		<div class="col-sm-8">
			<marquee behavior="alternate" scrolldelay="100" direction="right">
				Anonymous님 반갑습니다.</marquee>
			<table class="table" style="width : 800px; height : 200px" >
				<thead class="thead-dark">
				<tr>
					<th scope="col">번 호</th>
					<th scope="col">제 목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
				</tr>
				</thead>
				<tbody>
					<%
						request.setCharacterEncoding("UTF-8");
						Integer categoryId = Integer.parseInt(request.getParameter("category"));
						try {
							String selectSql = "SELECT * FROM POST WHERE categoryId=?";
							pstmt = conn.prepareStatement(selectSql);
							pstmt.setInt(1, categoryId);
							rs = pstmt.executeQuery();

						while(rs.next()) {%>
				<tr  onclick="window.location.href='view.jsp'">
					<td scope="row">#<%=rs.getString("id")%></td>
					<td><%=rs.getString("title")%></td>
					<td><%=rs.getString("UserId")%></td>
					<td><%=rs.getDate("createdDate")%></td>
				</tr>
				<%}
				}catch(SQLException e){
					out.println("SQLException : " + categoryId);
				}finally {
					if(rs != null){
						rs.close();
					}
					if(pstmt != null){
						pstmt.close();
					}
					if(conn != null){
						conn.close();
					}
				}
				%>
				</tbody>
			</table>
			<input type="button" value="처음으로" onclick="" />
			<input type="button" value="글쓰기" onclick="" />
		</div>
	</div>
</div>
<!-- footer -->
<%@include file="../footer.jsp" %>

</body>
</html>


            
