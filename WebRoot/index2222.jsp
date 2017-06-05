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
    <title>云书商城-正品书店，品类齐全，价格优惠！</title>
    <link rel="shortcut icon" href="img/yunlogo.ico" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css" href="css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css"/>
    <link href="css/homeindex.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="javascript/jquery-1.7.2.js"></script>
    <link rel="stylesheet" type="text/css" href="css/icloudstyle.css"/>
    <script type="text/javascript" src="javascript/navspace.js"></script>

</head>
<body>
<header>
    <div class="greyheader">
     <span id="nowusername">
    	<c:if test="${user!=null }">
				  <a herf="">用户名：${requestScope.user.getName()}</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				  <a href="book_CarList.action" target="right">我的购物车</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				  <a href="order_myOrderList.action" target="right">我的订单</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				  <a href="user/pwd.jsp" target="right">修改密码</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				  <a href="user_exit.action" target="_parent">退出</a>	
		</c:if>
		<c:if test="${seller!=null }">
				  <a href=""> 用户名：${requestScope.seller.getName()}</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				  <a href="order_getOrder.action">订单信息</a></a>&nbsp;&nbsp;|&nbsp;&nbsp;
				  <a href="user/pwd.jsp" target="right">修改密码</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				  <a href="jsps/seller/bookAdd.jsp?sellerId=${requestScope.seller.getId()}" target="right">上传图书</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				  <a href="book_showBook.action?currentPage=1" target="right">我的图书</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				  <a href="user_exit.action" target="_parent">退出</a>	
		</c:if>
		<c:if test="${admin!=null }">
				  <a href=""> 用户名：${requestScope.admin.getName()}</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				  <a href="admin_showUser.action?currentPage=1">查看用户信息</a></a>&nbsp;&nbsp;|&nbsp;&nbsp;
				  <a href="user_exit.action" target="_parent">退出</a>	
		</c:if>
		</span>
		<c:if test="${user==null && seller==null && admin==null}">
        <span id="registericon" style="padding: 0 30px 0 2px;">
            <a href="loginpage.jsp" target="_self">登录注册</a>
        </span>
        </c:if>
    </div>
    <nav>
        <div align="center"><img id="logopic" src="img/logo300x100.png"></div>
        <div id="navdiv">
            <ul id="navigation">
                <li><a style="color: #0099cc;border-bottom: 2px solid #0099cc;padding-bottom: 3px;">首页</a></li>
                <li><a href="literature.jsp" target="_self">文艺</a></li>
                <li><a href="inspiration.jsp" target="_self">励志</a></li>
                <li><a href="education.jsp" target="_self">教育</a></li>
                <li><a href="technology.jsp" target="_self">科技</a></li>
            </ul>
        </div>
    </nav>
</header>
<main>
    <div style="margin: 0 auto;padding: 0;width: 100%;height: auto;min-height: 410px">
        <div class="displaypic">

            <div class="wrap">
                <div class="banner-show" id="js_ban_content">
                    <div class="cell bns-01">
                        <div class="con"><a href=""  class="banner-link"> <i></i></a></div>
                    </div>
                    <div class="cell bns-02" style="display:none;">
                        <div class="con"><a href=""  class="banner-link"> <i></i></a></div>
                    </div>
                    <div class="cell bns-03" style="display:none;">
                        <div class="con"><a href=""  class="banner-link"> <i></i></a></div>
                    </div>
                </div>
                <div class="banner-control" id="js_ban_button_box">
                    <a href="javascript:;" class="left">左</a>
                    <a href="javascript:;" class="right">右</a>
                </div>
                <script type="text/javascript">
                    ;
                    (function () {

                        var defaultInd = 0;
                        var list = $('#js_ban_content').children();
                        var count = 0;
                        var change = function (newInd, callback) {
                            if (count) return;
                            count = 2;
                            $(list[defaultInd]).fadeOut(400, function () {
                                count--;
                                if (count <= 0) {
                                    if (start.timer) window.clearTimeout(start.timer);
                                    callback && callback();
                                }
                            });
                            $(list[newInd]).fadeIn(400, function () {
                                defaultInd = newInd;
                                count--;
                                if (count <= 0) {
                                    if (start.timer) window.clearTimeout(start.timer);
                                    callback && callback();
                                }
                            });
                        }

                        var next = function (callback) {
                            var newInd = defaultInd + 1;
                            if (newInd >= list.length) {
                                newInd = 0;
                            }
                            change(newInd, callback);
                        }

                        var start = function () {
                            if (start.timer) window.clearTimeout(start.timer);
                            start.timer = window.setTimeout(function () {
                                next(function () {
                                    start();
                                });
                            }, 3000);
                        }

                        start();

                        $('#js_ban_button_box').on('click', 'a', function () {
                            var btn = $(this);
                            if (btn.hasClass('right')) {
//next
                                next(function () {
                                    start();
                                });
                            }
                            else {
//prev
                                var newInd = defaultInd - 1;
                                if (newInd < 0) {
                                    newInd = list.length - 1;
                                }
                                change(newInd, function () {
                                    start();
                                });
                            }
                            return false;
                        });

                    })();
                </script>
            </div>


        </div>

    </div>
    <div class="clear"></div>
    <%--topic1 start--%>
    <div class="topic" id="topic1">
        <span class="option">新品首发/</span>
        <span style="float: left;line-height: 37px">每日上新，好品献给你！</span>
        <a><span style="float: right; line-height: 37px">更多新品 ></span></a>
    </div>
    <div class="t1container" align="center" style="height: 255px">
        <a>
            <div class="t1" id="t1_pic1"
                 style="width: 255px;height: 255px;float: left;clear: right;margin-right: 5px"></div>
        </a>
        <a>
            <div class="t1" id="t1_pic2"
                 style="width: 255px;height: 255px;float: left;clear: right;margin: 0 5px"></div>
        </a>
        <a>
            <div class="t1" id="t1_pic3"
                 style="width: 255px;height: 255px;float: left;clear: right;margin: 0 5px"></div>
        </a>
        <a>
            <div class="t1" id="t1_pic4"
                 style="width: 255px;height: 255px;float: left;clear: right;margin-left: 5px"></div>
        </a>
    </div>
    <div style="clear: both"/>
    <%--&lt;%&ndash;topic1 end&ndash;%&gt;--%>


    <%--topic2 start--%>
    <div class="topic" id="topic2">
        <span class="option">人气推荐/</span>
        <span style="float: left;line-height: 37px">畅销全网，好书天天有！</span>
        <%--<span id="top1" style="float: left;line-height: 37px;padding-right: 8px"><a onmousemove="navspace(1)">新书上架</a></span>--%>
        <%--<span id="top2" style="float: left;line-height: 37px;padding-right: 8px"><a onmousemove="navspace(2)">热销周榜</a></span>--%>
        <%--<span id="top3" style="float: left;line-height: 37px"><a onmousemove="navspace(3)">人气总榜</a></span>--%>
        <a><span style="float: right; line-height: 37px">更多推荐 ></span></a>
    </div>
    <div id="t2con1" class="t2container" align="center" style="height: 418px;display: block">
        <a>
            <div class="t2" id="t2_pic11"
                 style="width: 408px;height: 418px;float: left;clear: right;margin-right: 5px"></div>
        </a>
        <div style="width: 637px;height: 418px;float: left">
            <a>
                <div class="t2" id="t2_pic12"
                     style="width: 204px;height: 204px;float: left;clear: right;margin: 0 5px"></div>
            </a>
            <a>
                <div class="t2" id="t2_pic13"
                     style="width: 204px;height: 204px;float: left;clear: right;margin: 0 5px"></div>
            </a>
            <a>
                <div class="t2" id="t2_pic14"
                     style="width: 204px;height: 204px;float: left;clear: right;margin: 0 0 0 5px"></div>
            </a>
            <a>
                <div class="t2" id="t2_pic15"
                     style="width: 204px;height: 204px;float: left;clear: right;margin: 10px 5px 0 5px"></div>
            </a>
            <a>
                <div class="t2" id="t2_pic16"
                     style="width: 204px;height: 204px;float: left;clear: right;margin: 10px 5px 0 5px"></div>
            </a>
            <a>
                <div class="t2" id="t2_pic17"
                     style="width: 204px;height: 204px;float: left;clear: right;margin: 10px 0 0 5px"></div>
            </a>
        </div>
    </div>
    <%--<div id="t2con2" class="t2container" align="center" style="height: 418px;display: none">--%>
        <%--<a>--%>
            <%--<div class="t2" id="t2_pic21"--%>
                 <%--style="width: 408px;height: 418px;float: left;clear: right;margin-right: 5px">222222</div>--%>
        <%--</a>--%>
        <%--<div style="width: 637px;height: 418px;float: left">--%>
            <%--<a>--%>
                <%--<div class="t2" id="t2_pic22"--%>
                     <%--style="width: 204px;height: 204px;float: left;clear: right;margin: 0 5px"></div>--%>
            <%--</a>--%>
            <%--<a>--%>
                <%--<div class="t2" id="t2_pic23"--%>
                     <%--style="width: 204px;height: 204px;float: left;clear: right;margin: 0 5px"></div>--%>
            <%--</a>--%>
            <%--<a>--%>
                <%--<div class="t2" id="t2_pic24"--%>
                     <%--style="width: 204px;height: 204px;float: left;clear: right;margin: 0 0 0 5px"></div>--%>
            <%--</a>--%>
            <%--<a>--%>
                <%--<div class="t2" id="t2_pic25"--%>
                     <%--style="width: 204px;height: 204px;float: left;clear: right;margin: 10px 5px 0 5px"></div>--%>
            <%--</a>--%>
            <%--<a>--%>
                <%--<div class="t2" id="t2_pic26"--%>
                     <%--style="width: 204px;height: 204px;float: left;clear: right;margin: 10px 5px 0 5px"></div>--%>
            <%--</a>--%>
            <%--<a>--%>
                <%--<div class="t2" id="t2_pic27"--%>
                     <%--style="width: 204px;height: 204px;float: left;clear: right;margin: 10px 0 0 5px"></div>--%>
            <%--</a>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div id="t2con3" class="t2container" align="center" style="height: 418px;display: none">--%>
        <%--<a>--%>
            <%--<div class="t2" id="t2_pic31"--%>
                 <%--style="width: 408px;height: 418px;float: left;clear: right;margin-right: 5px">333333</div>--%>
        <%--</a>--%>
        <%--<div style="width: 637px;height: 418px;float: left">--%>
            <%--<a>--%>
                <%--<div class="t2" id="t2_pic32"--%>
                     <%--style="width: 204px;height: 204px;float: left;clear: right;margin: 0 5px"></div>--%>
            <%--</a>--%>
            <%--<a>--%>
                <%--<div class="t2" id="t2_pic33"--%>
                     <%--style="width: 204px;height: 204px;float: left;clear: right;margin: 0 5px"></div>--%>
            <%--</a>--%>
            <%--<a>--%>
                <%--<div class="t2" id="t2_pic34"--%>
                     <%--style="width: 204px;height: 204px;float: left;clear: right;margin: 0 0 0 5px"></div>--%>
            <%--</a>--%>
            <%--<a>--%>
                <%--<div class="t2" id="t2_pic35"--%>
                     <%--style="width: 204px;height: 204px;float: left;clear: right;margin: 10px 5px 0 5px"></div>--%>
            <%--</a>--%>
            <%--<a>--%>
                <%--<div class="t2" id="t2_pic36"--%>
                     <%--style="width: 204px;height: 204px;float: left;clear: right;margin: 10px 5px 0 5px"></div>--%>
            <%--</a>--%>
            <%--<a>--%>
                <%--<div class="t2" id="t2_pic37"--%>
                     <%--style="width: 204px;height: 204px;float: left;clear: right;margin: 10px 0 0 5px"></div>--%>
            <%--</a>--%>
        <%--</div>--%>
    <%--</div>--%>
    <div style="clear: both"/>
    <%--topic2 end--%>


    <%--topic3 start--%>
    <div class="topic" id="topic3">
        <span class="option">今日特价/</span>
        <span style="float: left;line-height: 37px">特价限时抢，省钱还省心！</span>
        <a><span style="float: right; line-height: 37px">更多优惠 ></span></a>
    </div>
    <div class="t3container" align="center">
        <a>
            <div class="t3" id="t3_pic1"
                 style="width: 255px;height: 255px;float: left;clear: right;margin-right: 5px"></div>
        </a>
        <a>
            <div class="t3" id="t3_pic2"
                 style="width: 255px;height: 255px;float: left;clear: right;margin: 0 5px"></div>
        </a>
        <a>
            <div class="t3" id="t3_pic3"
                 style="width: 255px;height: 255px;float: left;clear: right;margin: 0 5px"></div>
        </a>
        <a>
            <div class="t3" id="t3_pic4"
                 style="width: 255px;height: 255px;float: left;clear: right;margin-left: 5px"></div>
        </a>
        <a>
            <div class="t3" id="t3_pic5"
                 style="width: 255px;height: 255px;float: left;clear: right;margin: 10px 5px 0 0"></div>
        </a>
        <a>
            <div class="t3" id="t3_pic6"
                 style="width: 255px;height: 255px;float: left;clear: right;margin: 10px 5px 0 5px"></div>
        </a>
        <a>
            <div class="t3" id="t3_pic7"
                 style="width: 255px;height: 255px;float: left;clear: right;margin: 10px 5px 0 5px"></div>
        </a>
        <a>
            <div class="t3" id="t3_pic8"
                 style="width: 255px;height: 255px;float: left;clear: right;margin: 10px 0 0 5px"></div>
        </a>
    </div>
    <div style="clear: both"/>

    <%--topic3 end--%>

</main>
<footer>
    <div align="center" style="margin-top: 20px"><img src="img/button1024x65.png"></div>
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
