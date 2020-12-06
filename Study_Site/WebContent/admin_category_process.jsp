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
    <script>
        function goBackButton(){
            if(confirm("뒤로 가시면 현재 작성한 내용은 지워집니다.\n정말 뒤로 가시겠습니까?")){
                document.location="admin_category.jsp";
            }
            $('#content').val().replace(/\n/g, "<br>")
        }
    </script>
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

            <%
                // 삭제 버튼인지 추가 버튼인지 구별
                String str = request.getParameter("btn");

                if (str.equals("추가")) {
            %>
            <form action="admin_category_insert_process.jsp" method="post">
                <!--  <form class ="was-validated" name="categoryProcess" method="post" action="category_add_process.jsp" > -->
                <div class="input-group is-invalid">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="title">카테고리 이름</label>
                        <input type="text" style="width:400px" class="form-control is-invalid" id="title" name="title" required>
                    </div>
                </div>

                <div style="text-align: center">
                    <button type="submit"  class="btn btn-info">저장</button>
                </div>
                <!--  </form>-->
            </form>
            <%
                    } else if (str.equals("삭제")) {
                        String categoryId = request.getParameter("categoryId");

                        PreparedStatement pstmt1 = null;

                        try {
                            String sql = "delete from category where id = ?";
                            pstmt1 = conn.prepareStatement(sql);
                            pstmt1.setString(1, categoryId);
                            pstmt1.executeUpdate();
                            response.sendRedirect("admin_category.jsp");
                        } catch (SQLException ex) {
                            out.println("SQLException: " + ex.getMessage());
                        } finally {
                            if (pstmt1 != null)
                                pstmt1.close();
                            if (conn != null)
                                conn.close();
                        }
                    }
                }%>
        </div>
    </div>
</div>
<!-- footer -->
<%@include file="footer.jsp" %>

</body>
</html>



