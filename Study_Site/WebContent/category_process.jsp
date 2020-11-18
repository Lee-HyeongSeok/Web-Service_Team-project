<%--
  Created by IntelliJ IDEA.
  User: gowoo
  Date: 2020-11-16
  Time: 오후 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>상품 목록</title>
</head>
<body>
<div >
    <div>
        <%@ include file="dbconn_web.jsp" %>
        <%
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            String sql = "select * from category";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
        %>
        <div>
            <a href="./post?category=<%=rs.getString("category")%>" ><%= rs.getString("category") %></a>
        </div>
        <%
            }
            if (rs != null)
                rs.close();
            if (pstmt != null)
                pstmt.close();
            if (conn != null)
                conn.close();
        %>
    </div>
    <hr>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
