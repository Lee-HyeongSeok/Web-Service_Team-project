<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import = "java.util.Date" %>

<!-- 나중에 boardView에 복붙하기  -->
<!DOCTYPE html>
<html>
<head>
	<title>Study Cafe :: Home</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- CSS -->
	<link rel="stylesheet"
		  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<!-- JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/main.css">
	<link rel="icon" href="image/favicon.png">

	<script>
		function removePostEventListener(postId){
			if(confirm("정말로 삭제 하시겠습니까?")){
				document.location = "delete_post_process.jsp?postId="+ postId;
			}
		}
	</script>

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
                   <%=session.getAttribute("sessionName")%>님<br> 환영합니다.
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
			<%
				request.setCharacterEncoding("UTF-8");
				Integer postId = Integer.parseInt(request.getParameter("postId"));
				String name = null;
				Date createdDate = null;
				String title = null;
				String content = null;
				try{
					String selectSql = "SELECT * FROM post where id = ?";
					pstmt = conn.prepareStatement(selectSql);
					pstmt.setInt(1, postId); // postId가 post 테이블의 Id
					rs = pstmt.executeQuery();

					if(rs.next()) {
						name = rs.getString("UserId");
						createdDate = rs.getDate("createdDate");
						title = rs.getString("title");
						content = rs.getString("content");
					}
				}
				catch(SQLException ex){
					out.println("해당 게시글 불러오기 실패");
					out.println("SQLException : " + ex.getMessage());
				}
				finally{
					if(pstmt != null)
						pstmt.close();
					if(conn != null)
						conn.close();
				}
			%>
		</div>
		<!-- footer -->
		<%@include file="footer.jsp" %>

</body>
</html>
