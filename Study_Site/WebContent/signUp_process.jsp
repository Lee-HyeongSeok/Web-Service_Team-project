<%--
  Created by IntelliJ IDEA.
  User: gowoo
  Date: 2020-11-18
  Time: 오후 8:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.sql.*" %>



<html>
<head>
    <title>회원가입</title>
</head>

<%
    java.util.Date utilDate = new java.util.Date();
    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
%>
<body>

<!-- 아이디, 이메일, 이름, 비밀번호, 만든시간, 업데이트 시간, 주키는 아이디 -->
<%@ include file = "dbconn_web.jsp" %>
<%
    request.setCharacterEncoding("utf-8");

    int id = Integer.parseInt(request.getParameter("id"));
    String email = request.getParameter("email");
    String name = request.getParameter("name");
    String passwd = request.getParameter("passwd");

    PreparedStatement pstmt = null;

    try{
        String sql = "insert into user(id, email, name, password, createdDate, updatedDate) values(?,?,?,?,?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, id);
        pstmt.setString(2, email);
        pstmt.setString(3, name);
        pstmt.setString(4, passwd);
        pstmt.setDate(5, sqlDate);
        pstmt.setDate(6, sqlDate);
        pstmt.executeUpdate();
        out.println("user table 삽입 성공");
    }
    catch(SQLException ex){
        out.println("user 테이블 삽입 실패");
        out.println("SQL Exception : " + ex.getMessage());
    }
    finally{
        if(pstmt != null)
            pstmt.close();
        if(conn != null)
            conn.close();
    }
%>
</body>
</html>
