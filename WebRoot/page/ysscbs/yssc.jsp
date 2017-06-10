<%--
  Created by IntelliJ IDEA.
  User: Yejunjie
  Date: 2017/6/1
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content="Xenon Boostrap Admin Panel"/>
    <meta name="author" content=""/>

    <title>云书商城后台管理系统</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/yunlogo.ico" type="image/x-icon"/>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/ysscbs/assets/css/fonts/linecons/css/linecons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/ysscbs/assets/css/fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/ysscbs/assets/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/ysscbs/assets/css/xenon-core.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/ysscbs/assets/css/xenon-forms.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/ysscbs/assets/css/xenon-components.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/ysscbs/assets/css/xenon-skins.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/ysscbs/assets/css/custom.css">

    <script src="${pageContext.request.contextPath}/page/ysscbs/assets/js/jquery-1.11.1.min.js"></script>


</head>
<body class="page-body skin-navy">
<%
	if(request.getAttribute("seller")==null)
	{
		if(request.getParameter("sellerId") != null){
			String sellerId = request.getParameter("sellerId");
			response.sendRedirect("sellerperson_findSeller.action?sellerId=" +sellerId);
		}
	}
%>

<div class="page-container">

    <div class="sidebar-menu toggle-others fixed">

        <div class="sidebar-menu-inner">

            <header class="logo-env">

                <!-- logo -->
                <div class="logo">
                    <a href="yssc.jsp"><img src="${pageContext.request.contextPath}/page/ysscbs/assets/images/logo@2x.png" width="140px" alt=""/></a>
                </div>


            </header>


            <ul id="main-menu" class="main-menu">

                <li>
                    <a href="#">
                        <i class="linecons-database"></i>
                        <span class="title">订单管理</span>
                    </a>
                    <ul>
                        <li>
                        <c:if test="${seller!=null }"> 
                            <a href="${pageContext.request.contextPath}/page/ysscbs/goodstable1.jsp?sellerId=${requestScope.seller.getSellerId()}&currentPage=1">
                            </c:if>
                                <span class="title">订单表管理</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                <c:if test="${seller!=null }"> 
                    <a href="${pageContext.request.contextPath}/page/ysscbs/commodity.jsp?sellerId=${requestScope.seller.getSellerId()}&currentPage=1">
                </c:if>
                        <i class="linecons-star"></i>
                        <span class="title">商品管理</span>
                    </a>
                </li>
            </ul>

        </div>

    </div>

    <div class="main-content">

        <!-- User Info, Notifications and Menu Bar -->
        <nav class="navbar user-info-navbar" role="navigation">


            <!-- Right links for user info navbar -->
            <ul class="user-info-menu right-links list-inline list-unstyled">


                <li class="dropdown user-profile">
                    <a href="#" data-toggle="dropdown">
                        <img src="${pageContext.request.contextPath}/page/ysscbs/assets/images/user-4.png" alt="user-image" class="img-circle img-inline userpic-32"
                             width="28"/>
                        <span>
                            <%--这里是登录用户的账户名--%>
								<c:if test="${seller!=null }">
				  					${requestScope.seller.getName()}
				  				</c:if>
								<i class="fa-angle-down"></i>
							</span>
                    </a>

                    <ul class="dropdown-menu user-profile-menu list-unstyled">
                        <li>
                            <a href="${pageContext.request.contextPath}/page/ysscbs/personalinfo.jsp?sellerId=${requestScope.seller.getSellerId()}">
                                <i class="fa-user"></i>
                                个人资料
                            </a>
                        </li>

                        <li class="last">
                             <a href="${pageContext.request.contextPath}/loginpage.jsp">
                                <i class="fa-lock"></i>
                                登出账号
                            </a>
                        </li>
                    </ul>
                </li>


            </ul>

        </nav>


        <div class="row">
            <h2>欢迎进入云书商城管理系统</h2>
        </div>


        <footer class="main-footer sticky footer-type-1">

            <div class="footer-inner">

                <!-- Add your copyright text here -->
                <div class="footer-text">
                    &copy; 2017
                    <strong>云书商城</strong>
                    <!-- theme by <a href="http://laborator.co" target="_blank">Laborator</a> -->
                </div>


                <!-- Go to Top Link, just add rel="go-top" to any link to add this functionality -->
                <div class="go-up">

                    <a href="#" rel="go-top">
                        <i class="fa-angle-up"></i>
                    </a>

                </div>

            </div>

        </footer>
    </div>


</div>




<!-- Bottom Scripts -->
<script src="${pageContext.request.contextPath}/page/ysscbs/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/page/ysscbs/assets/js/TweenMax.min.js"></script>
<script src="${pageContext.request.contextPath}/page/ysscbs/assets/js/resizeable.js"></script>
<script src="${pageContext.request.contextPath}/page/ysscbs/assets/js/joinable.js"></script>
<script src="${pageContext.request.contextPath}/page/ysscbs/assets/js/xenon-api.js"></script>
<script src="${pageContext.request.contextPath}/page/ysscbs/assets/js/xenon-toggles.js"></script>


<!-- Imported scripts on this page -->
<script src="${pageContext.request.contextPath}/page/ysscbs/assets/js/xenon-widgets.js"></script>
<script src="${pageContext.request.contextPath}/page/ysscbs/assets/js/devexpress-web-14.1/js/globalize.min.js"></script>
<script src="${pageContext.request.contextPath}/page/ysscbs/assets/js/devexpress-web-14.1/js/dx.chartjs.js"></script>
<script src="${pageContext.request.contextPath}/page/ysscbs/assets/js/toastr/toastr.min.js"></script>


<!-- JavaScripts initializations and stuff -->
<script src="${pageContext.request.contextPath}/page/ysscbs/assets/js/xenon-custom.js"></script>

</body>
</html>
