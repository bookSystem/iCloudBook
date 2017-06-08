<%--
  Created by IntelliJ IDEA.
  User: Yejunjie
  Date: 2017/6/1
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content="Xenon Boostrap Admin Panel"/>
    <meta name="author" content=""/>

    <title>云书商城后台管理系统</title>
    <link rel="shortcut icon" href="../../img/yunlogo.ico" type="image/x-icon"/>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
    <link rel="stylesheet" href="assets/css/fonts/linecons/css/linecons.css">
    <link rel="stylesheet" href="assets/css/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/xenon-core.css">
    <link rel="stylesheet" href="assets/css/xenon-forms.css">
    <link rel="stylesheet" href="assets/css/xenon-components.css">
    <link rel="stylesheet" href="assets/css/xenon-skins.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <script src="assets/js/jquery-1.11.1.min.js"></script>


</head>
<body class="page-body login-page login-light">


<div class="login-container">

    <div class="row">

        <%--修改密码框开始--%>
        <div class="col-sm-6" id="changebox">
            <!-- Add class "fade-in-effect" for login form effect -->
            <form method="post" role="form" id="changeform" name="changeform" class="login-form fade-in-effect">

                <div class="login-header">
                    <img src="assets/images/logo-white-bg@2x.png" alt="" width="120" />
                    <span>找回密码</span>
                </div>

                <div class="form-group">
                    <label class="control-label" for="cpassword1">新密码</label>
                    <input type="password" class="form-control" name="cpassword" id="cpassword1" autocomplete="off" />
                </div>

                <div class="form-group">
                    <label class="control-label" for="cpassword2">确认密码</label>
                    <input type="password" class="form-control" id="cpassword2" autocomplete="off" />
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary  btn-block text-left">
                        <i class="fa-paper-plane"></i>
                        确认修改
                    </button>
                </div>
            </form>
        </div>
        <%--修改密码框结束--%>

        <%--修改密码script--%>
        <script>
            function formclick(n) {
                var loginform=document.getElementById("login");
                var forgetform=document.getElementById("forgetbox");
                var changeform=document.getElementById("changebox");
                switch (n){
                    case 1:
                        loginform.style.display="none";
                        forgetform.style.display="block";
                        changeform.style.display="none";
                        break;
                    case 2:
                        loginform.style.display="none";
                        forgetform.style.display="none";
                        changeform.style.display="block";
                        break;
                }

            }
        </script>

    </div>
</div>



<!-- Bottom Scripts -->
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/TweenMax.min.js"></script>
<script src="assets/js/resizeable.js"></script>
<script src="assets/js/joinable.js"></script>
<script src="assets/js/xenon-api.js"></script>
<script src="assets/js/xenon-toggles.js"></script>
<script src="assets/js/jquery-validate/jquery.validate.min.js"></script>
<script src="assets/js/toastr/toastr.min.js"></script>


<!-- JavaScripts initializations and stuff -->
<script src="assets/js/xenon-custom.js"></script>

</body>
</html>
