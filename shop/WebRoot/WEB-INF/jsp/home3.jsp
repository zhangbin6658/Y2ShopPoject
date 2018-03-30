<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>首页</title>

<link
	href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css" />

<link
	href="${pageContext.request.contextPath}/statics/basic/css/demo.css"
	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/statics/css/hmstyle.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
<link href="${pageContext.request.contextPath}/statics/css/home3.css"
	rel="stylesheet" type="text/css" />
<style type="text/css">
	.category-list  li:hover{background-color: #fff;}
	.category-list  li:hover a{color:red;}
	.category-list .hrefprolist{display: block;}
</style>
</head>

<body>

	<div class="hmtop">
		<%@ include file="top.jsp"%>
		
		<!--悬浮搜索框-->

				<div class="nav white">
					<div class="logo"><img src="${pageContext.request.contextPath}/statics/images/logo.png" /></div>
					<div class="logoBig">
						<li><img src="${pageContext.request.contextPath}/statics/images/logobig.png" /></li>
					</div>

					<div class="search-bar pr">
						<!-- <a name="index_none_header_sysc" href="#"></a> -->
						<!-- <form>
							<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
							<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
						</form> -->
						<form action="productCategroy.html" method="post">
							<input id="searchInput" name="productName" type="text" placeholder="搜索" autocomplete="off">
							<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
						</form>
					</div>
				</div>

				<div class="clear"></div>
				
	</div>


	<div class="banner" style="width:1200px;margin-left:98px;">
		<!--轮播 -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider
			id="demo-slider-0">
			<ul class="am-slides">
				<li class="banner1"><a href=""><img
						src="${pageContext.request.contextPath}/statics/images/ad1.jpg" /></a></li>
				<li class="banner2"><a><img
						src="${pageContext.request.contextPath}/statics/images/ad2.jpg" /></a></li>
				<li class="banner3"><a><img
						src="${pageContext.request.contextPath}/statics/images/ad3.jpg" /></a></li>
				<li class="banner4"><a><img
						src="${pageContext.request.contextPath}/statics/images/ad4.jpg" /></a></li>

			</ul>
		</div>
		<div class="clear"></div>
	</div>

	<div class="shopNav">
		<div class="slideall">

			<div class="long-title" style="margin-left: 6px;">
				<span class="all-goods">全部分类</span>
			</div>
			<div class="nav-cont">
				<ul>
					<%-- <c:forEach items="${list}" var="one">
								<li class="index"><a href="#">${one.typeName}</a></li>
											
								</c:forEach> --%>
					<!--  <li class="qc"><a href="#">闪购</a></li>
                                <li class="qc"><a href="#">限时抢</a></li>
                                <li class="qc"><a href="#">团购</a></li>
                                <li class="qc last"><a href="#">大包装</a></li> -->
				</ul>
				<div class="nav-extra">
					<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
					<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
				</div>
			</div>

			<!--侧边导航 -->
			<div id="nav" class="navfull">
				<div class="area clearfix">
					<div class="category-content" id="guide_2">
						<div class="category" style="margin-left: 6px;">
							<ul class="category-list" id="js_climit_li">
								<c:forEach items="${list}" var="list">
									<a class="hrefprolist">
										<li class="appliance js_toggle relative first" >
										<div id="div_firstType" class="category-info">
											<!-- 一级类别 -->
											<h3 class="category-name b-category-name">
												<i><img
													src="${pageContext.request.contextPath}/statics/images/cake.png"></i><a
													class="ml-22" title="点心">${list.typeName}</a>
											</h3>
											<input id="text_typeCode" class="typecode" type="text" style="display: none"
												value="${list.typeCode }" /> <em>&gt;</em>

										</div>
										<div class="menu-item menu-in top">
											<div class="area-in">
												<div class="area-bg">
													<div class="menu-srot">
														<div class="sort-side">

															<dl class="dl-sort">
																<%-- <input type="hidden" id="typecode" name="id"
																	value="${list.typeCode}" /> --%>
																<dt>
																	<span title="${list.typeCode}">${list.typeName}</span>
																</dt>
																<c:forEach items="${two}" var="two">
																	<dd>
																		<a title="蒸蛋糕" href="#"><span>${two.typeName}</span></a>
																	</dd>
																</c:forEach>
																<!-- <dd><a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a></dd>
																		<dd><a title="瑞士卷" href="#"><span>瑞士卷</span></a></dd>
																		<dd><a title="软面包" href="#"><span>软面包</span></a></dd>
																		<dd><a title="马卡龙" href="#"><span>马卡龙</span></a></dd>
																		<dd><a title="千层饼" href="#"><span>千层饼</span></a></dd>
																		<dd><a title="甜甜圈" href="#"><span>甜甜圈</span></a></dd>
																		<dd><a title="蒸三明治" href="#"><span>蒸三明治</span></a></dd>
																		<dd><a title="铜锣烧" href="#"><span>铜锣烧</span></a></dd> -->

															</dl>

														</div>
														<!-- <div class="brand-side">
																	<dl class="dl-sort"><dt><span>实力商家</span></dt>
																		<dd><a rel="nofollow" title="呵官方旗舰店" target="_blank" href="#" rel="nofollow"><span  class="red" >呵官方旗舰店</span></a></dd>
																		<dd><a rel="nofollow" title="格瑞旗舰店" target="_blank" href="#" rel="nofollow"><span >格瑞旗舰店</span></a></dd>
																		<dd><a rel="nofollow" title="飞彦大厂直供" target="_blank" href="#" rel="nofollow"><span  class="red" >飞彦大厂直供</span></a></dd>
																		<dd><a rel="nofollow" title="红e·艾菲妮" target="_blank" href="#" rel="nofollow"><span >红e·艾菲妮</span></a></dd>
																		<dd><a rel="nofollow" title="本真旗舰店" target="_blank" href="#" rel="nofollow"><span  class="red" >本真旗舰店</span></a></dd>
																		<dd><a rel="nofollow" title="杭派女装批发网" target="_blank" href="#" rel="nofollow"><span  class="red" >杭派女装批发网</span></a></dd>
																	</dl>
																</div> -->
													</div>
												</div>
											</div>
										</div> <b class="arrow"></b>
									</li>
									</a>
								</c:forEach>
							</ul>
						</div>
					</div>

				</div>
			</div>
			<!--轮播 -->
			<script type="text/javascript">
				(function() {
					$('.am-slider').flexslider();
				});
				$(document).ready(function() {
						$(this).removeClass("hover");
						$(this).children("div.menu-in").css("display", "none");
				});
			</script>


			<!--小导航 -->
			<div class="am-g am-g-fixed smallnav">
				<div class="am-u-sm-3">
					<a href="sort.html"><img
						src="${pageContext.request.contextPath}/statics/images/navsmall.jpg" />
						<div class="title">商品分类</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img
						src="${pageContext.request.contextPath}/statics/images/huismall.jpg" />
						<div class="title">大聚惠</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="${pageContext.request.contextPath}/admin/personal"><img
						src="${pageContext.request.contextPath}/statics/images/mansmall.jpg" />
						<div class="title">个人中心</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img
						src="${pageContext.request.contextPath}/statics/images/moneysmall.jpg" />
						<div class="title">投资理财</div> </a>
				</div>
			</div>

			<!--走马灯 -->

			<%-- <div class="marqueen">
				<span class="marqueen-title">商城头条</span>
				<div class="demo">

					<ul>
						<li class="title-first"><a target="_blank" href="#"> <img
								src="${pageContext.request.contextPath}/statics/images/TJ2.jpg"></img>
								<span>[特惠]</span>商城爆品1分秒
						</a></li>
						<li class="title-first"><a target="_blank" href="#"> <span>[公告]</span>商城与广州市签署战略合作协议
								<img
								src="${pageContext.request.contextPath}/statics/images/TJ.jpg"></img>
								<p>XXXXXXXXXXXXXXXXXX</p>
						</a></li>

						<div class="mod-vip">
							<div class="m-baseinfo">
								<a
									href="${pageContext.request.contextPath}/statics/person/index.html">
									<img
									src="${pageContext.request.contextPath}/statics/images/getAvatar.do.jpg">
								</a> <em> Hi,<span class="s-name">小叮当</span> <a href="#"><p>点击更多优惠活动</p></a>
								</em>
							</div>
							<div class="member-logout">
								<a class="am-btn-warning btn" href="toLogin.html">登录</a> <a
									class="am-btn-warning btn" href="toRegister.html">注册</a>
							</div>
							<div class="member-login">
								<a href="#"><strong>0</strong>待收货</a> <a href="#"><strong>0</strong>待发货</a>
								<a href="#"><strong>0</strong>待付款</a> <a href="#"><strong>0</strong>待评价</a>
							</div>
							<div class="clear"></div>
						</div>

						<li><a target="_blank" href="#"><span>[特惠]</span>洋河年末大促，低至两件五折</a></li>
						<li><a target="_blank" href="#"><span>[公告]</span>华北、华中部分地区配送延迟</a></li>
						<li><a target="_blank" href="#"><span>[特惠]</span>家电狂欢千亿礼券
								买1送1！</a></li>

					</ul>
					<div class="advTip">
						<img
							src="${pageContext.request.contextPath}/statics/images/advTip.jpg" />
					</div>
				</div>
			</div>
			<div class="clear"></div> --%>
		</div>
		<script type="text/javascript">
			if ($(window).width() < 640) {
				function autoScroll(obj) {
					$(obj).find("ul").animate({
						marginTop : "-39px"
					}, 500, function() {
						$(this).css({
							marginTop : "0px"
						}).find("li:first").appendTo(this);
					})
				}
				$(function() {
					setInterval('autoScroll(".demo")', 3000);
				})
			}
		</script>
	</div>
	<div class="shopMainbg">
		<div class="shopMain" id="shopmain">

			<!--今日推荐 -->

			<%-- <div class="am-g am-g-fixed recommendation">
						<div class="clock am-u-sm-3" ">
							<img src="${pageContext.request.contextPath}/statics/images/2016.png "></img>
							<p>今日<br>推荐</p>
						</div>
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="info ">
								<h3>真的有鱼</h3>
								<h4>开年福利篇</h4>
							</div>
							<div class="recommendationMain ">
								<img src="${pageContext.request.contextPath}/statics/images/tj.png "></img>
							</div>
						</div>						
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="info ">
								<h3>囤货过冬</h3>
								<h4>让爱早回家</h4>
							</div>
							<div class="recommendationMain ">
								<img src="${pageContext.request.contextPath}/statics/images/tj1.png "></img>
							</div>
						</div>
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="info ">
								<h3>浪漫情人节</h3>
								<h4>甜甜蜜蜜</h4>
							</div>
							<div class="recommendationMain ">
								<img src="${pageContext.request.contextPath}/statics/images/tj2.png "></img>
							</div>
						</div>

					</div> --%>
			
			<!--热门活动 -->


			<div class="clear "></div>
			<div class="am-container activity ">
				<div class="shopTitle ">
					<h4>活动</h4>
					<h3>每期活动 优惠享不停</h3>
					<span class="more "> <a class="more-link " href="# ">全部活动</a>
					</span>
				</div>

				<div class="am-g am-g-fixed ">
					<div class="am-u-sm-3 ">
						<div class="icon-sale one "></div>
						<h4>秒杀</h4>
						<div class="activityMain ">
							<img
								src="${pageContext.request.contextPath}/statics/images/activity1.jpg "></img>
						</div>
						<div class="info ">
							<h3>春节送礼优选</h3>
						</div>
					</div>

					<div class="am-u-sm-3 ">
						<div class="icon-sale two "></div>
						<h4>特惠</h4>
						<div class="activityMain ">
							<img
								src="${pageContext.request.contextPath}/statics/images/activity2.jpg "></img>
						</div>
						<div class="info ">
							<h3>春节送礼优选</h3>
						</div>
					</div>

					<div class="am-u-sm-3 ">
						<div class="icon-sale three "></div>
						<h4>团购</h4>
						<div class="activityMain ">
							<img
								src="${pageContext.request.contextPath}/statics/images/activity3.jpg "></img>
						</div>
						<div class="info ">
							<h3>春节送礼优选</h3>
						</div>
					</div>

					<div class="am-u-sm-3 last ">
						<div class="icon-sale "></div>
						<h4>超值</h4>
						<div class="activityMain ">
							<img
								src="${pageContext.request.contextPath}/statics/images/activity.jpg "></img>
						</div>
						<div class="info ">
							<h3>春节送礼优选</h3>
						</div>
					</div>

				</div>
			</div>
			<div class="clear "></div>
			<!-- 最热商品 start -->
			<div class="hot-shop">
				<h3 class="shop-classify">最热商品</h3>
				<div class="shop-content clearFix">
					<ul class="clearFix">
						<c:forEach items="${pSail}" var="product">
						<input type="hidden" name="id" value="${product.productId}"/>
						<li>
						<div class="shop-center">
						<a class="shop-img" href="toProductShow?id=${product.productId}"><img alt="" src="${pageContext.request.contextPath}/statics/${product.productImage}"></a>
						<p class="shop-title">${product.productTitle}</p>
						<span></span>
						</div>
						</li>
					</ul>
				</c:forEach>
				</div>
			</div>
			<div class="clear "></div>
			<!-- 最热商品 end -->
			<!-- 最新商品 start -->
			<div class="new-shop">
				<h3 class="shop-classify">最新商品</h3>
				<div class="shop-content clearFix">
					<ul class="clearFix">
						<c:forEach items="${pDate}" var="product">
						<input type="hidden" name="id" value="${product.productId}"/>
						<li>
						<div class="shop-center">
						<a class="shop-img" href="toProductShow?id=${product.productId}"><img alt="" src="${pageContext.request.contextPath}/statics/${product.productImage}"></a>
						<p class="shop-title">${product.productTitle}</p>
						<span></span>
						</div>
						</li>
					</ul>
				</c:forEach>
				</div>
			</div>
			<div class="clear "></div>
			<!-- 最新商品 end -->

			<%-- <div class="am-container activity ">
						<div class="shopTitle" style="background: red">
							<h4 style="text-indent: 14px;">热门商品</h4>
							<!-- <h3>每期活动 优惠享不停 </h3>
							<span class="more ">
                              <a class="more-link " href="# ">全部活动</a>
                            </span> -->
						</div>
					
					  <div class="am-g am-g-fixed " >
					  <c:forEach items="${pSail}" var="product">
					  <input type="hidden" name="id" value="${product.productId}"/>
						<div class="am-u-sm-3 " style="border:1px solid; border-color: rgba(100,100,100,0.05)">
							<div class="icon-sale one "></div>	
								<h4>${product.productTitle}</h4>							
							<div class="activityMain ">
								<a href="toProductShow?id=${product.productId}"><img src="" width="10px" ></img></a>
								<h3>${product.productTitle}</h3>
							</div>
							<div class="info" style="background-color:rgba(255,255,255,0.1)">
								<h3>${product.productTitle}</h3>
							</div>														
						</div>
						</c:forEach>
						  </div>
                   </div> --%>

			<%--  <div class="am-container activity ">
						<div class="shopTitle " style="background: skyblue">
							<h4 style="text-indent: 14px;">最新商品</h4>
							<!-- <h3>每期活动 优惠享不停 </h3>
							<span class="more ">
                              <a class="more-link " href="# ">全部活动</a>
                            </span> -->
						</div>
					
					  <div class="am-g am-g-fixed " >
					  <c:forEach items="${pDate}" var="product">
					  <input type="hidden" name="id" value="${product.productId}"/>
						<div class="am-u-sm-3 " style="border:1px solid; border-color: rgba(100,100,100,0.05)">
							<div class="icon-sale one "></div>	
								<h4>${product.productTitle}</h4>							
							<div class="activityMain ">
							<a href="toProductShow?id=${product.productId}"><img src="${pageContext.request.contextPath}/statics/${product.productImage}"></img></a>
							<h3>${product.productTitle}</h3>
							</div>
							<div class="info" style="background-color:rgba(255,255,255,0.1)">
								
							</div>														
						</div>
						</c:forEach>
						  </div>
                   </div> --%>
			<%-- 	<div class="am-u-sm-3 ">
						  <div class="icon-sale two "></div>	
							<h4>特惠</h4>
							<div class="activityMain ">
								<img src="${pageContext.request.contextPath}/statics/images/activity2.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>								
							</div>							
						</div>						
						
						<div class="am-u-sm-3 ">
							<div class="icon-sale three "></div>
							<h4>团购</h4>
							<div class="activityMain ">
								<img src="${pageContext.request.contextPath}/statics/images/activity3.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>							
						</div>						

						<div class="am-u-sm-3 last ">
							<div class="icon-sale "></div>
							<h4>超值</h4>
							<div class="activityMain ">
								<img src="${pageContext.request.contextPath}/statics/images/activity.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>													
						</div> --%>


			<!--甜点 start-->


			<%-- <div class="am-container ">
						<div class="shopTitle ">
							<h4>${product.typename}</h4>
							<h3>每一道甜品都有一个故事</h3>
							<div class="today-brands ">
								<a href="# ">桂花糕</a>
								<a href="# ">奶皮酥</a>
								<a href="# ">栗子糕 </a>
								<a href="# ">马卡龙</a>
								<a href="# ">铜锣烧</a>
								<a href="# ">豌豆黄</a>
							</div>
							<span class="more ">
                    <a class="more-link " href="# ">更多美味</a>
                        </span>
						</div>
					</div> --%>


			<div class="footer ">
				<%@ include file="bottom.jsp"%>
			</div>
		</div>
	</div>
	</div>
	</div>
	<!--引导 -->

	<div class="navCir">
		<li class="active"><a href="home3.html"><i
				class="am-icon-home "></i>首页</a></li>
		<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
		<li><a href="shopcart.html"><i
				class="am-icon-shopping-basket"></i>购物车</a></li>
		<li><a
			href="${pageContext.request.contextPath}/statics/person/index.html"><i
				class="am-icon-user"></i>我的</a></li>
	</div>
	<!--菜单 -->
	<div class=tip>
		<div id="sidebar">
			<div id="wrap">
				<div id="prof" class="item ">
					<a href="# "> <span class="setting "></span>
					</a>
					<div class="ibar_login_box status_login ">
						<div class="avatar_box ">
							<p class="avatar_imgbox ">
								<img
									src="${pageContext.request.contextPath}/statics/images/no-img_mid_.jpg " />
							</p>
							<ul class="user_info ">
								<li>用户名：sl1903</li>
								<li>级&nbsp;别：普通会员</li>
							</ul>
						</div>
						<div class="login_btnbox ">
							<a href="# " class="login_order ">我的订单</a> <a href="# "
								class="login_favorite ">我的收藏</a>
						</div>
						<i class="icon_arrow_white "></i>
					</div>

				</div>
				<div id="shopCart " class="item ">
					<a href="# "> <span class="message "></span>
					</a>
					<p>购物车</p>
					<p class="cart_num ">0</p>
				</div>
				<div id="asset " class="item ">
					<a href="# "> <span class="view "></span>
					</a>
					<div class="mp_tooltip ">
						我的资产 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="foot " class="item ">
					<a href="# "> <span class="zuji "></span>
					</a>
					<div class="mp_tooltip ">
						我的足迹 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="brand " class="item ">
					<a href="#"> <span class="wdsc "><img
							src="${pageContext.request.contextPath}/statics/images/wdsc.png " /></span>
					</a>
					<div class="mp_tooltip ">
						我的收藏 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="broadcast " class="item ">
					<a href="# "> <span class="chongzhi "><img
							src="${pageContext.request.contextPath}/statics/images/chongzhi.png " /></span>
					</a>
					<div class="mp_tooltip ">
						我要充值 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div class="quick_toggle ">
					<li class="qtitem "><a href="# "><span class="kfzx "></span></a>
						<div class="mp_tooltip ">
							客服中心<i class="icon_arrow_right_black "></i>
						</div></li>
					<!--二维码 -->
					<li class="qtitem "><a href="#none "><span
							class="mpbtn_qrcode "></span></a>
						<div class="mp_qrcode " style="display:none; ">
							<img
								src="${pageContext.request.contextPath}/statics/images/weixin_code_145.png " /><i
								class="icon_arrow_white "></i>
						</div></li>
					<li class="qtitem "><a href="#top " class="return_top "><span
							class="top "></span></a></li>
				</div>

				<!--回到顶部 -->
				<div id="quick_links_pop " class="quick_links_pop hide "></div>

			</div>

		</div>
		<div id="prof-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>我</div>
		</div>
		<div id="shopCart-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>购物车</div>
		</div>
		<div id="asset-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>资产</div>

			<div class="ia-head-list ">
				<a href="# " target="_blank " class="pl ">
					<div class="num ">0</div>
					<div class="text ">优惠券</div>
				</a> <a href="# " target="_blank " class="pl ">
					<div class="num ">0</div>
					<div class="text ">红包</div>
				</a> <a href="# " target="_blank " class="pl money ">
					<div class="num ">￥0</div>
					<div class="text ">余额</div>
				</a>
			</div>

		</div>
		<div id="foot-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>足迹</div>
		</div>
		<div id="brand-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>收藏</div>
		</div>
		<div id="broadcast-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>充值</div>
		</div>
	</div>
	<script type="text/javascript">
		var list=document.querySelectorAll(".category-list li");
		var length=list.length;
		var array=[];
		for (var i = 0; i < length; i++) {
			array[i]=list[i];
		}
		var typecode= document.querySelectorAll(".typecode");
		for (var j = 0; j < length; j++) {
			(function(j){
				array[j].onclick=function(){
				window.location.href="${pageContext.request.contextPath}/productCategroy.html";
				/* ?procategroy1='"+typecode[j].value+"' */
			}
			})(j);
		}
	</script>
	<script>
		window.jQuery
				|| document
						.write('<script src="basic/js/jquery.min.js "><\/script>');
	</script>
	<script type="text/javascript "
		src="${pageContext.request.contextPath}/statics/basic/js/quick_links.js "></script>
</body>

</html>