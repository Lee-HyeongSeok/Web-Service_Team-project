<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<div class="form-group row">
    <div class="col-sm-offset-2 col-sm-10">
        <div>
            <input type="button" style="height:30pt" class="btn btn-outline-light"
                   id="logoutBtn" onClick="window.location.href = 'logout.jsp'" value="로그아웃">
        </div>

        <div>
            <input type="button" style="height:30pt" class="btn btn-outline-light"
                   id="myInfoBtn" onClick="window.location.href = 'updateInfo.jsp'" value="내 정보 수정">
        </div>
        <%try{
            if( session!=null && request.isRequestedSessionIdValid()&&session.getAttribute("sessionId").equals("1")){%>
        <div>
            <input type="button" style="width: 124%;margin: 4px;background-color: rgba(0, 0, 0, 0);color: skyblue;border: 2px solid skyblue;height:30pt" class="btn btn-outline-light"
                    onClick="window.location.href = 'admin.jsp'" value="회원 관리">
        </div>
        <%}
        }catch (NullPointerException e){
            session.invalidate();
        %>
          <script>
            alert("접근 권한이 없습니다.");

            window.location.href="main.jsp";
          </script>
        <%}%>

        <div>
            <input type="button" style="height:30pt" class="btn btn-outline-light"
                   id="writeBtn" onClick="window.location.href = 'boardWrite.jsp'" value="글쓰기">
        </div>
    </div>
</div>
