<%--
  Created by IntelliJ IDEA.
  User: gowoo
  Date: 2020-12-02
  Time: 오후 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ include file="dbconn_web.jsp" %>
<html>
<head>
    <title>Study Cafe :: 내정보 수정</title>
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
    <script type="text/javascript">
        $(function () {
            $("#alert-success").hide();
            $("#alert-danger").hide();
            $("input").keyup(function () {
                var pwd1 = $("#passwd").val();
                var pwd2 = $("#passwdRetype").val();
                if (pwd1.length == 0) {
                    $("#alert-length").hide();
                    $("#alert-success").hide();
                    $("#alert-danger").hide();
                    $("#submitBtn").attr("disabled", "disabled");
                }
                if (pwd1 != "" || pwd2 != "") {
                    if (pwd1.length < 8 || pwd1.length > 16) {
                        $("#alert-length").show();
                        $("#alert-success").hide();
                        $("#alert-danger").hide();
                        $("#submitBtn").attr("disabled", "disabled");
                    }
                    else if (pwd1 == pwd2) {
                        $("#alert-success").show();
                        $("#alert-length").hide();
                        $("#alert-danger").hide();
                        $("#submitBtn").removeAttr("disabled");
                    } else {
                        $("#alert-length").hide();
                        $("#alert-success").hide();
                        $("#alert-danger").show();
                        $("#submitBtn").attr("disabled", "disabled");
                    }
                }
            });
        });
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
    <form class="form-inline ml-auto" action="">
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
                           href="boardList.jsp?category=<%=rs.getInt("id")%>"><%=rs.getString("category")%>
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
            <% if (request.isRequestedSessionIdValid()) {
                try {
                    String userId =  (String) session.getAttribute("sessionId");
                    String selectSql = "select name, password from user where id = ?";
                    pstmt = conn.prepareStatement(selectSql);
                    pstmt.setString(1,userId);
                    rs = pstmt.executeQuery();
                    if (rs.next()) {
            %>
            <form class="was-validated" method="post" action="updateInfo_process.jsp">
                <div class="mb-3">
                    <div class="input-group is-invalid">
                        <div class="input-group-prepend">
                            <label for="name" class="input-group-text">이름</label>
                        </div>
                        <input type="text" id="name" class="form-control is-invalid" name="name" value ="<%=rs.getString("name")%>" required>
                    </div>
                </div>
                <div class="mb-3">
                    <div class="input-group is-invalid">
                        <div class="input-group-prepend">
                            <label for="passwd" class="input-group-text">비밀번호</label>
                        </div>
                        <input type="password" id="passwd" class="form-control" value ="<%=rs.getString("password")%>" name="passwd" required>

                    </div>
                </div>

                <div class="mb-3">
                    <div class="input-group is-invalid">
                        <div class="input-group-prepend">
                            <label for="passwdRetype" class="input-group-text">비밀번호 재입력</label>
                        </div>
                        <input type="password" id="passwdRetype" class="form-control" name="passwdRetype"
                               required>
                    </div>
                </div>
                <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
                <div class="alert alert-danger" id="alert-length">비밀번호는 6~18자리만 가능합니다.</div>
                <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
                <div style="text-align: center">
                    <button type="submit" id ="submitBtn" class="btn btn-light">
                        수정
                    </button>
                    <button onclick="history.go(-1)" class="btn btn-light">
                        취소
                    </button>
                </div>
            </form>
            <%
                    }
                } catch (SQLException e) {
                    System.out.println(e);
                } finally {
                    if (rs != null)
                        rs.close();
                    if (pstmt != null)
                        pstmt.close();
                }

            }%>
        </div>
    </div>
</div>

<!-- footer -->
<%@include file="footer.jsp" %>

</body>
</html>



