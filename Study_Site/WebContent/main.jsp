<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Study Cafe :: Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="css/login.css">
   <link rel="icon" href="image/favicon.png">
</head>
<body>
   <!-- header -->
   <div class="jumbotron text-center mb-0">
      <h1>Study Cafe</h1>
      <p>Connective Programming study community</p>
   </div>
   <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
      <!-- 리스트 : 부트스트랩은 모바일 우선이라 화면이 작으면 아래로 쌓아서 내려온다 -->
      <ul class="navbar-nav navbar-dark">
         <li class="nav-item active"><a class="nav-link" href="main.jsp">HOME</a></li>
      </ul>
      <!-- Search -->
      <form class="form-inline ml-auto" action="">
         <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <ul class="navbar-nav navbar-dark">
      <li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
         <li class="nav-item"><a class="nav-link disabled" href="#">카페소개</a></li>
         <li class="nav-item dropdown">
            <!-- 드롭다운 메뉴-->
          <a class="nav-link dropdown-toggle" href="#"
            data-toggle="dropdown"> Dropdown </a>
            <div class="dropdown-menu">
               <a class="dropdown-item" href="#">Link 1</a> 
               <a class="dropdown-item" href="#">Link 2</a> 
               <a class="dropdown-item" href="#">Link 3</a>
            </div>
         </li>
         </ul>
         </nav>
         <!-- inline여야 간격이 없이 메뉴처럼 나온다. ml-atuo : 우측으로 붙게하기-->
         <input class="form-control mr-sm-2" type="text" placeholder="Search">
         <!-- form-control 입력창 꾸며주는 클래스 -->
         <button class="btn btn-success" type="submit">Search</button>
      </form>
   </nav>
  
         
   		
         
          <!-- content -->
   <div class="container pt-3">
      <div class="row">
         <!-- left content -->
         <div class="col-sm-3">

         <% if(request.isRequestedSessionIdValid()){%>
             <table>
                 <tr>
                     <td>
                <span style = "font-size:1.0em;  color: black; margin:4px">
    	            <%=session.getAttribute("sessionName")%>님<br> 환영합니다.
	            </span>
                     </td>
                 </tr>
             </table>
             <hr>
             <%@include file="Logout_sidebar.jsp" %>
             <% }else{%>
         <%@include file="Login_sidebar.jsp" %>
            <%}%>
             <hr>
            <!-- side menu (link) -->
            <%@include file="sidebar.jsp" %>
         </div>
         <!-- right content -->
         <div class="col-sm-8">
            <h2>Red Velvet 'Power Up'</h2>
            <p>2018년 8월 6일, 여름 미니 2집 Summer Magic</p>
            <hr>
            <!-- side menu (link) -->
            <h3>오늘의 소식!</h3>
            <p>레드벨벳(Red Velvet)의 'Power Up'(파워 업)이 인기 고공행진 중이다.</p>
            <p>지난 6일 공개된 레드벨벳 여름 미니앨범 타이틀 곡 'Power Up'은 9일 오전 10시 기준 멜론, 지니,
               엠넷뮤직, 벅스뮤직, 올레뮤직, 네이버뮤직, 소리바다 등 각종 음원 차트 1위를 올킬함은 물론, 중국 샤미뮤직 종합
               차트도 정상을 차지하며 4일 연속 1위를 기록하고 있어 레드벨벳 파워를 실감케 했다.</p>
            <div class="text-center">
            </div>
            <p>또 지난 7일부터 인스타그램, 트위터, 페이스북 등 레드벨벳 공식 SNS에는 초강력 서머송 'Power
               Up'의 포인트 안무 '파도춤'과 '아기상어춤'을 선보이는 SM 소속 아티스트들의 영상이 순차 공개돼 화제를 모으고
               있다.</p>
            <p>이번 영상에는 동방신기 유노윤호, 슈퍼주니어 희철, 소녀시대 태연, 효연, 윤아, 샤이니 민호, 엑소 수호,
               NCT 등 SM 아티스트들이 'Power Up' 포인트 안무를 함께 추며 레드벨벳의 컴백을 응원하는 모습을 만날 수 있어
               훈훈함을 더한다. 레드벨벳은 'Power Up'으로 활발한 활동을 펼친다.</p>
         </div>
      </div>
   </div>
   <!-- footer -->
   <%@include file="footer.jsp" %>

</body>
</html>