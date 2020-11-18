<%@ page import="java.sql.*"%>
<%
    Connection conn = null;

    String url = "jdbc:mysql://localhost:3306/study_cafe?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
    //String url = "jdbc:mysql://localhost:3306/study_cafe";
    String user = "root";
    String password = "your DB password";

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);
%>
