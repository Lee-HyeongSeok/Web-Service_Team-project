<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Vector" %>
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
                String postId = request.getParameter("postId");

                String postUserId = null;
                String title = null;
                String content = null;
                String postName = null;
                Date postDate = null;
                Vector<String> commentUserId = new Vector<String>();
                Vector<String> commentName = new Vector<String>();
                Vector<String> commentId = new Vector<String>(); //댓글 id
                Vector<String> commentCol = new Vector<String>();
                Vector<Date> commentDate = new Vector<Date>();

                try {
                    // 뽑아야 할 것 : 게시글 사용자 이름(user), 게시글 제목(post), 게시글 내용(post), 게시글 만든 날짜(post), 댓글 내용(comment), 댓글 시간(comment)
                    //sql = "select * from post where id = ?";
                    String selectSql = "select post.title,post.content,post.updatedDate as postDate, post.UserId, user.name from post left join user on user.id = post.UserId where post.id = ?";
                    pstmt = conn.prepareStatement(selectSql);
                    pstmt.setString(1, postId); // postId가 post 테이블의 Id
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
                        postUserId = rs.getString("UserId"); //소유자 id
                        title = rs.getString("title"); // 게시글 제목
                        content = rs.getString("content"); // 게시글 내용
                        postDate = rs.getDate("postDate"); // 게시글 만든 시간
                        postName = rs.getString("name"); // 댓글 소유자 이름
                    }
                    selectSql = "select comment.id, comment.commentCol, comment.updatedDate,comment.UserId, user.name from comment left join user on user.id = comment.UserId where PostId = ?";
                    pstmt = conn.prepareStatement(selectSql);
                    pstmt.setString(1, postId); // postId가 post 테이블의 Id
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        commentUserId.add(rs.getString("UserId"));
                        commentName.add(rs.getString("name"));
                        commentId.add(rs.getString("id")); //댓글 id
                        commentCol.add(rs.getString("commentCol")); //댓글 id
                        commentDate.add(rs.getDate("updatedDate"));
                    }
                } catch (SQLException ex) {
                    out.println("해당 게시글 불러오기 실패1");
                    out.println("SQLException : " + ex.getMessage());
                } finally {
                    if (pstmt != null)
                        pstmt.close();
                    if (conn != null)
                        conn.close();
                }%>
            <div class="ContentBox"
                 style="padding: 29px 29px 0;border : solid 1px #ebecef; border-radius: 6px;">
                <div class="content_header">
                    <div class="content_title">
                        <h1 class="display-3"><%=title%></h1>
                        <small class="text-muted" style="font-weight: bold;font-size:1.2em"><%=postName%></small>
                        <br>
                        <small class="text-muted"><%=postDate%></small>
                    </div>
                </div>
                <hr>
                <div class="content_body">
                    <div class="content" style="margin:30px 0">
                        <pre> <%=content%>
                        </pre>
                    </div>
                </div>
                <hr>
                <div class="content_bottom ">
                    <% if (request.isRequestedSessionIdValid() && session.getAttribute("sessionId").equals(postUserId)) {%>
                    <div class="content_tool" style="text-align: right;margin-bottom: 29px">
                        <button class="btn btn-info" style="margin : 5px 0"
                                onclick="updatePostEventListener(<%=postId%>);">수정
                        </button>
                        <button class="btn btn-info" style="margin : 5px 0"
                                onclick="removePostEventListener(<%=postId%>);">삭제
                        </button>
                    </div>
                    <%}%>
                </div>
            </div>
            <hr style="border: solid 1px #e9e9e9;">
            <div class="comment-form" style="padding: 10px;border : solid 1px #ebecef; border-radius: 6px;">
                <form method="post" action="comment_process.jsp"
                      style="margin:5px;padding: 5px; border : solid 2px #ebecef; border-radius: 6px;">
                    <div align="right">
                        <textarea class="form-control" style="border : none" name="comment_content" id="comment_content"
                                  placeholder="댓글을 입력하세요" rows="1"
                                  cols="70"></textarea>
                    </div>
                    <br>
                    <input id="postId" name="postId" value="<%=postId%>" hidden >
                    <div align="right">
                        <input class="btn btn-link" style="width:50px;font-size:12px " type="submit" value="등록">
                    </div>
                </form>

                <div class="comment-area" style="margin : 15px 0 0">
                    <ul style="margin :0">
                        <%for(int i=0; i<commentId.size(); i++){%>
                        <li class="comment-list"
                            style="border-bottom:solid 1px #ebecef;display: list-item; list-style: none;">
                            <div class="comment-box">
                                <div class="comment-writer">
                                    <span style="font-size:15px; font-weight: bold"><%=commentName.get(i)%></span>
                                </div>
                                <div class="comment-content-box">
                                    <p class="comment-content">
                                        <span style="font-size:14px;"><%=commentCol.get(i)%></span>
                                    </p>
                                </div>
                                <div class="comment-info">
                                    <small class="text-muted"><%=commentDate.get(i)%></small>
                                </div>
                                <%if(session.getAttribute("sessionId").equals(commentUserId.get(i))){%>
                                <div class="comment-tool" style="display: block; text-align: right;">
                                    <button id="delete_button" class="btn btn-link" style="margin : 0 5px;font-size:12px"
                                            onclick="window.location.href = 'delete_comment_process.jsp?id=<%=commentId.get(i)%>&postId=<%=postId%>'">삭제
                                    </button>
                                </div>
                                <%}%>
                            </div>
                        </li>
                        <%}%>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>
