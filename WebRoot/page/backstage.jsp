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
    <head>
        <title>云书商城-正品书店，品类齐全，价格优惠！</title>

        <!-- BOOTSTRAP STYLES-->
        <link href="../assets/css/bootstrap.css" rel="stylesheet"/>
        <!-- FONTAWESOME STYLES-->
        <link href="../assets/css/font-awesome.css" rel="stylesheet"/>
        <!-- CUSTOM STYLES-->
        <link href="../assets/css/custom.css" rel="stylesheet"/>

        <link rel="shortcut icon" href="../img/yunlogo.ico" type="image/x-icon"/>
        <link rel="stylesheet" type="text/css" href="../css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.min.css"/>
        <link href="../css/homeindex.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="../javascript/jquery-1.7.2.js"></script>
        <link rel="stylesheet" type="text/css" href="../css/icloudstyle.css"/>
        <script type="text/javascript" src="../javascript/navspace.js"></script>
        <%--<script src="../javascript/angular.js"></script>--%>
        <%--<script src="../javascript/car-controller.js"></script>--%>

    </head>
<body>
<header>
    <div class="greyheader">
        <span id="modify" style="padding: 0 30px 0 2px;">
            <a href="modifypwd.jsp" target="_self">修改密码</a>
        </span>
        <span>|</span>
        <span id="nowusername">
            <a>当前用户名</a>
        </span>
    </div>
</header>
<nav style="min-height: 130px">
    <div align="center"><img id="logopic" src="../img/logo300x100.png"></div>
</nav>

<div class="clear"></div>

<div id="wrapper">
    <%--<div class="navbar navbar-inverse navbar-fixed-top">--%>
        <%--<div class="adjust-nav">--%>
            <%--<div class="navbar-header">--%>
                <%--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">--%>
                    <%--<span class="icon-bar"></span>--%>
                    <%--<span class="icon-bar"></span>--%>
                    <%--<span class="icon-bar"></span>--%>
                <%--</button>--%>
                <%--<a class="navbar-brand" href="#">--%>
                    <%--<img src="../assets/img/logo.png"/>--%>
                <%--</a>--%>
            <%--</div>--%>

            <%--<span class="logout-spn">--%>
                  <%--<a href="#" style="color:#fff;">LOGOUT</a>--%>

                <%--</span>--%>
        <%--</div>--%>
    <%--</div>--%>
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation" style="width: 260px;float: left">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu" >


                <li>
                    <a href="nindexpage.jsp"><i class="fa fa-desktop "></i>Dashboard <span class="badge">Included</span></a>
                </li>


                <li>
                    <a href="nbookdisplay.jsp"><i class="fa fa-table "></i>UI Elements <span
                            class="badge">Included</span></a>
                </li>
                <li class="active-link">
                    <a href="nliterature.jsp"><i class="fa fa-edit "></i>Blank Page <span class="badge">Included</span></a>
                </li>


                <li>
                    <a href="#"><i class="fa fa-qrcode "></i>My Link One</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-bar-chart-o"></i>My Link Two</a>
                </li>

                <li>
                    <a href="#"><i class="fa fa-edit "></i>My Link Three </a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-table "></i>My Link Four</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-edit "></i>My Link Five </a>
                </li>
            </ul>
        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper" style="width: auto;min-width:790px;float: left">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>BLANK PAGE </h2>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr/>

            <!-- /. ROW  -->
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<div class="clear"></div>

<!-- BOOTSTRAP SCRIPTS -->
<script src="../assets/js/bootstrap.min.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="../assets/js/custom.js"></script>


<footer>
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
