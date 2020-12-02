<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<h3>게시판</h3>
<%
    String sideBarSql = "select * from category";
    pstmt = conn.prepareStatement(sideBarSql);
    rs = pstmt.executeQuery();%>
<ul class="list-group">
    <%
        while (rs.next()) {
    %>
    <li class="list-group-item list-group-item-action"><a href="boardList.jsp?categoryId=<%=rs.getString("id")%>">
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