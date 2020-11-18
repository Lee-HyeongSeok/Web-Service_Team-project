<%--
  Created by IntelliJ IDEA.
  User: gowoo
  Date: 2020-11-16
  Time: 오후 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
    request.setCharacterEncoding("UTF-8");

    Integer id = null;
    String userId = request.getParameter("userId");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    Date currentDatetime = new Date(System.currentTimeMillis());
    java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
%>

<sql:setDataSource var="dataSource"
                   url="jdbc:mysql://localhost:3306/webmarketdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false"
                   driver="com.mysql.jdbc.Driver" user="root" password="akfrdmsthfl97" />

<sql:update dataSource="${dataSource}" var="resultSet">
    INSERT INTO member VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    <sql:param value="<%=id%>" />
    <sql:param value="<%=title%>" />
    <sql:param value="<%=content%>" />
    <sql:param value="<%=sqlDate%>" />
    <sql:param value="<%=sqlDate%>" />
    <sql:param value="<%=userId%>" />
</sql:update>

<c:if test="${resultSet>=1}">
    <c:redirect url="catogory.jsp?" />
</c:if>
