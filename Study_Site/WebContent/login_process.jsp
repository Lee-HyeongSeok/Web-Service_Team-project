<%--
  Created by IntelliJ IDEA.
  User: gowoo
  Date: 2020-11-16
  Time: 오후 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
    request.setCharacterEncoding("UTF-8");

    String email = request.getParameter("email");
    String password = request.getParameter("password");
%>

<sql:setDataSource var="dataSource"
                   url="jdbc:mysql://localhost:3306/webmarketdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false"
                   driver="com.mysql.jdbc.Driver" user="root" password="akfrdmsthfl97" />

<sql:query dataSource="${dataSource}" var="resultSet">
    SELECT id,email,password,name FROM USER WHERE email=? and password=?
    <sql:param value="<%=email%>" />
    <sql:param value="<%=password%>" />
</sql:query>

<c:forEach var="row" items="${resultSet.rows}">
    <%
        session.setAttribute("sessionId",email );
    %>
    <c:redirect url="main.jsp" />
</c:forEach>

<c:redirect url="login.jsp?error=1" />