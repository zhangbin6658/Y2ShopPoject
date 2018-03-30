<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>购物车页面</title>

<link
	href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/statics/basic/css/demo.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/statics/css/cartstyle.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/statics/css/optstyle.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/statics/js/jquery.js"></script>
	
<script type="text/javascript"
	src="${pageContext.request.contextPath}/statics/js/jquery-1.7.2.min.js"></script>

</head>
<body>

	<!--顶部导航条 -->
	<%@ include file="top.jsp"%>

	<!--购物车 -->
	<!-- 获取集合长度 -->
  	<c:if test="${fn:length(cartlist)>0}">
   		<form class="theme-signin" name="loginform" action="toSaveOrder.html" method="post">
	<div class="concent">
		<div id="cartTable">
			<div class="cart-table-th">
				<div class="wp">
					<div class="th th-chk">
						<div id="J_SelectAll1" class="select-all J_SelectAll"></div>
					</div>
					<div class="th th-item">
						<div class="td-inner">商品信息</div>
					</div>
					<div class="th th-price">
						<div class="td-inner">单价</div>
					</div>
					<div class="th th-amount">
						<div class="td-inner">数量</div>
					</div>
					<div class="th th-sum">
						<div class="td-inner">金额</div>
					</div>
					<div class="th th-op">
						<div class="td-inner">操作</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>

			<tr class="item-list">
				<div class="bundle  bundle-last ">
					<div class="bundle-hd">
						<!-- <div class="bd-promos">
							<div class="bd-has-promo">
								已享优惠:<span class="bd-has-promo-content">省￥19.50</span>&nbsp;&nbsp;
							</div>
							<div class="act-promo">
								<a href="#" target="_blank">第二支半价，第三支免费<span class="gt">&gt;&gt;</span>
								</a>
							</div>
							<span class="list-change theme-login">编辑</span>
						</div> -->
					</div>
					<div class="clear"></div>
					<div class="bundle-main">
						<c:forEach items="${cartlist}" var="cartlist">
							<ul class="item-content clearfix">
								<li class="td td-chk">
									<div class="cart-checkbox ">
										<%-- <input class="check" id="J_CheckBox_170037950254"
											name="check" value="${cartlist.productId}" type="checkbox">
										<label for="J_CheckBox_170037950254"></label> --%>
									</div>
								</li>
								<input type="hidden" name="productId" value="${cartlist.productId}" />
								<input type="hidden" id="procount" value="${cartlist.cartCount}" />
								<input type="hidden" id="cartid" value="${cartlist.cartId}"/>
								<li class="td td-item">
									<div class="item-pic">
										<a style="display:block; width:78px; height:78px;"
											class="J_MakePoint" data-point="tbcart.8.12"> <img
											style="width:100%; height:auto;"
											src="${pageContext.request.contextPath}/statics/${cartlist.pimage}"
											class="itempic J_ItemImg">
										</a>
									</div>
									<div class="item-info">
										<div class="item-basic-info">
											<a href="#" target="_blank" title="美康粉黛醉美唇膏 持久保湿滋润防水不掉色"
												class="item-title J_MakePoint" data-point="tbcart.8.11">${cartlist.pintr}</a>
										</div>
									</div>
								</li>
								<li class="td td-info">
									<div class="item-props item-props-can" style="border: none;">
										<!-- <span class="sku-line">颜色：12#川南玛瑙</span> <span
											class="sku-line">包装：裸装</span> <span tabindex="0"
											class="btn-edit-sku theme-login">修改</span> <i
											class="theme-login am-icon-sort-desc"></i> -->
									</div>
								</li>
								<li class="td td-price">
									<div class="item-price price-promo-promo">
										<div class="price-content">
											<!-- <div class="price-line">
											<em class="price-original">78.00</em>
										</div> -->
											<div class="price-line">
												<p class="J_Price price-now proprice" tabindex="0">${cartlist.price}</p>
												<%-- <em class="J_Price price-now" tabindex="0">${product.productPrice}</em> --%>
											</div>
										</div>
									</div>
								</li>
								<li class="td td-amount">
									<div class="amount-wrapper ">
										<div class="item-amount ">
											<div class="sl">
												<!-- <input class="min am-btn" name="" type="button" value="-" /> -->
												<%-- <input class="text_box" id="text" readonly="readonly"
													type="text" min="1" value="${cartlist.cartCount}" style="width:30px;" /> --%>
													<%-- <input type="hidden" class="cartCount" id="cartCount" name="cartlist[${i.index}].cartCount"  value="${cartlist.cartCount}" /> --%>
													<span >${cartlist.cartCount}</span>
													 <!-- <input class="add am-btn" name="" type="button" value="+" /> -->
											
											</div>
										</div>
									</div>
								</li>
								<li class="td td-sum">
									<div class="td-inner">
									<%-- 	<input type="hidden" id="price"
											value="${cartlist.productPrice}" /> --%>
										<!-- <em tabindex="0" class="J_ItemSum number">117.00</em> -->
										<%-- <input id="sumPrice" type="text"
											style="border:none; margin-left:30px;" value="${cartlist.orderPrice}"/> --%>
										<p id="sumPrice"   tabindex="0"  class="J_ItemSum number sumprice" >${cartlist.orderPrice}</p>
									</div>
								</li>
								<li class="td td-op">
									<div class="td-inner">
										<!-- <a title="移入收藏夹" class="btn-fav" href="#"> 移入收藏夹</a> --> <a
											href="${pageContext.request.contextPath}/deleteCart?cartid=${cartlist.cartId}" data-point-url="#" class="delete" id="delete"> 删除</a>
									</div>
								</li>
							</ul>
						</c:forEach>
						</div>
				</div>
			</tr>
		</div>
		<div class="clear"></div>

		<div class="float-bar-wrapper">
			<div id="J_SelectAll2" class="select-all J_SelectAll">
				<div class="cart-checkbox">
					<!-- <input class="check-all check" id="J_SelectAllCbx2"
						name="select-all" value="true" type="checkbox"> <label
						for="J_SelectAllCbx2"></label> -->
				</div>
				<!-- <span>全选</span> -->
			</div>
			<div class="operations">
				<!-- <a href="#" hidefocus="true" class="deleteAll">删除</a> <a href="#"
					hidefocus="true" class="J_BatchFav">移入收藏夹</a> -->
			</div>
			<div class="float-bar-right">
				<div class="amount-sum">
					<span class="txt">已选商品</span> <em id="J_SelectedItemsCount" class=" pronum "><%-- <input value="${cartlist.sumCount}"> --%></em><span
						class="txt">件</span>
					<div class="arrow-box">
						<span class="selected-items-arrow"></span> <span class="arrow"></span>
					</div>
				</div>
				<div class="price-sum">
					<span class="txt">合计:</span> <strong class="total">¥<em
						id="J_Total"><%-- <input value="${cartlist.sumPrice}"/> --%></em>
					</strong>
				</div>
				<div class="btn-area">
					<%-- <a
						href="${pageContext.request.contextPath}/toSaveOrder.html"
						id="J_Go" class="submit-btn submit-btn-disabled"
						aria-label="请注意如果没有选择宝贝，将无法结算"> <span>结&nbsp;算</span>
					</a> --%>
					<input type="submit" style="border:none; background-color: #F40; color: #fff; line-height: 48px;" value="结算"/>
				</div>
			</div>

		</div>
	</form>
  </c:if>
	<c:if test="${fn:length(cartlist)<=0}">
		<a style="text-decoration: none;" href="${pageContext.request.contextPath}/index.html"><h3 style="margin: 0 auto;padding-left: 600px;">请先购买商品</h3></a>
	</c:if>
		<div class="footer">
			<%@ include file="bottom.jsp"%>
		</div>

	<!--操作页面-->

	<div class="theme-popover-mask"></div>

	<div class="theme-popover">
		<div class="theme-span"></div>
		<div class="theme-poptit h-title">
			<a href="javascript:;" title="关闭" class="close">×</a>
		</div>
		<div class="theme-popbod dform">
			

				<div class="theme-signin-left">

					<li class="theme-options">
						<div class="cart-title">颜色：</div>
						<ul>
							<li class="sku-line selected">12#川南玛瑙<i></i>
							</li>
							<li class="sku-line">10#蜜橘色+17#樱花粉<i></i>
							</li>
						</ul>
					</li>
					<li class="theme-options">
						<div class="cart-title">包装：</div>
						<ul>
							<li class="sku-line selected">包装：裸装<i></i>
							</li>
							<li class="sku-line">两支手袋装（送彩带）<i></i>
							</li>
						</ul>
					</li>
					<div class="theme-options">
						<div class="cart-title number">数量</div>
						<dd>
							<input class="min am-btn am-btn-default" name="" type="button"
								value="-" /> <input class="text_box" name="" type="text"
								value="1" style="width:30px;" /> <input
								class="add am-btn am-btn-default" name="" type="button"
								value="+" /> <span class="tb-hidden">库存<span
								class="stock">1000</span>件
							</span>
						</dd>

					</div>
					<div class="clear"></div>
					<div class="btn-op">
						<div class="btn am-btn am-btn-warning">确认</div>
						<div class="btn close am-btn am-btn-warning">取消</div>
					</div>

				</div>
				<div class="theme-signin-right">
					<div class="img-info">
						<img
							src="${pageContext.request.contextPath}/statics/images/kouhong.jpg_80x80.jpg" />
					</div>
					<div class="text-info">
						<span class="J_Price price-now">¥39.00</span> <span id="Stock"
							class="tb-hidden">库存<span class="stock">1000</span>件
						</span>
					</div>
				</div>
			
  
		
	<!--引导 -->
	<div class="navCir">
		<li><a href="home2.html"><i class="am-icon-home "></i>首页</a></li>
		<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
		<li class="active"><a href="shopcart.html"><i
				class="am-icon-shopping-basket"></i>购物车</a></li>
		<li><a
			href="${pageContext.request.contextPath}/statics/person/index.html"><i
				class="am-icon-user"></i>我的</a></li>
	</div>
	<script type="text/javascript">
	
		var aAdd = document.querySelectorAll(".item-amount .add");//获取加
        var aReduce = document.querySelectorAll(".item-amount .min");//获取减
        var aSpan = document.querySelectorAll(".item-amount span");
        var length = aSpan.length;    //得到商品长度
        var number = [];    //定义一个数组    把我们的对应商品的数量存储在数组里面
        var aPrice = document.querySelectorAll(".proprice");   //获取单价
        var aCount = document.querySelectorAll(".sumprice");   //获取小计
        var oSelect = document.querySelector(".pronum");   //获取选中商品数目
        var oTotal = document.querySelector(".total");   //获取总价
        	  
        	  var sums = 0;
              var sumt = 0;
              for( var i=0; i< length; i++ ){
                  sums += parseFloat(aSpan[i].innerHTML);
                  sumt += parseFloat(aCount[i].innerHTML);
              }
              oSelect.innerHTML = sums;
              oTotal.innerHTML = sumt;
        
        
        /* for( var i=0; i<length; i++ ){
        	var text=$("#cartCount").val();
            number[i] = text;  //注意：数组里面每个值都是number
            //给加添加点击事件
            aAdd[i].index = i;  //自定义属性存索引值
            aAdd[i].onclick = function () {
          
                number[this.index]++;
                change(this.index);
            };
            //给减添加点击事件
            aReduce[i].index = i;  //自定义属性存索引值
            aReduce[i].onclick = function () {
                
                number[this.index] = number[this.index] === 0 ? 0 : --number[this.index];
                change(this.index);
            }
        }
        //console.log(number);
        //定义一个函数    改变数量    小计  已选中商品   合计费用
        function change(This) {
    		alert(number[This]);
            //改变数量
            // aSpan[This].value=number[This];
            //改变小计
            aCount[This].innerHTML = number[This]*parseFloat(aPrice[This].innerHTML);//小计 = 数量*单价    注意：innerHTML获取到的都是字符串
			
            //改变选中商品个数
          
        } */
		
	</script>
</body>

</html>
