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

<div class="page-container">

    <div class="sidebar-menu toggle-others fixed">

        <div class="sidebar-menu-inner">

            <header class="logo-env">

                <!-- logo -->
                <div class="logo">
                    <a href="yssc.jsp"><img src="assets/images/logo@2x.png" width="140px" alt=""/></a>
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

                <li class="active opened active">

                    <a href="#">
                        <i class="linecons-database"></i>
                        <span class="title">订单管理</span>
                    </a>
                    <ul>
                        <li>
                            <a href="goodstable1.jsp">
                                <span class="title">订单表管理</span>
                            </a>
                        </li>
                        <li>
                            <a href="goodstable2.jsp">
                                <span class="title">订单项管理</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="commodity.jsp">
                        <i class="linecons-star"></i>
                        <span class="title">商品管理</span>
                    </a>
                </li>
                <li>
                    <a href="usermanager.jsp">
                        <i class="linecons-user"></i>
                        <span class="title">用户管理</span>
                    </a>

                </li>
            </ul>

        </div>

    </div>

    <div class="main-content">
        <div class="page-title">

            <div class="title-env">
                <h1 class="title">订单管理</h1>

            </div>

            <div class="breadcrumb-env">

                <ol class="breadcrumb bc-1">
                    <li>
                        <a href="yssc.jsp" target="_self"><i class="fa-home"></i>主页</a>
                    </li>
                    <li>
                        <a disabled="disabled">订单管理</a>
                    </li>
                    <li class="active">
                        <strong>订单表管理</strong>
                    </li>
                </ol>

            </div>

        </div>

        <!-- Basic Setup -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">订单表管理</h3>
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
                        <th>订单ID</th>
                        <th>订单编号</th>
                        <th>提交时间</th>
                        <th>订单金额</th>
                        <th>状态</th>
                        <th>电话</th>
                        <th>地址</th>
                        <th>用户ID</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr>
                        <td>
                            <%--内容超出范围会显示--%>
                            <div class="tdcss" style="width: 30px">
                                1
                            </div>
                        </td>
                        <td>
                            <div class="tdcss" style="width: 70px">
                                DDBH170563215467
                            </div>
                        </td>
                        <td>
                            <div class="tdcss" style="width: 50px">
                                2017-05-30 00:02:26
                            </div>
                        </td>
                        <td>
                            <div class="tdcss" style="width: 30px">
                                144
                            </div>
                        </td>
                        <td>
                            <div class="tdcss" style="width: 40px">
                                2213456
                            </div>
                        </td>
                        <td>
                            <div class="tdcss" style="width:50px;">
                                13198765432
                            </div>
                        </td>
                        <td>
                            <div class="tdcss" style="width:50px;">
                                上海师范大学
                            </div>
                        </td>
                        <td>
                            <div class="tdcss" style="width:50px;">
                                2
                            </div>
                        </td>
                        <td width="120px" align="center">
                            <a onclick="editInfo(this);"
                               class="btn btn-secondary btn-sm btn-icon icon-left">
                                修改
                            </a>

                            <a onclick="deleteInfo(this)"
                               class="btn btn-danger btn-sm btn-icon icon-left">
                                删除
                            </a>

                        </td>
                    </tr>

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
    function editInfo(obj) {
//        修改函数
        var divs = $(obj).parent().parent().children().find('div');

        $('#corderid').val(divs.eq(1).text().trim());
        $('#cordertotal').val(divs.eq(3).text().trim());
        $('#corderphone').val(divs.eq(5).text().trim());
        $('#corderadd').val(divs.eq(6).text().trim());

        var gender =divs.eq(4).text().trim();
        if (gender == '0') {
            $('#select0').attr("selected", true);
        } else if (gender == '1') {
            $('#select1').attr("selected", true);
        } else {
            $('#select2').attr("selected", true);
        }

        $('#modal-6').modal('show');
    }

    function deleteInfo(obj) {
//        删除函数
        var divs = $(obj).parent().parent().children().find('div');
        $('#dorderid').val(divs.eq(1).text().trim());

        $('#modal-4').modal('show');
    }

</script>
<%----%>

<%--修改模态框开始--%>
<div class="modal fade" id="modal-6">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                <h4 class="modal-title">修改订单信息</h4>
            </div>

            <div class="modal-body">

                <form role="form" class="form-horizontal" style="width: 50%;min-width: 500px">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="corderid">订单编号</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="corderid" name="corderid" placeholder=""
                                   value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="cordertotal">订单总额</label>

                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="cordertotal" name="cordertotal" placeholder=""
                                   value="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="corderphone">联系电话</label>

                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="corderphone" name="corderphone" placeholder=""
                                   value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="corderadd">送达地址</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="corderadd" name="corderadd" placeholder=""
                                   value="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">订单状态</label>

                        <div class="col-sm-10">
                            <select class="form-control" name="cordertype" id="cordertype">
                                <option value="">请选择订单状态</option>
                                <option id="select0" value="0">订单状态未添加</option>
                                <option id="select1" value="1">订单状态未添加</option>
                                <option id="select2" value="2">订单状态未添加</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" style="padding-left:200px">
                        <div class="col-sm-10">
                            <button type="submit" formaction="" class="btn btn-info" style="padding: 5px 20px">提交
                            </button>

                            <button type="reset" class="btn btn-gray" style="padding: 5px 20px;margin-left: 10px">重置
                            </button>
                        </div>
                    </div>
                </form>

            </div>

        </div>
    </div>
</div>
<%--修改模态框结束--%>

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
                <form role="form" class="form-horizontal" style="width: 95%;min-width: 250px">

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="dorderid">订单编号</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="dorderid" placeholder="" value=""
                                   disabled="disabled">
                        </div>
                    </div>

                    <span style="margin-left: 50px;">确定删除该条信息吗？</span>
                    <button type="submit" formaction="" class="btn btn-info" data-dismiss="modal">确定</button>
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
