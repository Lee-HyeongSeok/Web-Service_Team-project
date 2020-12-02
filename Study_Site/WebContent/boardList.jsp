<%@ page import="java.util.Enumeration" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ include file="dbconn_web.jsp" %>
<html>
<head>
    <title>Study Cafe</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSS -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
    <!-- JS -->
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</head>
<body>
<!-- header -->
<div class="jumbotron text-center mb-0" style="background:#08060b; padding : 0;border-radius: 0">
    <a href="main.jsp"><img alt="special study cafe" src="image/scs.jpg" style="height:100%"></a>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <!-- 리스트 : 부트스트랩은 모바일 우선이라 화면이 작으면 아래로 쌓아서 내려온다 -->
    <ul class="navbar-nav navbar-dark">
        <li class="nav-item active"><a class="nav-link" href="main.jsp">HOME</a></li>
    </ul>
    <!-- Search -->
    <form class="form-inline ml-auto" action="boardList.jsp">
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <ul class="navbar-nav navbar-dark">
                <li class="nav-item dropdown">
                    <!-- 드롭다운 메뉴-->
                    <a class="nav-link dropdown-toggle" href="#"
                       data-toggle="dropdown"> 게시판 이동 </a>
                    <div class="dropdown-menu">
                        <%
                            PreparedStatement pstmt = null;
                            ResultSet rs = null;

                            String categorySql = "select id,category from category";
                            pstmt = conn.prepareStatement(categorySql);
                            rs = pstmt.executeQuery();
                            while (rs.next()) { %>
                        <a class="dropdown-item"
                           href="boardList.jsp?CategoryId=<%=rs.getInt("id")%>"><%=rs.getString("category")%>
                        </a>
                        <%
                            }
                            if (rs != null)
                                rs.close();
                            if (pstmt != null)
                                pstmt.close();
                        %>
                    </div>
            </ul>
        </nav>
        <!-- inline여야 간격이 없이 메뉴처럼 나온다. ml-atuo : 우측으로 붙게하기-->
        <input class="form-control mr-sm-2" type="text" placeholder="Search" name="title" id="title">
        <!-- form-control 입력창 꾸며주는 클래스 -->
        <button class="btn btn-success" type="submit">Search</button>
    </form>
</nav>


<!-- content -->
<div class="container pt-3">
    <div class="row">
        <!-- left content -->
        <div class="col-sm-3">

            <% if (request.isRequestedSessionIdValid()) {%>
            <table>
                <td>
                <span style="font-size:1.0em;  color: black; margin:4px">
    	            <%=session.getAttribute("sessionName")%>님<br> 환영합니다.
	            </span>
                </td>
            </table>
            <hr>
            <%@include file="/Logout_sidebar.jsp" %>
            <% } else {%>
            <%@include file="/Login_sidebar.jsp" %>
            <%}%>
            <hr>
            <!-- side menu (link) -->
            <%@include file="/sidebar.jsp" %>
        </div>
        <!-- right content -->
        <div class="col-sm-8">
            <% if (request.isRequestedSessionIdValid()) {%>
            <marquee behavior="alternate" scrolldelay="100" direction="right">
                <%= session.getAttribute("sessionName")%>님 반갑습니다.
            </marquee>
            <%}%>

            <table id="postTable" class="table table-inbox table-hover" style="width : 800px; height : 250px">
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
                    try {
                        Enumeration en = request.getParameterNames();
                        String headerName = (String) en.nextElement();
                        String headerValue = request.getParameter(headerName);
                        String selectSql = "SELECT * FROM POST WHERE " + headerName;

                        if (headerName.equals("title")) {
                            selectSql = selectSql + " LIKE '%" + headerValue + "%'";
                            pstmt = conn.prepareStatement(selectSql);
                            rs = pstmt.executeQuery();
                        }
                        else{
                            selectSql +=  " = ?";
                            pstmt = conn.prepareStatement(selectSql);
                            pstmt.setString(1, headerValue);
                            rs = pstmt.executeQuery();
                        }

                        while (rs.next()) {%>
                <tr class="postTr" onclick="window.location.href='boardView.jsp?postId=<%=rs.getString("id")%>'">
                    <td scope="row">#<%=rs.getString("id")%>
                    </td>
                    <td><%=rs.getString("title")%>
                    </td>
                    <td><%=rs.getString("UserId")%>
                    </td>
                    <td><%=rs.getDate("createdDate")%>
                    </td>
                </tr>
                <%
                        }
                    } catch (SQLException e) {
                        out.println("SQLException :  " + e);
                    } finally {
                        if (rs != null) {
                            rs.close();
                        }
                        if (pstmt != null) {
                            pstmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    }
                %>
                </tbody>
            </table>
            <% if (request.isRequestedSessionIdValid()) {%>

            <div style="text-align: center;width: 800px;">
                <input id="writeBtn" style="text-align: center;width: 50%" class="btn btn-info" type="button"
                       value="글쓰기"
                       onclick="document.location='boardWrite.jsp';"/>
            </div>
            <%}%>

        </div>
    </div>
</div>
<!-- footer -->
<%@include file="footer.jsp" %>

</body>
</html>


            
