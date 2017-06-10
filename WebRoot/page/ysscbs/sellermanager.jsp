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

    <style type="text/css">
        .tdcss {
            line-height: 25px;
            height: 25px;
            overflow-x: hidden;
            overflow-y: hidden;
        }
    </style>

</head>
<body class="page-body skin-navy">
<%
	if(request.getAttribute("showSeller")==null){
		response.sendRedirect("admin_showSeller.action"); 
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

                <div class="mobile-menu-toggle visible-xs">
                    <a href="#" data-toggle="user-info-menu">
                        <i class="fa-bell-o"></i>
                        <span class="badge badge-success">7</span>
                    </a>
                    <a href="#" data-toggle="mobile-menu">
                        <i class="fa-bars"></i>
                    </a>
                </div>
            </header>

            <ul id="main-menu" class="main-menu">
                <li>
                    <a href="usermanager.jsp">
                        <i class="linecons-user"></i>
                        <span class="title">买家管理</span>
                    </a>
                    <a href="sellermanager.jsp">
                        <i class="linecons-user"></i>
                        <span class="title">卖家管理</span>
                    </a>

                </li>
            </ul>
        </div>
    </div>

    <div class="main-content">
        <div class="page-title">
            <div class="title-env">
                <h1 class="title">用户管理</h1>
            </div>

            <div class="breadcrumb-env">
                <ol class="breadcrumb bc-1">
                    <li>
                        <a href="admin.jsp" target="_self"><i class="fa-home"></i>主页</a>
                    </li>
                    <li class="active">
                        <strong>卖家信息管理</strong>
                    </li>
                </ol>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">卖家信息管理</h3>
            </div>
            <div class="panel-body">

                <script type="text/javascript">
                    jQuery(document).ready(function ($) {
                        $("#example-1").dataTable({
                            aLengthMenu: [
                                [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]
                            ]
                        });
                    });
                </script>

                <table id="example-1" class="table table-striped table-bordered" cellspacing="0" width="100%" style="font-size: 11px">
                    <thead>
                    <tr>
                        <th>用户ID</th>
                        <th>用户名</th>
                        <th>密码</th>
                        <th>邮箱</th>
                        <th>电话</th>
                        <th>地址</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                    <tbody>
						 <c:forEach items="${showSeller.list}" var="showSeller">

                    <tr>
                        <td>
                            <%--内容超出范围会显示--%>
                            <div class="tdcss" style="width: 30px">
                                ${ showSeller.sellerId}
                            </div>
                        </td>
                        <td>
                            <div class="tdcss" style="width: 70px">
                                ${ showSeller.name}
                            </div>
                        </td>
                        <td>
                            <div class="tdcss" style="width: 90px">
                                ${ showSeller.password}
                            </div>
                        </td>
                        <td>
                            <div class="tdcss" style="width: 70px">
                                ${ showSeller.email}
                            </div>
                        </td>
                        <td>
                            <div class="tdcss" style="width:100px;">
                                ${ showSeller.telnum}
                            </div>
                        </td>
                        <td>
                            <div class="tdcss" style="width:120px;">
                              ${ showSeller.address}
                            </div>
                        </td>
                        <td width="120px" align="center">

                            <a onclick="deleteInfo(this)"
                               class="btn btn-danger btn-sm btn-icon icon-left">
                                删除
                            </a>

                        </td>
                    </tr>

						</c:forEach>
                    </tbody>
                </table>

            </div>
        </div>

        <footer class="main-footer sticky footer-type-1">

            <div class="footer-inner">

                <!-- Add your copyright text here -->
                <div class="footer-text">
                    &copy; 2017
                    <strong>云书商城</strong>

                </div>

                <div class="go-up">

                    <a href="#" rel="go-top">
                        <i class="fa-angle-up"></i>
                    </a>

                </div>

            </div>

        </footer>
    </div>


</div>
<%--模态框调用函数--%>
<script>

    function deleteInfo(obj) {
//        删除函数
        var divs = $(obj).parent().parent().children().find('div');
        $('#sellerid').val(divs.eq(0).text().trim());
        $('#dsellerid').val(divs.eq(0).text().trim());
        $('#dsellername').val(divs.eq(1).text().trim());

        $('#modal-4').modal('show');
    }

</script>
<%----%>


<%--删除模态框结束--%>
<div class="modal fade" id="modal-4" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content" style="height: auto">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                <h4 class="modal-title">提示框</h4>
            </div>
            <div class="modal-body">
                <form action="admin_deleteSeller.action" method="post" role="form" class="form-horizontal" style="width: 95%;min-width: 250px" >
					 <input type="hidden" id="sellerid" name="sellerId" value="">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="duserid">用户ID</label>

                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="dsellerid" name="dsellerid" placeholder=""
                                   value="" disabled="disabled">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="dusername">用户名</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="dsellername" name="sellerName" placeholder=""
                                   value="" disabled="disabled">
                        </div>
                    </div>

                    <span style="margin-left: 50px;">确定删除该条信息吗？</span>
                    <button type="submit" class="btn btn-info" >确定</button>
                </form>
            </div>

        </div>

    </div>
</div>

<%--删除模态框结束--%>
<!-- Imported styles on this page -->
<link rel="stylesheet" href="assets/js/datatables/dataTables.bootstrap.css">

<!-- Bottom Scripts -->
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/TweenMax.min.js"></script>
<script src="assets/js/resizeable.js"></script>
<script src="assets/js/joinable.js"></script>
<script src="assets/js/xenon-api.js"></script>
<script src="assets/js/xenon-toggles.js"></script>
<script src="assets/js/datatables/js/jquery.dataTables.min.js"></script>


<!-- Imported scripts on this page -->
<script src="assets/js/datatables/dataTables.bootstrap.js"></script>
<script src="assets/js/datatables/yadcf/jquery.dataTables.yadcf.js"></script>
<script src="assets/js/datatables/tabletools/dataTables.tableTools.min.js"></script>


<!-- JavaScripts initializations and stuff -->
<script src="assets/js/xenon-custom.js"></script>


</body>
</html>