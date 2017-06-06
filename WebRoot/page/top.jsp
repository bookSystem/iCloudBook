<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
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
<header>
    <%-- <%
    out.print("用户名:"+session.getAttribute("user"));
    out.print("用户名:"+session.getAttribute("seller"));
     %> --%>
    <c:choose>
        <c:when test="${empty sessionScope.user && empty sessionScope.seller }">
            <div class="greyheader">
	        <span id="registericon" style="padding: 0 30px 0 2px;">
	            <a href="${pageContext.request.contextPath}/loginpage.jsp" target="_self">登录注册</a>
	        </span>
            </div>
        </c:when>

        <c:otherwise>
            <div class="greyheader">
	        <span id="shoppingcart" style="padding: 0 30px 0 2px;">
	            <a href="car_CarList.action">购物车</a>
	        </span>
                <span>|</span>
                <span id="myorder">
	            <a href="order_myOrderList.action">我的订单</a>
	        </span>
                <span>|</span>
                <span id="modify">
	            <a href="${pageContext.request.contextPath}/page/modifypwd.jsp" target="_self">修改密码</a>
	        </span>
                <span>|</span>
                <span id="nowusername">
	            <a href="user_exit.action" target="_parent">退出</a>
	        </span>
                <span>|</span>
                <span id="nowusername">
	            <a href="seller_getOrder.action">卖家订单</a>
	        </span>
                <span>|</span>
                <c:if test="${seller!=null }">
		        <span id="nowusername">
		            <a>${seller.name }，你好</a>
		        </span>
                </c:if>
                <c:if test="${user!=null }">
	        	<span id="nowusername">
		            <a>${user.name }，你好</a>
		        </span>
                </c:if>

            </div>
        </c:otherwise>
    </c:choose>


    <nav>
        <div align="center"><img id="logopic" src="${pageContext.request.contextPath}/img/logo300x100.png"></div>
        <div align="center" id="navdiv">
            <ul id="navigation">
                <li><a href="book_findLastBook.action"
                       style="color: #0099cc;border-bottom: 2px solid #0099cc;padding-bottom: 3px;">首页</a></li>
                <li><a href="book_bookListPage.action?currentPage=1&type=literature" target="_self">文艺</a></li>
                <li><a href="book_bookListPage.action?currentPage=1&type=inspiration"
                       style="color: #0099cc;border-bottom: 2px solid #0099cc;padding-bottom: 3px;">励志</a></li>
                <li><a href="book_bookListPage.action?currentPage=1&type=education" target="_self">教育</a></li>
                <li><a href="book_bookListPage.action?currentPage=1&type=technology" target="_self">科技</a></li>
            </ul>
        </div>
    </nav>
</header>