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

                <li>

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

        <!-- User Info, Notifications and Menu Bar -->

        <div class="page-title">

            <div class="title-env">
                <h1 class="title">商品管理</h1>
            </div>

            <div class="breadcrumb-env">

                <ol class="breadcrumb bc-1">
                    <li>
                        <a href="yssc.jsp" target="_self"><i class="fa-home"></i>主页</a>
                    </li>
                    <li>
                        <a disabled="disabled">商品管理</a>
                    </li>
                    <li class="active">
                        <strong>商品信息管理</strong>
                    </li>
                </ol>

            </div>

        </div>

        <!-- Basic Setup -->
        <div class="panel panel-default collapsed">
            <div class="panel-heading">
                <h3 class="panel-title">商品上架</h3>
                <div class="panel-options">

                    <a href="#" data-toggle="panel">
                        <span class="collapse-icon">&ndash;</span>
                        <span class="expand-icon">+</span>
                    </a>

                </div>
            </div>
            <div class="panel-body">
                <form role="form" class="form-horizontal" style="width: 50%;min-width: 500px">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="goodsname">商品名称</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="goodsname" placeholder="" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="goodsid">商品ISBN</label>

                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="goodsid" placeholder="" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="goodsauthor">作者</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="goodsauthor" placeholder="" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="goodsprice">价格</label>

                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="goodsprice" placeholder="" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="goodspress">出版社</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="goodspress" placeholder="" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="goodsremain">库存量</label>

                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="goodsremain" placeholder="" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">分类</label>

                        <div class="col-sm-10">
                            <select class="form-control">
                                <option>请选择商品分类</option>
                                <option>文艺</option>
                                <option>励志</option>
                                <option>教育</option>
                                <option>科技</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="goodsimg">封面上传</label>

                        <div class="col-sm-10">
                            <input type="file" class="form-control" id="goodsimg">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="goodsinfo">商品简介</label>

                        <div class="col-sm-10">
                            <textarea class="form-control" cols="5" rows="8" id="goodsinfo"></textarea>
                        </div>
                    </div>
                    <div class="form-group" style="padding-left: 300px">
                        <div class="col-sm-10">
                            <button type="submit" class="btn btn-info" style="padding: 5px 20px">提交</button>

                            <button type="reset" class="btn btn-gray" style="padding: 5px 20px;margin-left: 10px">重置
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">商品信息管理</h3>
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

                <table id="example-1" class="table table-striped table-bordered" cellspacing="0" width="100%"
                       style="font-size: 11px">
                    <thead>
                    <tr>
                        <th>商品ISBN</th>
                        <th>商品名称</th>
                        <th>作者</th>
                        <th>价格</th>
                        <th>库存量</th>
                        <th>分类</th>
                        <th>出版社</th>
                        <th>图片</th>
                        <th>简介</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                    <tbody>

                    <!--内容开始-->
                    <tr>
                        <td>
                            <%--内容超出范围会显示--%>
                            <div class="tdcss" style="width: 90px">
                                98779862543
                            </div>
                        </td>
                        <td>
                            <div class="tdcss" style="width: 50px">
                                红楼梦
                            </div>
                        </td>
                        <td>
                            <div class="tdcss" style="width: 50px">
                                罗贯中
                            </div>
                        </td>
                        <td>
                            <div class="tdcss" style="width: 20px">
                                45
                            </div>
                        </td>
                        <td>
                            <div class="tdcss" style="width: 20px">
                                35
                            </div>
                        </td>
                        <td>
                            <div class="tdcss" style="width:50px;">
                                inspiration
                            </div>
                        </td>
                        <td>
                            <div class="tdcss" style="width: 50px">
                                清华出版社
                            </div>
                        </td>
                        <td>
                            <div class="tdcss" style="width:60px;">
                                book/image/bookimage/20001212131.jpg
                            </div>
                        </td>
                        <td>
                            <div id="tgoodsinfo" class="tdcss" style="width: 80px">
                                那是距今七年前的事了。当时的我刚满四十岁，虽然已经称不上年轻，但如果把人生比作一场马拉松，也还没抵达折返点。至少，当时的我是这么想的。
                                那年春天我结了婚。在成为丈夫的同时，我也成了一个小学五年级男孩的父亲。也就是说，我的结婚对象是带着她和前夫的小孩跟我结婚的。这也没什么不一般的。顺带一提，“一般”，正好也是那个男孩——名字叫做淳史——的口头禅。
                                “已经很不错了啦，你还配不上人家呢！”姐姐说。
                                就算被如此揶揄，我也没有感到不是滋味。虽然姐姐只大我两岁，但她从小就爱把我当小孩子看，而后遗症至今还留在我身上。至于父亲，则没有对我的婚姻表达任何意见。基本上除了婚姻之外，关于我的任何事情，他也几乎没有表达过什么意见。恐怕他是对我的事情没兴趣吧。而母亲，与其说在意我跟怎样的女性结婚，她更在乎的是我总算结婚了的这个事实，终于让她放下多年以来肩上的重担。不过认真说来，我猜她心里也不太认同这桩婚事吧。

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
                    <!--内容结束-->


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

        $('#cgoodsid').val(divs.eq(0).text().trim());
        $('#cgoodsname').val(divs.eq(1).text().trim());
        $('#cgoodsauthor').val(divs.eq(2).text().trim());
        $('#cgoodsprice').val(divs.eq(3).text().trim());
        $('#cgoodsnum').val(divs.eq(4).text().trim());
        $('#cgoodstype').val(divs.eq(5).text().trim());
        $('#cgoodspublish').val(divs.eq(6).text().trim());
        /* $('#cgoodsimg').f(divs.eq(7).text().trim()); */
        $('#cgoodsinfo').val(divs.eq(8).text().trim());

        var gender = divs.eq(5).text().trim();
        if (gender == 'literature') {
            $('#selectliter').attr("selected", true);
        } else if (gender == 'inspiration') {
            $('#selectinspir').attr("selected", true);
        } else if (gender == 'education') {
            $('#selectedu').attr("selected", true);
        } else {
            $('#selecttech').attr("selected", true);
        }

        $('#modal-6').modal('show');
    }

    function deleteInfo(obj) {
//        删除函数
        var divs = $(obj).parent().parent().children().find('div');
        $('#dgoodsid').val(divs.eq(0).text().trim());
        $('#dgoodsname').val(divs.eq(1).text().trim());

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
                <h4 class="modal-title">修改商品信息</h4>
            </div>

            <div class="modal-body">

                <form role="form" class="form-horizontal" style="width: 50%;min-width: 500px">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="cgoodsname">商品名称</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="cgoodsname" name="cgoodname" placeholder=""
                                   value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="cgoodsid">商品ISBN</label>

                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="cgoodsid" name="cgoodsid" placeholder=""
                                   value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="cgoodsauthor">商品作者</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="cgoodsauthor" name="cgoodsauthor" placeholder=""
                                   value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="cgoodsprice">商品价格</label>

                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="cgoodsprice" name="cgoodsprice" placeholder=""
                                   value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="cgoodsnum">库存数量</label>

                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="cgoodsnum" name="cgoodsremain" placeholder=""
                                   value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="cgoodspublish">出版社</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="cgoodspublish" name="cgoodspublish"
                                   placeholder="" value="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">商品分类</label>

                        <div class="col-sm-10">
                            <select class="form-control" name="cgoodstype" id="cgoodstype">
                                <option value="">请选择商品分类</option>
                                <option id="selectliter" value="literature">文艺</option>
                                <option id="selectinspir" value="inspiration">励志</option>
                                <option id="selectedu" value="education">教育</option>
                                <option id="selecttech" value="technology">科技</option>
                            </select>
                        </div>
                    </div>
                    <%--<div class="form-group">--%>
                        <%--<label class="col-sm-2 control-label" for="cgoodsimg">封面上传</label>--%>

                        <%--<div class="col-sm-10">--%>
                            <%--<input type="file" class="form-control" id="cgoodsimg">--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="cgoodsinfo">商品简介</label>

                        <div class="col-sm-10">
                            <textarea class="form-control" cols="5" rows="8" id="cgoodsinfo"></textarea>
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
                        <label class="col-sm-2 control-label" for="dgoodsid">商品ISBN</label>

                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="dgoodsid" placeholder="" value=""
                                   disabled="disabled">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="dgoodsname">商品名称</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="dgoodsname" placeholder="" value=""
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

<%--&lt;%&ndash;modal 代码开始&ndash;%&gt;--%>
<%--<script type="text/javascript">--%>
<%--function showAjaxModal() {--%>
<%--jQuery('#modal-7').modal('show', {backdrop: 'static'});--%>

<%--jQuery.ajax({--%>
<%--url: "data/ajax-content.txt",--%>
<%--success: function (response) {--%>
<%--jQuery('#modal-7 .modal-body').html(response);--%>
<%--}--%>
<%--});--%>
<%--}--%>
<%--</script>--%>

<%--modal 代码结束--%>


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
