<%@ page import="java.util.*, java.text.*"  %>


<%

java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String today = formatter.format(systime());

java.sql.Timestamp t = java.sql.Timestamp.valueOf(today);
%>