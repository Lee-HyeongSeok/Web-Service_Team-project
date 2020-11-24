<%--
  Created by IntelliJ IDEA.
  User: gowoo
  Date: 2020-11-24
  Time: 오후 6:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
    response.sendRedirect("main.jsp");
%>
