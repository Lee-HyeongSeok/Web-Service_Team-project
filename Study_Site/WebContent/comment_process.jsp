<%--
  Created by IntelliJ IDEA.
  User: gowoo
  Date: 2020-11-18
  Time: 오후 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="dbconn_web.jsp" %>
<html>
<head>
    <title>comment processing</title>
</head>
<%
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String today = formatter.format(new java.util.Date());

    java.sql.Timestamp t = java.sql.Timestamp.valueOf(today);

%>
<body>
<!-- 댓글 업로드 기능-->
<!-- 댓글 달 게시물 선택하면 해당 게시물을 쓴 사용자의 아이디를 저장.. -->
<!-- 게시물 댓글, 아이디, 게시물 소유자 아이디, 만든시간, 업데이트 시간을  comment 테이블에 삽입 -->
<!-- 테이블 애트리 순서는 만든시간, 업데이트 시간, 댓글 달 게시물 아이디 , 해당 게시물 사용자 아이디, 댓글-->
<!-- Date, Date, int, int, string -->
<%
    request.setCharacterEncoding("utf-8");

    String userPick = request.getParameter("post_id");
    String userComment = request.getParameter("comment");

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try{
        String sql = "select id, user_id from post where id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userPick);
        rs = pstmt.executeQuery();

        if(rs.next()){
            String rId = rs.getString("id");
            String rUserId = rs.getString("user_id");

            if(userPick.equals(rId)){
                sql = "insert into comment(createdDate, updatedDate, post_id, post_user_id, commentcol) values(?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setTimestamp(1, t);
                pstmt.setTimestamp(2, t);
                pstmt.setString(3, userPick);
                pstmt.setString(4, rUserId);
                pstmt.setString(5, userComment);
                pstmt.executeUpdate();
                out.println("comment 테이블 삽입 성공");
            }
            else{
                out.println("일치하는 소유자가 없습니다.");
            }
        }
    }catch(SQLException ex){
        out.println("comment 테이블 삽입 실패");
        out.println("SQLException : " + ex.getMessage());
    }finally{
        if(pstmt != null)
            pstmt.close();
        if(conn != null)
            conn.close();
    }
%>
</body>
</html>