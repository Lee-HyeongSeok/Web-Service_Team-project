<%--
  Created by IntelliJ IDEA.
  User: gowoo
  Date: 2020-11-18
  Time: 오후 8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" %>


<!doctype html>
<html lang="ko">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">
    <link rel="icon" href="image/favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/login_register_form.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

    <%-- js    --%>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#alert-length").hide();
            $("#alert-success").hide();
            $("#alert-danger").hide();
            $("input").keyup(function () {
                var pwd1 = $("#passwd").val();
                var pwd2 = $("#passwdRetype").val();
                if (pwd1.length == 0) {
                    $("#alert-length").hide();
                    $("#alert-success").hide();
                    $("#alert-danger").hide();
                    $("#submitBtn").attr("disabled", "disabled");
                }
                if (pwd1 != "" || pwd2 != "") {
                    if (pwd1.length < 8 || pwd1.length > 16) {
                        $("#alert-length").show();
                        $("#alert-success").hide();
                        $("#alert-danger").hide();
                        $("#submitBtn").attr("disabled", "disabled");
                    } else if (pwd1 == pwd2) {
                        $("#alert-success").show();
                        $("#alert-length").hide();
                        $("#alert-danger").hide();
                        $("#submitBtn").removeAttr("disabled");
                    } else {
                        $("#alert-length").hide();
                        $("#alert-success").hide();
                        $("#alert-danger").show();
                        $("#submitBtn").attr("disabled", "disabled");
                    }
                }
            });
        });
    </script>
    <!------ Include the above in your HEAD tag ---------->
    <title>Study Cafe :: Sign Up</title>
</head>
<body>
<div class="jumbotron text-center mb-0" style="background:#08060b; padding : 0;border-radius: 0">
    <a href="main.jsp"><img alt="special study cafe" src="image/scs.jpg" style="height:100%"></a>
</div>

<main class="login-form" style="margin: 40px 5px">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Register</div>
                    <div class="card-body">
                        <form class="was-validated" method="post" action="signUp_process.jsp">
                            <div class="mb-3">
                                <div class="input-group is-invalid">
                                    <div class="input-group-prepend">
                                        <label for="email" class="input-group-text">E-Mail</label>
                                    </div>
                                    <input type="email" id="email" class="form-control is-invalid" name="email" required
                                           autofocus>
                                </div>
                            </div>
                            <div class="mb-3">
                                <div class="input-group is-invalid">
                                    <div class="input-group-prepend">
                                        <label for="name" class="input-group-text">이름</label>
                                    </div>
                                    <input type="text" id="name" class="form-control is-invalid" name="name" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <div class="input-group is-invalid">
                                    <div class="input-group-prepend">
                                        <label for="passwd" class="input-group-text">비밀번호</label>
                                    </div>
                                    <input type="password" id="passwd" class="form-control" name="passwd" required>

                                </div>
                            </div>

                            <div class="mb-3">
                                <div class="input-group is-invalid">
                                    <div class="input-group-prepend">
                                        <label for="passwdRetype" class="input-group-text">비밀번호 재입력</label>
                                    </div>
                                    <input type="password" id="passwdRetype" class="form-control" name="passwdRetype"
                                           required>
                                </div>
                            </div>
                            <div class="alert alert-danger" id="alert-length">비밀번호는 6~18자리만 가능합니다.</div>
                            <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
                            <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
                            <div style="text-align: center">
                                <button type="submit" id="submitBtn" class="btn btn-outline-info">
                                    회원가입
                                </button>
                                <button onclick="history.go(-1)" class="btn btn-outline-info">
                                    취소
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>