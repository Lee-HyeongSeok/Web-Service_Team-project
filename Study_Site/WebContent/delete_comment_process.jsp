<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ include file="dbconn_web.jsp" %>

<%
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        request.setCharacterEncoding("utf-8");

        String commentId = request.getParameter("id"); // 댓글 삭제를 위해 해당 댓글 id를 받아옴
        String postId = request.getParameter("postId");

        String sql = "delete from comment where id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, commentId);
        pstmt.executeUpdate();
        response.sendRedirect("boardView.jsp?postId=" + postId);
    } catch (SQLException ex) {
        out.println("댓글 삭제 실패");
        out.println("SQLException : " + ex.getMessage());
    } finally {
        if (rs != null)
            rs.close();
        if (pstmt != null)
            pstmt.close();
    }
%>
