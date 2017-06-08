<%--
  Created by IntelliJ IDEA.
  User: Yejunjie
  Date: 2017/5/10
  Time: 23:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>云书商城-正品书店，品类齐全，价格优惠！</title>
    <link rel="shortcut icon" href="../img/yunlogo.ico" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css" href="../css/reset.css"/>
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/navspace.js"></script>
    <link href="${pageContext.request.contextPath}/css/home.css?v=2" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery-1.7.2.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icloudstyle.css"/>
</head>
<body>
<header>
    <div class="greyheader">
        <span id="registericon" style="padding: 0 30px 0 2px;">
            <a href="${pageContext.request.contextPath}/index.jsp" target="_self">返回首页</a>
        </span>
        <%--<span>|</span>--%>
        <%--<span id="loginicon">--%>
        <%--<a href="loginpage.jsp" target="_blank">登录</a>--%>
        <%--</span>--%>
    </div>
    <nav style="min-height: 130px;height:auto">
        <div align="center"><a href="nindexpage.jsp" target="_self"><img id="logopic" src="${pageContext.request.contextPath}/img/logo300x100.png"></a></div>
    </nav>
</header>
<div class="wrap">
    <div class="banner-show" id="js_ban_content">
        <div class="cell bns-01">
            <div class="con"><a href="#" target="_blank" class="banner-link"> <i></i></a></div>
        </div>
        <div class="cell bns-02" style="display:none;">
            <div class="con"><a href="#" target="_blank" class="banner-link"> <i></i></a></div>
        </div>
        <div class="cell bns-03" style="display:none;">
            <div class="con"><a href="#" target="_blank" class="banner-link"> <i></i></a></div>
        </div>
    </div>
    <div class="banner-control" id="js_ban_button_box">
        <a href="javascript:;" class="left">左</a>
        <a href="javascript:;" class="right">右</a>
    </div>
    <script type="text/javascript">
        ;
        (function () {

            var defaultInd = 0;
            var list = $('#js_ban_content').children();
            var count = 0;
            var change = function (newInd, callback) {
                if (count) return;
                count = 2;
                $(list[defaultInd]).fadeOut(400, function () {
                    count--;
                    if (count <= 0) {
                        if (start.timer) window.clearTimeout(start.timer);
                        callback && callback();
                    }
                });
                $(list[newInd]).fadeIn(400, function () {
                    defaultInd = newInd;
                    count--;
                    if (count <= 0) {
                        if (start.timer) window.clearTimeout(start.timer);
                        callback && callback();
                    }
                });
            }

            var next = function (callback) {
                var newInd = defaultInd + 1;
                if (newInd >= list.length) {
                    newInd = 0;
                }
                change(newInd, callback);
            }

            var start = function () {
                if (start.timer) window.clearTimeout(start.timer);
                start.timer = window.setTimeout(function () {
                    next(function () {
                        start();
                    });
                }, 3000);
            }

            start();

            $('#js_ban_button_box').on('click', 'a', function () {
                var btn = $(this);
                if (btn.hasClass('right')) {
//next
                    next(function () {
                        start();
                    });
                }
                else {
//prev
                    var newInd = defaultInd - 1;
                    if (newInd < 0) {
                        newInd = list.length - 1;
                    }
                    change(newInd, function () {
                        start();
                    });
                }
                return false;
            });

        })();
    </script>
    <div class="container">
        <div class="register-box">
            <div align="center"
                 style="width:331px;height:45px;line-height:40px;font-size: 20px;font-weight: bold;color: #333333;margin: 0 auto;border-bottom: 1px solid rgba(204,204,204,0.8) ">
                <div style="margin:0 auto;width: 165px;height:35px;line-height:35px;color: rgba(51,51,51,0.9);">重置密码</div>
            </div>
            <form id="form1" style="width:80%;margin: 0 auto;display: block;" method="post" action="user_rePassword.action">
                <div class="input-group" style="padding-top: 15px;">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                    <input type="password" name="newpassword" class="form-control" placeholder="新密码" style="height: 40px">
                </div>
                <div class="input-group" style="padding-top: 15px;">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                    <input type="password" name="repassword" class="form-control" placeholder="确认密码" style="height: 40px">
                </div>
                <!-- <div class="input-group" style="padding-top: 30px;">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                    <input type="text" name="telnum" class="form-control" placeholder="手机号" style="height: 40px">
                </div> -->
                <!-- <div class="input-group" style="padding-top: 30px;">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                    <input type="password" name="newpassword" class="form-control" placeholder="新密码" style="height: 40px">
                </div>
                <div class="input-group" style="padding-top: 30px;">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                    <input type="password" name="repassword" class="form-control" placeholder="确认密码" style="height: 40px">
                </div> -->
                <span style="margin: 0 auto;"><button type="submit" class="btn btn-primary"
                                                      style="text-align:center;width: 100%;margin-top: 20px">提交</button></span>
            </form>

        </div>
    </div>
</div>
<footer>
    <div align="center" style="margin-top: 20px"><img src="../img/button1024x65.png"></div>
    <div class="footcss" align="center">
        <div class="about">
            <span><a>关于我们</a></span>
            <span>|</span>
            <span><a>联系我们</a></span>
            <span>|</span>
            <span><a>诚聘英才</a></span>
            <span>|</span>
            <span><a>商务合作</a></span>
            <div class="aboutclear"></div>
            <span>云书商城公司版权所有<span style="font-size: 8px;font-family: 'Microsoft YaHei'">&copy;</span>2016-2017</span>
        </div>
    </div>
</footer>
</body>
</html>
