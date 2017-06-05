<%--
  Created by IntelliJ IDEA.
  User: Yejunjie
  Date: 2017/5/10
  Time: 23:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <head>
        <title>云书商城-正品书店，品类齐全，价格优惠！</title>
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
<jsp:include page="top.jsp"></jsp:include>

<div class="container" style="height:auto;min-height: 600px">
    <script type="text/javascript">
        $(document).ready(function() {
            $("#new_address_dialog").on("show.bs.modal", function (e) {
                loadPage("new_address_content_div", "<?php echo $this->baseUrl . '/system/address/add.ajax/cid/' . $this->customerId . '/from/' . base64_encode($_SERVER['REQUEST_URI']); ?>");
            });

            $("#new_address_dialog").on("hidden.bs.modal", function (e) {
                $(this).removeData("bs.modal");
            });

            $("#new_address_button").click(function() {
                $.ajax({
                    url: "<?php echo $this->baseUrl . '/system/address/save.ajax' ?>",
                    type: 'POST',
                    data: {"customer":$('#customer').val(),"address":$('#address').val(),"zip_code":$('#zip_code').val(),"telephone":$('#telephone').val(),"cell_phone":$('#cell_phone').val(),"contact_person":$('#contact_person').val(),"province_name":$('#province_name').val(),"city_name":$('#city_name').val(),"area_name":$('#area_name').val(),"is_default":0},
                    error: function() { alert("添加收货地址出错!!"); },
                    success: function(msg) {
                        //alert(msg);
                        $(".address-list li").removeClass("selected");
                        $(".address-list").append("<li class='selected'><input type='radio' id='addr_0' name='ship_to1' value='' checked /><label for='addr_0'>" + msg + "</label>");
                        $('#ship_to').val(msg);
                        $("#new_address_dialog").modal("hide");
                    }
                });
            });

            $(".address-list li :radio").click(function() {
                $(this).parent().parent().addClass("selected").siblings().removeClass("selected");
            });


            $("#new_iris_project_dialog").on("show.bs.modal", function (e) {
                loadPage("new_iris_project_content_div", "<?php echo $this->baseUrl . '/trans/iris/add.ajax/'; ?>");
            });

            $("#new_iris_project_dialog").on("hidden.bs.modal", function (e) {
                $(this).removeData("bs.modal");
            });

        });

        function saveAddress() {
            $.ajax({
                type: "post",
                url: "<?php echo $this->baseUrl . '/system/address/save.ajax';?>",
                data: {"customer":$('#customer').val(),"address":$('#address').val(),"zip_code":$('#zip_code').val(),"telephone":$('#telephone').val(),"cell_phone":$('#cell_phone').val(),"contact_person":$('#contact_person').val(),"province_name":$('#province_name').val(),"city_name":$('#city_name').val(),"area_name":$('#area_name').val(),"is_default":0},
                error: function(msg) {alert("Error:" + msg);},
                success: function(msg) {
                    $(".address-list li").removeClass("selected");
                    $(".address-list").append("<li class='selected'><input type='radio' id='addr_0' name='ship_to1' value='' checked /><label for='addr_0'>" + msg + "</label>");
                    $('#ship_to').val(msg);
                    closeDiv('new_address_div');
                }
            });
        }


    </script>


    <div class="row">

        <div class="col-lg-10 col-md-10 col-sm-10 col-xs-9" id="workspace" role="main">

            <div class="row hidden-print">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <ol class="breadcrumb">
                        <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
                        <li class="active">确认购买</li>
                    </ol>
                </div>
            </div>

            <form style="margin: 0 auto;margin-bottom:40px;width: 100%;min-width: 1050px" class="form-horizontal" id="order_confirm_form"
                  name="orderform" method="post"
                  action="order_orderAdd.action">
                <input type="hidden" id="username" name="name" value="name" />
                <%--<input type="hidden" id="freight_fee" name="freight_fee" value="0" />--%>

                <!-- 收货地址 -->
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="well well-sm">
                            <fieldset>
                                <legend style="font-size: 18px">
                                    	收货地址
                                </legend>
                                <div class="form-group">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="address">
                                            <ul class="address-list data-list" style="list-style-type: none">
                                                <li><label><input  style="padding-right: 20px;padding-bottom: 20px" type="radio" checked="checked" name="user_address" value="${user.address }"
                                                                />${user.address }</label></li>
                                                <li><label><input type="radio" name="user_address"
                                                                 /><input name="address" type="text" size="60" placeholder="请填写新地址" style="width: 200px;height: 30px"></label></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </div>

                <!-- 购买明细 -->
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                        <div class="well well-sm table-responsive">
                            <fieldset>
                                <legend style="font-size: 18px">
                                    购买明细
                                    <div class="btn-toolbar pull-right hidden-print">
                                        <div class="btn-group btn-group-sm">
                                            <a class="btn btn-default" role="button" href="car_CarList.action">回到购物车，修改产品</a>
                                        </div>
                                    </div>
                                </legend>
                                <table class="table table-condensed table-hover text-center">
                                    <thead>
                                    <tr>
                                        <th style="width: 200px;text-align: center">产品型号</th>
                                        <th style="width: 150px;text-align: center">产品名称</th>
                                        <th style="width: 100px;text-align: center">销售单价</th>
                                        <th style="width: 100px;text-align: center">采购数量</th>
                                        <th style="width: 100px;text-align: center">金额小计</th>
                                    </tr>
                                    </thead>
                                    <c:forEach items="${sessionScope.shoppingBook }" var="st">
		                                    <tbody>
		                                    <tr>
		                                        <td>${st.bookNo }</td>
		                                        <td>${st.bookName }</td>
		                                        <td>${st.bookPrice }</td>
		                                        <td>${st.bookNum }</td>
		                                        <td>${st.bookNum * st.bookPrice}</td>
		                                     </tr>
		                                    </tbody>
	                                    </c:forEach>
	                                    <tfoot>
	                                    <tr>
	                                        <td colspan="7" class="text-right">
	                                            <p class="form-control-static">
	                                              	  产品合计：<span class="large-bold-red">￥${sessionScope.totalMoney } 元</span>
	                                            </p>
	                                        </td>
	                                    </tr>
	                                    </tfoot>
                                    
                                </table>
                            </fieldset>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div
                            class="col-lg-offset-3 col-md-offset-3 col-sm-offset-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <button type="submit" class="btn btn-lg btn-block btn-primary"
                                id="btn_submit_order" formmethod="get"
                                style="outline: none">提交订单</button>
                    </div>
                </div>
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
