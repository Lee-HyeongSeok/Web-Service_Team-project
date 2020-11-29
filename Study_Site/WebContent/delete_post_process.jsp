<%--
  Created by IntelliJ IDEA.
  User: gowoo
  Date: 2020-11-18
  Time: 오후 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!-- 게시글 삭제-->
<%@ include file="dbconn_web.jsp" %>

<%
    request.setCharacterEncoding("utf-8");

    String postId = request.getParameter("postId");

    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        String deleteSql = "delete from post where id = ?";
        pstmt = conn.prepareStatement(deleteSql);
        pstmt.setString(1, postId);
        pstmt.executeUpdate();
        response.sendRedirect("main.jsp");
    } catch (SQLException ex) {
        out.println("SQLException : " + ex.getMessage());
    } finally {
        if (rs != null) {
            rs.close();
        }
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>
