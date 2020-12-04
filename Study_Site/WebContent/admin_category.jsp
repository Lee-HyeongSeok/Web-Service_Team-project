<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ include file="dbconn_web.jsp" %>
<html>
<head>
    <title>Study Cafe :: 회원 관리</title>
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
        <input type="submit" class="btn btn-success">Search</input>
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
            <% if (request.isRequestedSessionIdValid() && session.getAttribute("sessionId").equals("1")) {%>

            <form action="admin_category_process.jsp" method="get">
                <div class="col-md-10 content">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <b>카테고리 목록</b>
                        </div>

                        <div class="table-inbox-wrap ">
                            <table class="table table-inbox table-hover">
                                <thead class="thead-dark">
                                <tr>
                                    <th class="inbox-small-cells">
                                        <input type="checkbox" class="selectAllMembers">
                                    <th><b>카테고리 번호</b></th>
                                    <th><b>카테고리 이름</b></th>
                                    <th><b>생성 날짜</b></th>
                                </tr>
                                </thead>
                                <tbody>
                                        <%
             				PreparedStatement pstmt1=null;
             				ResultSet rs1 = null;
             				String c_id=null;
             			try{
             				String sql = "select * from category";
             				pstmt1 = conn.prepareStatement(sql);
             				rs1 = pstmt1.executeQuery();

             				while(rs1.next()){
             					c_id = rs1.getString("id");
             					%>

                                <tr>
                                    <td class="inbox-small-cells">
                                        <input type="checkbox" name="categoryId" value="<%=c_id%>" class="memberChk">
                                    </td>
                                    <td><%= c_id%></td>
                                    <td><%= rs1.getString("category")%></td>
                                    <td><%= rs1.getString("createdDate")%></td>
                                </tr>
                                <%
                                        }
                                    }catch(SQLException ex){
                                        out.println("SQLException : " + ex.getMessage());
                                    }
                                    finally {
                                        if (rs1 != null)
                                            rs1.close();
                                        if (pstmt1 != null)
                                            pstmt1.close();
                                        if (conn != null)
                                            conn.close();
                                    }

                                %>
                                </tbody>
                            </table>
                            <div style="float: right; margin-right:30px;">
                                <input type="submit" class="btn btn-info" name="btn" value="추가">
                            </div>
                            <div style="float: right; margin-right:30px;">
                                <input type="submit" class="btn btn-info" name="btn" value="삭제">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <script>
                var selectAll = document.querySelector(".selectAllMembers");
                selectAll.addEventListener('click', function () {
                    var objs = document.querySelectorAll(".memberChk");
                    for (var i = 0; i < objs.length; i++) {
                        objs[i].checked = selectAll.checked;
                    }
                    ;
                }, false);

                var objs = document.querySelectorAll(".memberChk");
                for (var i = 0; i < objs.length; i++) {
                    objs[i].addEventListener('click', function () {
                        var selectAll = document.querySelector(".selectAllMembers");
                        for (var j = 0; j < objs.length; j++) {
                            if (objs[j].checked === false) {
                                selectAll.checked = false;
                                return;
                            }
                            ;
                        }
                        ;
                        selectAll.checked = true;
                    }, false);
                }
            </script>
            <%}%>
        </div>
    </div>
</div>
<!-- footer -->
<%@include file="footer.jsp" %>

</body>
</html>



