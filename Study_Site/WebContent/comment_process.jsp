<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String today = formatter.format(new java.util.Date());

    java.sql.Timestamp dateTime = java.sql.Timestamp.valueOf(today);
%>
<%@ include file="dbconn_web.jsp" %>
<%
    request.setCharacterEncoding("utf-8");

    String postId = request.getParameter("postId"); // 댓글을 달기위해 게시판 고유 번호를 전달받음
    String userComment = request.getParameter("comment_content");

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String sql = "insert into comment( commentCol, createdDate, updatedDate, PostId, UserId) values( ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userComment); // 유저 댓글
        pstmt.setTimestamp(2, dateTime); // 댓글 단 시간
        pstmt.setTimestamp(3, dateTime); // 시스템 현재 시간 받아오는 함수 사용할 것
        pstmt.setString(4, postId);// 댓글 달 게시물 고유번호
        pstmt.setString(5, (String) session.getAttribute("sessionId")); // 해당 게시물 올린 소유자
        pstmt.executeUpdate();
        response.sendRedirect("boardView.jsp?postId="+postId);
    } catch (SQLException ex) {
        out.println("comment 테이블 삽입 실패");
        out.println("SQLException : " + ex.getMessage());
    } finally {
        if (pstmt != null)
            pstmt.close();
        if (conn != null)
            conn.close();
    }
%>