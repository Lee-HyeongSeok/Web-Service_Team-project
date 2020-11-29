<%--
  Created by IntelliJ IDEA.
  User: gowoo
  Date: 2020-11-18
  Time: 오후 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/study_cafe?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&characterEncoding=UTF-8&serverTimezone=Asia/Seoul&useSSL=false";
    String user = "root";
    String password = "akfrdmsthfl97";
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);
%>