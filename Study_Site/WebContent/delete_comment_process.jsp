<%--
  Created by IntelliJ IDEA.
  User: gowoo
  Date: 2020-11-16
  Time: 오후 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn_web.jsp" %>
<%
    request.setCharacterEncoding("utf-8");

    String commentId = request.getParameter("commentId");

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String selectSql = "delete from comment where id = ?";
        pstmt = conn.prepareStatement(selectSql);
        pstmt.setString(1, commentId);
        pstmt.executeUpdate();

        response.sendRedirect("main.jsp");
    } catch (SQLException ex) {
        out.println("comment 테이블 삭제 실패");
        out.println("SQLException : " + ex.getMessage());
    } finally {
        if (rs != null)
            rs.close();
        if (pstmt != null)
            pstmt.close();
        if (conn != null)
            conn.close();
    }
%>
