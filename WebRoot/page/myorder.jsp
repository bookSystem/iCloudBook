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
<body>
<jsp:include page="top.jsp"></jsp:include>
<div class="container" style="height:auto;min-height: 600px">


    <div class="row">

        <div class="col-lg-10 col-md-10 col-sm-10 col-xs-9" id="workspace" role="main">

            <div class="row hidden-print">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <ol class="breadcrumb">
                        <li class="active">我的订单</li>
                    </ol>
                </div>
            </div>

            <!-- 订单明细开始 -->
            <c:if test="${!empty user }">
            <c:forEach items="${myOrderList }" var="order">
            
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 " style="width: 100%;min-width: 1050px;margin: 0 auto;">
                <span style="margin-top: 20px">订单号：${order.orderNumber}</span>
                <c:choose>
					<c:when test="${order.isDeal eq 0}"><span style="float: right">订单发货状态:<a>等待付款</a></span></c:when>
					<%-- <c:when test="${order.isDeal eq 1}"><span style="float: right">订单发货状态:已发货</span></c:when> --%>
					<c:when test="${order.isDeal eq 1}"><span style="float: right">订单发货状态:<a href="order_firmOrder.action?orderId=${order.orderId }">确认收货</a></span></c:when>
					<c:when test="${order.isDeal eq 2}"><span style="float: right">订单发货状态:交易成功</span></c:when>
					<c:when test="${order.isDeal eq 3}"><span style="float: right">订单发货状态:已取消</span></c:when>
				</c:choose>	
                
                <table class="table table-condensed table-hover text-center"
                       style="margin: 0 auto;margin-top:5px;margin-bottom:20px;">
                    <thead>
                    <tr>
                        <th style="width: 50px;text-align: center">序号</th>
                        <th style="width: 200px;text-align: center">产品型号</th>
                        <th style="width: 150px;text-align: center">销售单价</th>
                        <th style="width: 150px;text-align: center">采购数量</th>
                        <th style="width: 150px;text-align: center">金额小计</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${order.setOrderItems }" var="item" varStatus="status">
                    
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${item.book.bookNo }</td>
                        <td>${item.book.bookPrice }元</td>
                        <td>${item.quantity }</td>
                        <td>${item.quantity*item.book.bookPrice }</td>
                    </tr>
                    </c:forEach>
                   
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="7" class="text-right">
                            <p class="form-control-static">
                                产品合计：<span class="large-bold-red">￥${order.total } 元</span>
                            </p>
                        </td>
                    </tr>
                    </tfoot>
                </table>
            </div>
            
          </c:forEach>
          </c:if>
            <!-- 订单明细结束 -->
            
            
 		<!-- 卖家订单明细开始 -->
 		
	<c:if test="${!empty seller }">	
	  
	   <c:forEach items="${list}" var="sellerOrder" step="1">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 " style="width: 100%;min-width: 1050px;margin: 0 auto;">
               
                <span style="margin-top: 20px">订单号：${sellerOrder.orderNumber }</span>
               <span style="margin-top: 20px">订单用户：${sellerOrder.user.name }</span>
                <span style="float: right">
                	<c:choose>
					<c:when test="${sellerOrder.isDeal eq 0}"><a href="seller_dealOrder.action?orderId=${sellerOrder.orderId }">等待发货</a></c:when>
					<c:when test="${sellerOrder.isDeal eq 1}">等待确认</c:when>
					<c:when test="${sellerOrder.isDeal eq 2}">交易成功</c:when>
					<c:when test="${sellerOrder.isDeal eq 3}">已取消</c:when>
				</c:choose>	
                </span>
                <table class="table table-condensed table-hover text-center"
                       style="margin: 0 auto;margin-top:5px;margin-bottom:20px;">
                    <thead>
                    <tr>
                        <th style="width: 50px;text-align: center">序号</th>
                        <th style="width: 200px;text-align: center">产品型号</th>
                        <th style="width: 150px;text-align: center">销售单价</th>
                        <th style="width: 150px;text-align: center">采购数量</th>
                        <th style="width: 150px;text-align: center">金额小计</th>
                        
                        <!-- <th style="width: 150px;text-align: center">处理订单</th> -->
                    </tr>
                    </thead>
                   <%--  <tbody>
                    
                        <c:if test="${sellerOrder.isDeal eq 0}">
							<td><a href="order_dealOrder.action">发货</a></td>
						</c:if>
						<c:if test="${sellerOrder.isDeal eq 1}">
							<td bgcolor="gray">完成发货</td>
						</c:if>
                    </tr>
                    
                    </tbody> --%>
                  
                    <tbody>
                    <c:forEach items="${sellerOrder.setOrderItems }" var="item" varStatus="status">
                    
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${item.book.bookNo }</td>
                        <td>${item.book.bookPrice }元</td>
                        <td>${item.quantity }</td>
                        <td>${item.quantity*item.book.bookPrice }</td>
                    </tr>
                    </c:forEach>
                   
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="7" class="text-right">
                            <p class="form-control-static">
                                产品合计：<span class="large-bold-red">￥${sellerOrder.total } 元</span>
                            </p>
                        </td>
                    </tr>
                    </tfoot>
                   
                </table>
            </div>
            </c:forEach>
            </c:if>
            <!-- 订单明细结束 -->		




            
        </div>
    </div>
</div>
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
