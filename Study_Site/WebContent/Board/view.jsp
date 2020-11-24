<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
	<form name="BoardViewForm" method="post">
	<table summary="전체 테이블 구성">
	<tr>
		<td ><div align="center"><h3><b>게시글 읽기</b></h3></div></td>
	</tr>
	<tr>
		<td colspan=2>
		<table border="1" summary="목록 테이블 구성"> 
    <tr> 
		<td align=center bgcolor=white width=10%> 작성자</td>
		<td bgcolor=#ffffe8 width=40%>지후니</td>
	</tr>
	<tr>
		<td align=center bgcolor=white width=10%> 작성일</td>
		<td bgcolor=#ffffe8 width=40%>2015/11/23</td>	
	</tr>
    
	<tr> 
		<td align=center bgcolor=white> 제 목</td>
		<td bgcolor=#ffffe8 colspan=3> 게시판 글입니다</td>
   </tr>
   <tr> 
		<td colspan=4><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor 
		incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation 
		ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in 
		voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
		sunt in culpa qui officia deserunt mollit anim id est laborum.<br></td>
   </tr>
   <tr>
		<td colspan=4 align="right"> 조회수  : 4 </td>
   </tr>
	</table>
	</td>
 	</tr>
	<tr>
		<td align=center colspan=2> 
		<hr size=1>
		<div align="center">
		 <input type="button" value="목록" onclick="">
		<input type="button" value="수정" onclick="">
		<input type="button" value="답변" onclick="">
		<input type="button" value="삭제" onclick="">
		</div>
		</td>
	</tr>
	</table>
</form>
            
 