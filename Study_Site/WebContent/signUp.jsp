<%--
  Created by IntelliJ IDEA.
  User: gowoo
  Date: 2020-11-18
  Time: 오후 8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

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

    <title>Sign Up</title>
</head>
<body>

<div class="jumbotron text-center mb-0">
    <h1>Study Cafe</h1>
    <p>Conative Programming study community</p>
</div>&nbsp;

<main class="login-form">
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
                                        <input type="email" id="email" class="form-control is-invalid" name="email" required autofocus>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <div class="input-group is-invalid">
                                        <div class="input-group-prepend">
                                            <label for="name" class="input-group-text">name</label>
                                        </div>
                                        <input type="text" id="name" class="form-control is-invalid" name="name" required>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <div class="input-group is-invalid">
                                        <div class="input-group-prepend">
                                            <label for="passwd" class="input-group-text">Password</label>
                                        </div>
                                        <input type="password" id="passwd" class="form-control is-invalid" name="passwd" required>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <div class="input-group is-invalid">
                                        <div class="input-group-prepend">
                                            <label for="passwdRetype" class="input-group-text">Retype Password</label>
                                        </div>
                                        <input type="password" id="passwdRetype" class="form-control is-invalid" name="passwdRetype" required>
                                    </div>
                                </div>
                                <div class="col-md-6 offset-md-4">
                                    <button type="submit" class="btn btn-primary">
                                     Register
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>