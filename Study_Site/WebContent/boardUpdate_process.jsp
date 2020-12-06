<%--
  Created by IntelliJ IDEA.
  User: gowoo
  Date: 2020-11-16
  Time: 오후 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="dbconn_web.jsp" %>
<html>
<head>
    <title>comment processing</title>
</head>
<%
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String today = formatter.format(new java.util.Date());

    java.sql.Timestamp dateTime = java.sql.Timestamp.valueOf(today);
%>
<body>
<!-- 댓글 업로드 기능-->
<!-- 댓글 달 게시물 선택하면 해당 게시물을 쓴 사용자의 아이디를 저장.. -->
<!-- 게시물 댓글, 아이디, 게시물 소유자 아이디, 만든시간, 업데이트 시간을  comment 테이블에 삽입 -->
<!-- 테이블 애트리 순서는 만든시간, 업데이트 시간, 댓글 달 게시물 아이디 , 해당 게시물 사용자 아이디, 댓글-->
<!-- Date, Date, int, int, string -->
<%
    request.setCharacterEncoding("UTF-8");

    String userId = (String) session.getAttribute("sessionId");
    String postId = request.getParameter("postId");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String categoryId = request.getParameter("categoryId");

    PreparedStatement pstmt = null;
    System.out.println(userId+title+categoryId);
    try {
        String insertSql = "UPDATE post SET title =?,content =?,updatedDate =?,UserId=?,CategoryId=? where id = ?";
        pstmt = conn.prepareStatement(insertSql);
        pstmt.setString(1, title);
        pstmt.setString(2, content);
        pstmt.setTimestamp(3, dateTime);
        pstmt.setString(4, userId);
        pstmt.setString(5, categoryId);
        pstmt.setString(6, postId);
        pstmt.executeUpdate();

        response.sendRedirect("main.jsp");

    } catch (SQLException ex) {
        out.println("post 테이블 삽입 실패");
        out.println("SQLException : " + ex.getMessage());
    } finally {
        if (pstmt != null)
            pstmt.close();
        if (conn != null)
            conn.close();
    }
%>
</body>
</html>