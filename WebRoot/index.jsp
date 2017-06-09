
<% 
		  if(request.getAttribute("T_flag")==null) 
		  { 
		  	response.sendRedirect("book_findLastBook.action"); 
		  } 
%> 
<main>
    <div style="margin: 0 auto;padding: 0;width: 100%;height: auto;min-height: 410px">
        <div class="displaypic">

            <div class="wrap">
                <div class="banner-show" id="js_ban_content">
                    <div class="cell bns-01">
                        <div class="con"><a href="" class="banner-link"> <i></i></a></div>
                    </div>
                    <div class="cell bns-02" style="display:none;">
                        <div class="con"><a href="" class="banner-link"> <i></i></a></div>
                    </div>
                    <div class="cell bns-03" style="display:none;">
                        <div class="con"><a href="" class="banner-link"> <i></i></a></div>
                    </div>
                </div>
                <div class="banner-control" id="js_ban_button_box">
                    <a href="javascript:;" class="left">左</a>
                    <a href="javascript:;" class="right">右</a>
                </div>
                <script type="text/javascript">

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
        <%--<a><span style="float: right; line-height: 37px">更多新品 ></span></a>--%>
    </div>
    <div class="clear"></div>
    <div class="t1container" align="center" style="height: 255px">
    
    <c:forEach items="${bookList}" var="book" varStatus="status" begin="0" end="3">
    	<c:if test="${(status.index+1)%4!=0 }">
	        <a href="book_BookItem.action?bookId=${book.bookId }">
	            <div class="t t1">
	                <div class="t1img">
	                    <img alt="" src="${pageContext.request.contextPath}/${book.image}">
	                </div>
	                <div class="intro">
	                    <div class="row" style="font-weight: bold;color: #333333">${book.bookName }</div>
	                    <div class="row" style="color: red">¥${book.bookPrice }元</div>
	                </div>
	            </div>
	        </a>
        </c:if>
        <c:if test="${(status.index+1)%4==0 }">
        	<a href="book_BookItem.action?bookId=${book.bookId }">
            <div class="t t1" style="margin: 0 0 10px 0">
                <div class="t1img">
                    <img alt="" src="${pageContext.request.contextPath}/${book.image}">
                </div>
                <div class="intro">
                    <div class="row" style="font-weight: bold;color: #333333">${book.bookName }</div>
                    <div class="row" style="color: red">¥${book.bookPrice }元</div>
                </div>
            </div>
       		 </a>
        </c:if>
   </c:forEach>
        
      
    </div>
    <div class="clear"></div>

    <%--topic1 end--%>

    <%--topic2 start--%>
    <div class="topic" id="topic2">
        <span class="option">人气推荐/</span>
        <span style="float: left;line-height: 37px">畅销全网，好书天天有！</span>
        <%--<a><span style="float: right; line-height: 37px">更多推荐 ></span></a>--%>
    </div>
    <div class="clear"></div>
    <div class="t2container" align="center" style="height: 418px">
    	<c:forEach items="${minNumBook }" var="minNumBook" varStatus="status" begin="0" end="1">
	        <a href="book_BookItem.action?bookId=${minNumBook.bookId }">
	            <div class="t" style="width: 408px;height: 418px;float: left;clear: right;">
	                <div style="width: 408px;height: 368px;padding: 10px 0;overflow: hidden">
	                    <img alt="" src="${pageContext.request.contextPath}/${minNumBook.image}">
	                </div>
	                <div class="intro">
	                    <div class="row" style="font-weight: bold;color: #333333">${minNumBook.bookName}</div>
	                    <div class="row" style="color: red">¥${minNumBook.bookPrice}元</div>
	                </div>
	            </div>
	        </a>
       </c:forEach>
       
       
        <div style="width: 642px;height: 418px;float: left">
        	<c:forEach items="${NumBookList }" var="NumBookList" varStatus="status" begin="1" end="6">
        		
	            <a href="book_BookItem.action?bookId=${NumBookList.bookId }">
	                <div class="t t2">
	                    <div class="t2img">
	                       <img src="${pageContext.request.contextPath}/${NumBookList.image}">
	                    </div>
	                    <div class="intro">
	                        <div class="row" style="font-weight: bold;color: #333333">${NumBookList.bookName }</div>
	                        <div class="row" style="color: red">¥${NumBookList.bookPrice }元</div>
	                    </div>
	                </div>
	            </a>
	            
            </c:forEach>
          
        </div>
    </div>
    <div class="clear"></div>
    <%--topic2 end--%>


    <%--topic3 start--%>
    
    <div class="topic" id="topic3">
        <span class="option">今日特价/</span>
        <span style="float: left;line-height: 37px">特价限时抢，省钱还省心！</span>
        <%--<a><span style="float: right; line-height: 37px">更多优惠 ></span></a>--%>
    </div>
    <div class="clear"></div>
    <div class="t3container" align="center">
    	<c:forEach items="${discountBook }" var="list" varStatus="status" begin="0" end="7">
    		<c:if test="${(status.index+1)%4!=0 }">
		        <a href="book_BookItem.action?bookId=${list.bookId }">
		            <div class="t t3">
		                <div class="t3img">
		                    <img alt="" src="${pageContext.request.contextPath}/${list.image}">
		                </div>
		                <div class="intro">
		                    <div class="row" style="font-weight: bold;color: #333333">${list.bookName}</div>
		                    <div class="row" style="color: red">¥${list.bookPrice }元</div>
		                </div>
		            </div>
		        </a>
	        </c:if>
	        <c:if test="${(status.index+1)%4==0 }">
	        	<a href="book_BookItem.action?bookId=${list.bookId }">
		            <div class="t t3" style="margin: 0 0 10px 0">
		                <div class="t3img">
		                    <img alt="" src="${pageContext.request.contextPath}/${list.image}">
		                </div>
		                <div class="intro">
		                    <div class="row" style="font-weight: bold;color: #333333">${list.bookName}</div>
		                    <div class="row" style="color: red">¥${list.bookPrice }元</div>
		                </div>
		           	</div>
        		</a>
	        </c:if>
	        
       </c:forEach>
       
       
    </div>
    <div class="clear"></div>

    <%--topic3 end--%>

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
