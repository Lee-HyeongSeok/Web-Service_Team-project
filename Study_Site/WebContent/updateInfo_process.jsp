<%--
  Created by IntelliJ IDEA.
  User: gowoo
  Date: 2020-11-18
  Time: 오후 8:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>



<%
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String today = formatter.format(new java.util.Date());

    java.sql.Timestamp dateTime = java.sql.Timestamp.valueOf(today);
%>


<!-- 아이디, 이메일, 이름, 비밀번호, 만든시간, 업데이트 시간, 주키는 아이디 -->
<%@ include file="dbconn_web.jsp" %>
<%
    request.setCharacterEncoding("utf-8");

    String id = (String)session.getAttribute("sessionId");
    String name = request.getParameter("name");
    String passwd = request.getParameter("passwd");

    PreparedStatement pstmt = null;

    try {
        String sql = "update user set name = ?, password = ?, updatedDate=? where id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, passwd);
        pstmt.setTimestamp(3, dateTime);
        pstmt.setString(4, id);
        pstmt.executeUpdate();
        session.setAttribute("sessionName",name);
        response.sendRedirect("main.jsp");

    } catch (SQLException ex) {
        out.println("user 테이블 삽입 실패");
        out.println("SQL Exception : " + ex.getMessage());
    } finally {
        if (pstmt != null)
            pstmt.close();
        if (conn != null)
            conn.close();
    }
%>
