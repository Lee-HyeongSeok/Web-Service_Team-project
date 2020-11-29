<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<h3>게시판</h3>
<%@ include file="dbconn_web.jsp" %>
<%
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String sql = "select * from category";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();%>
<ul class="list-group">
    <%
        while (rs.next()) {
    %>
    <li class="list-group-item list-group-item-action"><a href="boardList.jsp?category=<%=rs.getString("id")%>">
        <%= rs.getString("category") %>
    </a></li>
    <%
        }
        if (rs != null)
            rs.close();
        if (pstmt != null)
            pstmt.close();
    %>
</ul>