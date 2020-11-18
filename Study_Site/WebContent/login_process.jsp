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

    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String sql = "SELECT id,password FROM USER WHERE id=? and password=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    pstmt.setString(2, passwd);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        String rId = rs.getString("id");
        String rPasswd = rs.getString("password");

        if (id.equals(rId) && passwd.equals(rPasswd)) {
            session.setAttribute("sessionId",id );
            response.sendRedirect("main.jsp");
        } else
            out.println("일치하는 비밀번호가 아닙니다");
    } else
        out.println("아이디가 존재하지않습니다.");
%>


