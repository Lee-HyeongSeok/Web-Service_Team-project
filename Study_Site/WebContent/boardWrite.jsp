<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="dbconn_web.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Study Cafe :: 게시글 작성</title>
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
        function goBackButton(){
            if(confirm("뒤로 가시면 현재 작성한 내용은 지워집니다.\n정말 뒤로 가시겠습니까?")){
                history.go(-1);
            }
        }
    </script>
</head>
<body>
<!-- header -->
<div class="jumbotron text-center mb-0" style="background:#08060b; padding : 0;border-radius: 0">
    <a href="main.jsp"><img alt="special study cafe"  src="image/scs.jpg" style="height:100%" ></a>
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
            <% if ( request.isRequestedSessionIdValid()) {%>
            <table>
                <tr>
                    <td>
                <span style="font-size:1.0em;  color: black; margin:4px">
    	            <%=session.getAttribute("sessionName")%>님<br> 환영합니다.
	            </span>
                    </td>
                </tr>
            </table>
            <hr>
            <%@include file="Logout_sidebar.jsp" %>
            <% } else {%>
            <%@include file="Login_sidebar.jsp" %>
            <%}%>
            <hr>
            <!-- side menu (link) -->
            <%@include file="sidebar.jsp" %>
        </div>
        <!-- right content -->
        <div class="col-sm-8">
            <form class="was-validated" name="BoardWriteForm" method="post" action="boardWrite_process.jsp">
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
                                String writeSql;
                                try{
                                if(  session.getAttribute("sessionId").equals("1"))
                                    writeSql = "select id,category from category";
                                else
                                    writeSql = "select id,category from category where not id=1";
                                pstmt = conn.prepareStatement(writeSql);
                                rs = pstmt.executeQuery();
                                while (rs.next()) { %>
                            <option value="<%=rs.getInt("id")%>"><%=rs.getString("category")%>
                            </option>
                            <%
                                }
                                }catch (Exception e){%>
                                    <script>
                                        alert("로그인 후 이용해주세요.");
                                        document.location.href = "main.jsp";
                                    </script>

                                <%} finally {
                                if (rs != null)
                                    rs.close();
                                if (pstmt != null)
                                    pstmt.close();

                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="content">내용</label>
                    <textarea class="form-control" id="content" placeholder="내용을 입력해주세요." name="content"
                              style="height: 300px"></textarea>
                </div>
                <div style="text-align: center">
                    <button type="submit" class="btn btn-outline-info">작성 완료</button>
                    <button onclick="goBackButton();" class="btn btn-outline-info">뒤로 가기</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- footer -->
<%@include file="footer.jsp" %>

</body>
</html>