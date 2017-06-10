<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="top.jsp"></jsp:include>
<script>
    $(document).ready(function() {
        flag = $("input[name='hiddenflag']").val();
        $(".nava").each(function(index) {
            $(".nava").removeClass("nav_active");
            $(".nava").eq(Number(flag)).addClass("nav_active");
        });
    });
	$(document).ready(function() {
		flag = $("input[name='hiddenflag']").val();
		$(".nava").each(function(index) {
			$(".nava").removeClass("nav_active");
			$(".nava").eq(Number(flag)).addClass("nav_active");
		});
	});
</script>
<input type="hidden" name="hiddenflag" value="4">
<main>
    <div class="main_container">
        <!-- <div class="navdiv">
            <span style="color: rgba(51,51,51,0.7)">分类：</span>
            <a><span>小说</span></a>
            <a><span>文学</span></a>
            <a><span>传记</span></a>
            <a><span>青春文学</span></a>
        </div> -->
        <div class="bookcatalog">
        
        	<c:forEach items="${bookBean.list }" var="book">
	            <a id="catalog_a11" href="book_BookItem.action?bookId=${book.bookId }">
	                <div id="catalog_div11" class="catalog">
	                    <div class="imgdiv">
	                         <img alt="" src="${pageContext.request.contextPath}/${book.image}">
	                    </div>
	                    <div class="introduce">
	                        <span id="price11" style="font-size: 20px;color: red">¥${book.bookPrice }</span><br>
	                        <span id="bookname11">${book.bookName }</span><br>
	                        <span id="author11">${book.author }</span>
	                    </div>
	                </div>
	            </a>
            </c:forEach>
            
            
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