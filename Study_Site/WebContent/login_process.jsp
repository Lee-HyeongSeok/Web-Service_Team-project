<%--
  Created by IntelliJ IDEA.
  User: gowoo
  Date: 2020-11-16
  Time: 오후 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn_web.jsp"%>

<%
    request.setCharacterEncoding("UTF-8");

    String email = request.getParameter("email");
    String passwd = request.getParameter("passwd");

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String sql = "SELECT email,password FROM USER WHERE email=? and password=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, email);
    pstmt.setString(2, passwd);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        String rId = rs.getString("email");
        String rPasswd = rs.getString("password");

        if (email.equals(rId) && passwd.equals(rPasswd)) {
            session.setAttribute("sessionId",email );
            response.sendRedirect("main.jsp");
        } else
            out.println("일치하는 비밀번호가 아닙니다.");
    } else
        out.println("로그인에 실패하셨습니다.");

    if(rs != null){
        out.println("rs close 발생");
        rs.close();
    }
    if(pstmt != null){
        out.println("2번째 pstmt close 발생");
        pstmt.close();
    }
    if(conn != null){
        out.println("conn close 발생");
        conn.close();
    }
%>


