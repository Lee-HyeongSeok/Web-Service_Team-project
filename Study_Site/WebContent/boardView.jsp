<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ include file="dbconn_web.jsp" %>

<!-- 나중에 boardView에 복붙하기 -->
<!DOCTYPE html>
<html>
<head>
    <title>Study Cafe :: 게시글</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSS -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link href="image/post.css">
    <!-- JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="js/board.js"></script>
    <link rel="stylesheet" href="css/main.css">
    <link rel="icon" href="image/favicon.png">
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

            <% if (request.isRequestedSessionIdValid()) {%>
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
            <!-- 게시글 수정, 삭제 -->
            <%
                request.setCharacterEncoding("UTF-8");
                Integer postId = Integer.parseInt(request.getParameter("postId"));
                String name = null;
                Date createdDate = null;
                String title = null;
                String content = null;
                try {
                    String selectSql = "SELECT * FROM post where id = ?";
                    pstmt = conn.prepareStatement(selectSql);
                    pstmt.setInt(1, postId); // postId가 post 테이블의 Id
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
                        name = rs.getString("UserId");
                        createdDate = rs.getDate("createdDate");
                        title = rs.getString("title");
                        content = rs.getString("content");
                    }
                } catch (SQLException ex) {
                    out.println("해당 게시글 불러오기 실패");
                    out.println("SQLException : " + ex.getMessage());
                } finally {
                    if (pstmt != null)
                        pstmt.close();
                    if (conn != null)
                        conn.close();
                }
                if (name.equals((String) session.getAttribute("sessionId"))) {%>

            <%}%>


            <div class="ContentBox" style="padding: 29px 29px 0;border : solid 1px #ebecef; border-radius: 6px;">
                <div class="content_header">
                    <div class="content_title">
                        <h1 class="display-3">제목</h1>
                        <small class="text-muted" style="font-weight: bold;font-size:1.2em">작성자</small>
                        <br>
                        <small class="text-muted">작성 날짜</small>
                    </div>
                </div>
                <hr>
                <div class="content_body">
                    <div class="content" style="margin:30px 0">
                        <p>
                            <span>언어에 따라 명사의 앞 뒤에 놓여지는 말이다. 이어지는 명사의 배경(수, 성 격 등)에 따라 변화 할 수도 있다. 지시사 등과 함께 한정하는 품사를 구성할 수도 있다
                                (영어 등).</span>
                            <span>
                            한편, 지시사와 관사는 별도의 위치를 차지할 수 있다. 예를 들어, 카나 어에서 관사는 명사의 앞에, 지시사는 명사 뒤에 놓이고 동시에 사용할 수
                            있다.</span>
                            <span>종종 접어이며, 또한 바로 뒤에 오는 단어의 발음에 따라 변화할 수있다. 예를 들어, 다음 단어의 어두가 모음일 때 다음이 자음일 때 비해 모음을 생략하고 자음을
                                보충하는 일이 자주 발생한다.</span>
                            <span>영어 관사는 다음이 자음일 때 생략된 발음을 한다.(an에서 n이 생략되어 발음)일부 언어에서는 전치사와 인접할 때 전치사와 결합하여 축약형이 될 수도 있다.</span>
                            <span>프랑스어에서는 축약형을 가진 조합 시에는 반드시 축약형을 사용한다. (예 : de +le → du )
                                <span>이러한 현상을 독일어에서는 의미의 차이로 구분한다. (예 : 보통 von + dem → vom 하지만 지시사인 경우 von dem처럼 한다) 이처럼 언어에 따라 형태가 달라진다.</span>
                            <span></span>또한, 로망스어군의 원류인 라틴어에는 관사가 없으며, 러시아어와 많은슬라브어, 그리고 페르시아어처럼 인도유럽어족에 속하는 언어도 관사가 없는 것도있다.</span>
                        </p>
                    </div>
                </div>
                <hr>
                <div class="content_bottom ">
                    <div class="content_tool" style="text-align: right;margin-bottom: 29px">
                        <button class="btn btn-info" style="margin : 5px 0"
                                onclick="updatePostEventListener(<%=postId%>);">수정
                        </button>
                        <button class="btn btn-info" style="margin : 5px 0"
                                onclick="removePostEventListener(<%=postId%>);">삭제
                        </button>
                    </div>
                </div>
            </div>
            <hr style="border: solid 1px #e9e9e9;">
            <div class="comment-form" style="padding: 10px;border : solid 1px #ebecef; border-radius: 6px;">
                <form method="post" action="comment_process.jsp"
                      style="margin:5px;padding: 5px; border : solid 2px #ebecef; border-radius: 6px;">
                    <div align="right">
                        <textarea class="form-control" style="border : none" name="comment_content"
                                  placeholder="댓글을 입력하세요" rows="1"
                                  cols="70"></textarea>
                    </div>
                    <br>
                    <div align="right">
                        <input class="btn btn-link" style="width:50px;font-size:12px " type="submit" value="등록">
                    </div>
                </form>

                <div class="comment-area" style="margin : 15px 0 0">
                    <ul style="margin :0">
                        <li class="comment-list"
                            style="border-bottom:solid 1px #ebecef;display: list-item; list-style: none;">
                            <div class="comment-box">
                                <div class="comment-writer">
                                    <span style="font-size:15px; font-weight: bold">작성자 이름</span>
                                </div>
                                <div class="comment-content-box">
                                    <p class="comment-content">
                                        <span style="font-size:14px;">내용</span>
                                    </p>
                                </div>
                                <div class="comment-info">
                                    <small class="text-muted">작성 날짜</small>
                                </div>
                                <div class="comment-tool" style="display: block; text-align: right;">
                                    <button class="btn btn-link" style="margin : 0 5px;font-size:12px"
                                            onclick="updatePostEventListener(<%=postId%>);">수정
                                    </button>
                                    <button class="btn btn-link" style="margin : 0 5px;font-size:12px"
                                            onclick="removePostEventListener(<%=postId%>);">삭제
                                    </button>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>
