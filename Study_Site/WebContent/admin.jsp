<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>



<div>
    <a class="navbar-brand" href="#">
        Administrator Page
    </a>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <form class="navbar-form navbar-left" method="GET" role="search">
            <div class="form-group">
                <input type="text" name="q" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button>
        </form>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="main2.jsp" target="_blank">Study Cafe</a></li>


        </ul>
    </div><!-- /.navbar-collapse -->
</div><!-- /.container-fluid -->
</nav>
<div class="container-fluid main-container">
    <div class="col-md-2 sidebar">
        <ul class="nav nav-pills nav-stacked">
            <li class="active"><a href="#"><b>Home</b></a></li>
            <li class=""><a href="#"><b>회원조회</b></a></li>
        </ul>
    </div>

    <div class="col-md-10 content">
        <div class="panel panel-default">
            <div class="panel-heading">
                <b>회원목록
            </div>

            <div class="table-inbox-wrap ">
                <table class="table table-inbox table-hover">
                    <tbody>
                    <tr class="unread">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="selectAllMembers">

                        <td><b>회원 이름</b></td>
                        <td><b>회원 아이디</b></td>
                        <td><b>회원 가입날짜</b></td>

                    <tr>
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="memberChk">
                        </td>
                        <td>Paypal</td>
                        <td>New payment received</td>
                        <td>March 04</td>
                    </tr>
                    <tr>
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="memberChk">
                        </td>
                        <td>Andrea</td>
                        <td>Weekend plans</td>
                        <td>March 04</td>
                    </tr>
                    <tr>
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="memberChk">
                        </td>
                        <td>David Green</td>
                        <td>Soccer tickets</td>
                        <td>February 22</td>
                    </tr>
                    </tbody>
                </table>
                <script>
                    var selectAll = document.querySelector(".selectAllMembers");
                    selectAll.addEventListener('click', function(){
                        var objs = document.querySelectorAll(".memberChk");
                        for (var i = 0; i < objs.length; i++) {
                            objs[i].checked = selectAll.checked;
                        };
                    }, false);

                    var objs = document.querySelectorAll(".memberChk");
                    for(var i=0; i<objs.length ; i++){
                        objs[i].addEventListener('click', function(){
                            var selectAll = document.querySelector(".selectAllMembers");
                            for (var j = 0; j < objs.length; j++) {
                                if (objs[j].checked === false) {
                                    selectAll.checked = false;
                                    return;
                                };
                            };
                            selectAll.checked = true;
                        }, false);
                    }
                </script>

            </div>
        </div>

    </div>
</div>
<div style="float: right; margin-right:30px;">
    <input type="button" class="btn" name="btn" value="탈퇴">
</div>
