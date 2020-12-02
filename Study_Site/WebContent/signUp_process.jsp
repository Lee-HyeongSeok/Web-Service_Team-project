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

    String email = request.getParameter("email");
    String name = request.getParameter("name");
    String passwd = request.getParameter("passwd");

    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        String selectSql = "select email from user where email = ?";
        pstmt = conn.prepareStatement(selectSql);
        pstmt.setString(1,email);
        rs= pstmt.executeQuery();
        if(!rs.next()){
            String sql = "insert into user(email, name, password, createdDate, updatedDate) values(?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, name);
            pstmt.setString(3, passwd);
            pstmt.setTimestamp(4, dateTime);
            pstmt.setTimestamp(5, dateTime);
            pstmt.executeUpdate();
            response.sendRedirect("login.jsp");
        }
        else{
            throw new SQLException("이미 존재하는 email입니다.");
        }
    } catch (SQLException ex) {%>
        <script>
            alert("이미 존재하는 email입니다.");
            document.location.href="signUp.jsp";
        </script>

    <%
    } finally {
        if (pstmt != null)
            pstmt.close();
        if (conn != null)
            conn.close();
    }%>