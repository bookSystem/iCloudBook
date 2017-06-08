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
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/yunlogo.ico" type="image/x-icon"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"/>
        <link href="${pageContext.request.contextPath}/css/homeindex.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="../javascript/jquery-1.7.2.js"></script>
        <%--shoppingcart--%>
        <link href="${pageContext.request.contextPath}/css/shoppingcartcss/cart.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/shoppingcartcss/etao.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="../javascript/shoppingcartjs/cart.js"></script>
        <script type="text/javascript" src="../javascript/shoppingcartjs/etao.js"></script>
        <%--shoppingcart end--%>
        <link rel="stylesheet" type="text/css" href="../css/icloudstyle.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/navspace.js"></script>

    </head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<main style="height: auto;min-height: 700px">
    <div class="container">
        <div class="row hidden-print">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="book_findLastBook.action" target="_self">首页</a></li>
                    <li class="active">查看购物车</li>
                </ol>
            </div>
        </div>
        <div class="cart-wrap">
            <form name="shoppingcart" action="${pageContext.request.contextPath}/page/scconfirmation.jsp" method="post">
                <table id="cartTable" class="cart table text-center" style="margin-bottom: 20px">
                    <thead>
                    <tr style="height: 50px">
                        <th class="t-checkbox text-center minheight"><label
                                style="margin-bottom: 9px;padding-left: 2px;width: 20px"><input
                                type="checkbox" class="check-all check"/></label></th>
                        <th class="t-goods text-center minheight" style="width:191px;"><label>产品型号</label></th>
                        <th class="t-remarks text-center minheight" style="width:186px;"><label>产品名称</label></th>
                        <th class="t-selling-price text-center minheight" style="width:147px;"><label>销售单价</label></th>
                        <th class="t-qty text-center minheight" style="width:289px;"><label>采购数量</label></th>
                        <th class="t-subtotal text-center minheight" style="width:148px;"><label>金额小计</label></th>
                        <th class="t-action text-center minheight" style="width:131px;"><label>操作</label></th>
                    </tr>
                    </thead>
                    <tbody style="margin: 0 auto;padding: 0">

					<c:forEach items="${sessionScope.shoppingBook }" var="st">
                    <tr>
                        <td class="t-checkbox text-center minheight">
                        	<label style="padding-top:  10px;padding-left: 0">
                                <input type="checkbox" class="check-one check" name="goodsids"/>
                            </label>
                        </td>
                        <td class="goods text-center" id="goosid">${st.bookNo }</td>
                        <td class="remarks text-center">${st.bookName }</td>
                        <%--<td class="remarks text-center"><input type="text" style="width: 100%;text-align: center"></td>--%>
                        <td class="selling-price number small-bold-red text-center"
                            style="line-height: 40px;padding-left: 20px"
                            id="sellprice" data-bind="76.55">${st.bookPrice }
                        </td>
                        <td style="padding-top: 10px" class="text-center">
                            <div class="input-group input-group-sm" style="width: 100px;margin: 0 auto">
                                <span class="input-group-addon minus" style="cursor: pointer;">-</span>
                                <input type="text" class="number form-control input-sm text-center" value="${st.bookNum }"
                                       name="goodssum"/>
                                <span class="input-group-addon plus" style="cursor: pointer;">+</span>
                            </div>
                        </td>
                        <td class="subtotal number small-bold-red text-center"
                            style="line-height: 40px;padding-left: 30px" id="stotalprice">${st.bookNum*st.bookPrice }</td>
                        <td class="action text-center" style="padding-top: 14px;"><a href="car_CarDelete.action?bookId=${st.bookId }"><span
                                class="delete btn btn-xs btn-warning">删除</span></a></td>
                    </tr>
				</c:forEach>

                    </tbody>
                </table>

                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="cart-summary">
                            <div style="margin-left: 20px;padding-top: 5px" class="pull-right">
                                <%--<a href="scconfirmation.jsp"--%>
                                <%--id="btn_settlement" type="button" class="btn btn-primary">去结算</a>--%>
                                <button id="btn_settlement" type="submit" class="btn btn-primary" >
                                    去结算
                                </button>

                            </div>
                            <div style="margin-left: 1rem; margin-top: 0.4rem;" class="pull-right total">
                                <label>金额合计:<span id="priceTotal" class="price-total large-bold-red">${sessionScope.totalMoney } </span></label>
                            </div>
                            <div style="margin-top: 4px;" class="pull-right">
                                <label>您选择了<span id="itemCount" class="large-bold-red" style="margin: 0 4px;"></span>种产品型号，共计<span
                                        id="qtyCount" class="large-bold-red" style="margin: 0 4px;"></span>件
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

    </div>
</main>
<footer>
    <div align="center" style="margin-top: 20px"><img src="${pageContext.request.contextPath}/img/button1024x65.png"></div>
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
