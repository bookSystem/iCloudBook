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
<body class="page-body skin-navy">
<%
	if(request.getAttribute("showSeller")==null)
	{
		if(request.getParameter("sellerId") != null){
			String sellerId = request.getParameter("sellerId");
			response.sendRedirect("sellerperson_showSeller.action?sellerId=" +sellerId); 
		}
		else{
			String sellerId = (String)request.getAttribute("sId");
			response.sendRedirect("sellerperson_showSeller.action?sellerId=" +sellerId); 
		}
		
	}
%>

<div class="page-container">

    <div class="sidebar-menu toggle-others fixed">
        <div class="sidebar-menu-inner">
            <header class="logo-env">

                <!-- logo -->
                <div class="logo">
                    <a href=""><img src="assets/images/logo@2x.png" width="140px" alt=""/></a>
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
                            <a href="goodstable1.jsp?sellerId=${requestScope.sId}">
                                <span class="title">订单表管理</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="commodity.jsp?sellerId=${requestScope.sId}">
                        <i class="linecons-star"></i>
                        <span class="title">商品管理</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="main-content">

        <nav class="navbar user-info-navbar" role="navigation">
            <ul class="user-info-menu right-links list-inline list-unstyled">
                <li class="dropdown user-profile">
                    <a href="#" data-toggle="dropdown">
                        <img src="assets/images/user-4.png" alt="user-image" class="img-circle img-inline userpic-32"
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
                            <a href="personalinfo.jsp">
                                <i class="fa-user"></i>
                                个人资料
                            </a>
                        </li>

                        <li class="last">
                            <a href="yssclogin.jsp">
                                <i class="fa-lock"></i>
                                登出账号
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>


        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">修改个人信息页</h3>
            </div>
            <div class="panel-body">
                <form action="sellerperson_updateSeller.action" role="form" class="form-horizontal" style="width: 60%;min-width: 500px" >
                <c:forEach items="${showSeller}" var="seller">
                <input type="hidden" name="sellerId" value=${seller.sellerId }>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="perusername">用户名</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="perusername" name="perusername" placeholder=""
                                   value=${seller.name }
                                   disabled="disabled">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="peruserpwd">密码</label>

                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="peruserpwd" name="peruserpwd" placeholder=""
                                   value=${seller.password }
                                   disabled="disabled">

                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" id="changepwd" >
                                    修改密码
                                </label>
                                <script>
                                    $(document).ready(function () {
                                        $('#changepwd').click(function () {
                                            if ($('#changepwd').is(':checked')) {
                                                $('#peruserpwd').attr("disabled",false);
                                            } else {
                                                $('#peruserpwd').attr("disabled", true);
                                            }
                                        });
                                    });

                                </script>
                            </div>

                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="perusermail">邮箱</label>

                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="perusermail" name="email" placeholder=""
                                   value="${seller.email }">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="peruserphone">电话</label>

                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="peruserphone" name="telnum"
                                   placeholder="" value=${seller.telnum }>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="peruseradd">地址</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="peruseradd" name="address" placeholder=""
                                   value=${seller.address }>
                        </div>
                    </div>


                    <div class="form-group" style="padding-left: 300px">
                        <div class="col-sm-10">
                            <button type="submit" class="btn btn-info" style="padding: 5px 20px">确认保存</button>

                        </div>
                    </div>
                    </c:forEach>
                </form>
            </div>
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
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/TweenMax.min.js"></script>
<script src="assets/js/resizeable.js"></script>
<script src="assets/js/joinable.js"></script>
<script src="assets/js/xenon-api.js"></script>
<script src="assets/js/xenon-toggles.js"></script>


<!-- Imported scripts on this page -->
<script src="assets/js/xenon-widgets.js"></script>
<script src="assets/js/devexpress-web-14.1/js/globalize.min.js"></script>
<script src="assets/js/devexpress-web-14.1/js/dx.chartjs.js"></script>
<script src="assets/js/toastr/toastr.min.js"></script>


<!-- JavaScripts initializations and stuff -->
<script src="assets/js/xenon-custom.js"></script>

</body>
</html>
