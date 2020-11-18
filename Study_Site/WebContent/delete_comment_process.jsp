<%--
  Created by IntelliJ IDEA.
  User: gowoo
  Date: 2020-11-16
  Time: 오후 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn_web.jsp"%>
<%
    String userId = request.getParameter("userId");
    String postId = request.getParameter("PostId");
    String commentId = request.getParameter("commentId");
    String date=null;

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String sql = "select * from comment UserId = ? and  PostId= ?  desc id";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    for(int i=0; i < Integer.parseInt(commentId); i++){
        rs.next();
        date = rs.getString("createdDate");
    }
    rs.beforeFirst();
    if (rs.next()) {
        sql = "delete from comment where UserId =? and PostId = ? and createdDate =?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        pstmt.setString(2, postId);
        pstmt.setString(3, date);
        pstmt.executeUpdate();
    } else
        out.println("댓글이 존재하지않습니다.");

    if (rs != null)
        rs.close();
    if (pstmt != null)
        pstmt.close();
    if (conn != null)
        conn.close();

    response.sendRedirect("main.jsp");
%>
