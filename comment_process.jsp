<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.sql.*" %>
<html>
<head>
    <title>comment processing</title>
</head>
<%
	java.util.Date utilDate = new java.util.Date();
	java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
%>
<body>
<!-- 댓글 업로드 기능-->
<!-- 댓글 달 게시물 선택하면 해당 게시물을 쓴 사용자의 아이디를 저장.. -->
<!-- 게시물 댓글, 아이디, 게시물 소유자 아이디, 만든시간, 업데이트 시간을  comment 테이블에 삽입 -->
<!-- 테이블 애트리 순서는 만든시간, 업데이트 시간, 댓글 달 게시물 아이디 , 해당 게시물 사용자 아이디, 댓글-->
<!-- Date, Date, int, int, string -->
	<%@ include file="dbconn_web.jsp" %>
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
					pstmt.setDate(1, sqlDate);
					pstmt.setDate(2, sqlDate); // 시스템 현재 시간 받아오는 함수 사용할 것 
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
