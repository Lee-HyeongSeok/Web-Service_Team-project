<%--
  Created by IntelliJ IDEA.
  User: gowoo
  Date: 2020-12-02
  Time: 오후 8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="dbconn_web.jsp" %>
<%
    request.setCharacterEncoding("utf-8");

    String[] userId = request.getParameterValues("userId");
    String deleteSql = "delete from user where id in ( ";

    for(int i=0; i < userId.length; i++){
        deleteSql = deleteSql + userId[i] ;
        if( i != userId.length-1) {
            deleteSql += ",";
        }
    }
    deleteSql+=");";

    Statement stmt = null;
    ResultSet rs = null;

    try {
        stmt = conn.createStatement();
        stmt.executeUpdate(deleteSql);
        response.sendRedirect("admin_user.jsp");
    } catch (Exception ex) {
        response.sendRedirect("admin_user.jsp");
    } finally {
        if (rs != null)
            rs.close();
        if (stmt != null)
            stmt.close();
        if (conn != null)
            conn.close();
    }
%>
