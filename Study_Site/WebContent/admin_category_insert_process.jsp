<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbconn_web.jsp" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.sql.*" %>

<%
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String today = formatter.format(new java.util.Date());

    java.sql.Timestamp dateTime = java.sql.Timestamp.valueOf(today);
%>
<%
    request.setCharacterEncoding("UTF-8");
    PreparedStatement pstmt1 = null;

    String category_title = request.getParameter("title");

    try{
        // 제목, 만든 시간, 업데이트 시간
        String sql = "insert into category(category, createdDate, updatedDate) values(?, ?, ?)";
        pstmt1 = conn.prepareStatement(sql);
        pstmt1.setString(1, category_title);
        pstmt1.setTimestamp(2, dateTime);
        pstmt1.setTimestamp(3, dateTime);
        pstmt1.executeUpdate();
        response.sendRedirect("admin_category.jsp");
    }catch (SQLException ex) {
        out.println("category 테이블 삽입이 실패했습니다.<br>");
        out.println("SQLException: " + ex.getMessage());
    } finally {
        if (pstmt1 != null)
            pstmt1.close();
        if (conn != null)
            conn.close();
    }
%>