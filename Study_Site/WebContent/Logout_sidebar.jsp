<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="form-group row">
	<div class="col-sm-offset-2 col-sm-10">
		<div>
			<input type="button" style="width: 190pt;margin-bottom: 15px; height:30pt" class="btn btn-primary" id="logoutBtn" onClick="window.location.href = 'logout.jsp'" value="로그아웃">
		</div>

		<div>
			<input type="button" style="width: 190pt;margin-bottom: 15px; height:30pt" class="btn btn-primary" id="myInfoBtn" onClick="window.location.href = 'info.jsp'" value="내 정보보기">
		</div>
		<div>
			<input type="button" style="width: 190pt;margin-bottom: 15px; height:30pt" class="btn btn-primary " id="writeBtn" onClick="window.location.href = 'Board/wirte.jsp'" value="글쓰기">
		</div>
	</div>
</div>