<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>订单管理</title>

<link
	href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath}/statics/css/personal.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/statics/css/orstyle.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/statics/css/zeroModal.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/zeroModal.min.js"></script>

<style type="text/css">
.clearFix::after{content:'';display:block;clear:both;}
.page  li{float:left;padding:0 20px; background-color: skyblue;}
</style>
</head>

<body>
	<!--头 -->
	<header>
		<article>
			<div class="mt-logo">
				<!--顶部导航条 -->
				<%@ include file="top.jsp"%>
			</div>
			</div>
		</article>
	</header>
	<div class="nav-table">
		<div class="long-title">
			<span class="all-goods">全部分类</span>
		</div>
		<div class="nav-cont">
			<ul>
				<li class="index"><a href="#">首页</a>
				</li>
				<li class="qc"><a href="#">闪购</a>
				</li>
				<li class="qc"><a href="#">限时抢</a>
				</li>
				<li class="qc"><a href="#">团购</a>
				</li>
				<li class="qc last"><a href="#">大包装</a>
				</li>
			</ul>
			<div class="nav-extra">
				<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利 <i
					class="am-icon-angle-right" style="padding-left: 10px;"></i>
			</div>
		</div>
	</div>
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-order">

					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small>
						</div>
					</div>
					<hr />

					<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

						<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
							<!-- <li class="am-active"><a href="javascript:void(0)" onclick="document.getElementById('tab1').scrollIntoView();">所有订单</a></li>
								<li><a href="javascript:void(0)" onclick="document.getElementById('tab2').scrollIntoView();">待付款</a></li>
								<li><a href="javascript:void(0)" onclick="document.getElementById('tab3').scrollIntoView();">待发货</a></li>
								<li><a href="javascript:void(0)" onclick="document.getElementById('tab4').scrollIntoView();">待收货</a></li>
								<li><a href="javascript:void(0)" onclick="document.getElementById('tab5').scrollIntoView();">待评价</a></li>-->

							<li id="list" class="am-active "><a href="#tab1">所有订单</a>
							</li>
							<li class="message"><a href="#tab2">待付款</a>
							</li>
							<li class="message"><a href="#tab3">待发货</a>
							</li>
							<li class="message"><a href="#tab4">待收货</a>
							</li>
							<li class="message"><a href="#tab5">待评价</a>
							</li>

						</ul>
						<div class="am-tabs-bd">
							<!-- 所有订单 -->
							<div class="am-tab-panel am-fade am-in am-active" id="tab1">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<!-- 所有订单 -->
									<div class="order-list">
										<c:set var="counts" scope="session" value="1"></c:set>
										<!-- 单个订单 -->
										<c:if test="${orderItems !=null}">
											<%-- ${orderItems} --%>
											<!--交易成功-->
											<c:forEach var="orderItems" items="${orderItems}">
												<div class="order-status5">
													<div class="order-title">
														<div class="dd-num">
															订单编号：<a href="javascript:void(0);">${orderItems.orderCode}</a>
														</div>
														<c:if test="${orderItems.orderDate !=null}">
															<span>下单时间：<fmt:formatDate
																	value="${orderItems.orderDate}" type="both" />&nbsp&nbsp&nbsp
															</span>
														</c:if>
														<c:if test="${orderItems.orderSuccessDate !=null}">
															<span>成交时间：<fmt:formatDate
																	value="${orderItems.orderSuccessDate}" type="both" />
															</span>
														</c:if>
														<!--    <em>店铺：小桔灯</em>-->
													</div>

													<div class="order-content">
														<div class="order-left">
															<!-- 订单里的商品 -->
															<c:forEach var="order" items="${orderItems.list}">
																<ul class="item-list item">
																	<li class="td td-item">
																		<div class="item-pic">
																			<a href="#" class="J_MakePoint"> <img
																				src="${pageContext.request.contextPath}/statics/${order.productImage}"
																				class="itempic J_ItemImg"> </a>
																		</div>
																		<div class="item-info">
																			<div class="item-basic-info">
																				<a href="#">
																					<p>${order.productName},${order.productTitle}</p>
																					<p class="info-little">
																						颜色：12#川南玛瑙 <br />包装：裸装
																					</p> </a>
																			</div>
																		</div></li>
																	<li class="td td-price">
																		<div class="item-price">${order.productPrice}</div></li>
																	<li class="td td-number">
																		<div class="item-number">
																			<span>×</span>${order.orderCount}
																		</div></li>
																	<li class="td td-operation">
																		<div class="item-operation"></div></li>
																</ul>
															</c:forEach>
														</div>
														<div class="order-right">
															<li class="td td-amount">
																<div class="item-amount">
																	合计：${orderItems.orderMoney}
																	<!-- <p>含运费：<span>10.00</span></p> -->
																</div></li>
															<div class="move-right">
																<li class="td td-status">
																	<div class="item-status">

																		<p class="Mystatus">${orderItems.typeName}</p>
																		<p class="order-info">
																			<!-- <a href="orderinfo.html">订单详情</a> -->
																		</p>
																		<c:if test="${orderItems.typeName!='待付款' and orderItems.typeName!='待发货'}">
																		<p class="order-info">
																		<%-- <a onclick="showLogistic('#orderCode${counts}')">查看物流</a> --%>
																		<a href="${pageContext.request.contextPath}/order/toLogistic.html?code=${orderItems.orderCode}">查看物流</a>
																		</p>
																		<input id="orderCode${counts}" type="text" style="display: none" value="${orderItems.orderCode}" />
																		
																		</c:if>
																	</div></li>

																<li class="td td-change"><c:if
																		test="${orderItems.typeName=='待付款'}">
																		<form action="#" method="post">
																			<input name="orderCode" type="text"
																				style="display: none;"
																				value="${orderItems.orderCode}" /> <input
																				name="reqType" type="text" style="display: none;"
																				value="" /> <!-- <input type="submit"
																				class="am-btn am-btn-danger anniu" value="一键付款" /> -->
																		</form>
																	</c:if> <c:if
																		test="${orderItems.typeName=='待发货'}">
																		<%-- <form action="#" method="post">
																			<input name="orderCode" type="text"
																				style="display: none;"
																				value="${orderItems.orderCode}" /> <input
																				name="reqType" type="text" style="display: none;"
																				value="" /> <input type="submit"
																				class="am-btn am-btn-danger anniu" value="提醒发货" />
																		</form> --%>
																	</c:if> <c:if
																		test="${orderItems.typeName=='待收货'}">
																		<form action="updateOrder.html" method="post">
																			<input name="orderCode" type="text"
																				style="display: none;"
																				value="${orderItems.orderCode}" /> <input
																				name="reqType" type="text" style="display: none;"
																				value="sure" /> <input type="submit"
																				class="am-btn am-btn-danger anniu" value="确认收货" />
																		</form>
																	</c:if> <c:if
																		test="${orderItems.typeName=='待评价'}">
																		<form action="toCommentList.html" method="post">
																			<input name="orderCode" type="text"
																				style="display: none;"
																				value="${orderItems.orderCode}" /> <input
																				name="reqType" type="text" style="display: none;"
																				value="" /> <input type="submit"
																				class="am-btn am-btn-danger anniu" value="评论订单" />
																		</form>
																	</c:if> <c:if
																		test="${orderItems.typeName=='交易成功'}">
																		<form action="updateOrder.html" method="post">
																			<input name="orderCode" type="text"
																				style="display: none;"
																				value="${orderItems.orderCode}" /> <input
																				name="reqType" type="text" style="display: none;"
																				value="del" /> <input type="submit"
																				class="am-btn am-btn-danger anniu" value="删除订单" />
																		</form>
																	</c:if></li>
															</div>
														</div>
													</div>

												</div>
												<c:set var="counts" value="${counts+1}"></c:set>
											</c:forEach>
										</c:if>
									</div>
								</div>
									<div id="page" class="page clearFix" style="margin-left:680px; height:50px; display: none;">
		   					<c:if test="${page>1}">
		   						<a href="${pageContext.request.contextPath}/order/toOrder.html?pageIndex=1">首页</a>	
		   						<a href="${pageContext.request.contextPath}/order/toOrder.html?pageIndex=${page-1}">上一页</a>
		   					</c:if>
		   					<c:if test="${page<pageCount}">
		   						<a href="${pageContext.request.contextPath}/order/toOrder.html?pageIndex=${page+1}">下一页</a>
		   						<a href="${pageContext.request.contextPath}/order/toOrder.html?pageIndex=${pageCount}">尾页</a>
		   					</c:if>
		  					</div>
							</div>
						
							<!-- 待付款 -->
							<div class="am-tab-panel am-fade am-in orderlist" id="tab2">

								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<c:if test="${orderListPay !=null}">
											<c:forEach var="orderListPay" items="${orderListPay}">

												<div class="order-status1">
													<div class="order-title">
														<div class="dd-num">
															订单编号：<a href="javascript:;">${orderListPay.orderCode}</a>
														</div>
														<span>下单时间：<fmt:formatDate
																value="${orderListPay.orderDate}" type="both" />
														</span>
														<!--    <em>店铺：小桔灯</em>-->
													</div>
													<div class="order-content">
														<div class="order-left">
															<c:forEach var="orderPay" items="${orderListPay.list}">
																<ul class="item-list item">
																	<li class="td td-item">
																		<div class="item-pic">
																			<a href="#" class="J_MakePoint"> <img
																				src="${pageContext.request.contextPath}/statics/${orderPay.productImage}"
																				class="itempic J_ItemImg"> </a>
																		</div>
																		<div class="item-info">
																			<div class="item-basic-info">
																				<a href="#">
																					<p>${orderPay.productName
																						},${orderPay.productTitle}</p>
																					<p class="info-little">
																						颜色：12#川南玛瑙 <br />包装：裸装
																					</p> </a>
																			</div>
																		</div></li>
																	<li class="td td-price">
																		<div class="item-price">${orderPay.orderPrice}</div></li>
																	<li class="td td-number">
																		<div class="item-number">
																			<span>×</span>${orderPay.orderCount}
																		</div></li>
																	<li class="td td-operation">
																		<div class="item-operation"></div></li>
																</ul>
															</c:forEach>

														</div>
														<div class="order-right">
															<li class="td td-amount">
																<div class="item-amount">
																	合计：${orderListPay.orderMoney}
																	<!-- <p>含运费：<span>10.00</span></p> -->
																</div></li>
															<div class="move-right">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">${orderListPay.typeName}</p>
																		<!-- <p class="order-info">
																			<a href="#">取消订单</a>
																		</p> -->
																	</div></li>
																<li class="td td-change"><%-- <a href="${pageContext.request.contextPath}/toSaveOrder.html">
																		<div class="am-btn am-btn-danger anniu">一键支付</div> </a> --%>
																</li>
															</div>
														</div>

													</div>
												</div>
											</c:forEach>
										</c:if>
									</div>

								</div>
							</div>




							<!-- 待发货 -->
							<div class="am-tab-panel am-fade am-in am-active orderlist" id="tab3">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<!-- 所有订单 -->
									<div class="order-list">
										<!-- 单个订单 -->
										<c:if test="${orderListSend !=null}">
											<c:forEach var="orderListSend" items="${orderListSend}">
												<div class="order-status5">
													<div class="order-title">
														<div class="dd-num">
															订单编号：<a href="javascript:;">${orderListSend.orderCode}</a>
														</div>
														<c:if test="${orderListSend.orderDate !=null}">
															<span>下单时间：<fmt:formatDate
																	value="${orderListSend.orderDate}" type="both" />&nbsp&nbsp&nbsp
															</span>
														</c:if>
														<c:if test="${orderListSend.orderSuccessDate !=null}">
															<span>成交时间：<fmt:formatDate
																	value="${orderListSend.orderSuccessDate}" type="both" />
															</span>
														</c:if>
														<!--    <em>店铺：小桔灯</em>-->
													</div>

													<div class="order-content">
														<div class="order-left">
															<!-- 订单里的商品 -->
															<c:forEach var="orderSend" items="${orderListSend.list}">
																<ul class="item-list item">
																	<li class="td td-item">
																		<div class="item-pic">
																			<a href="#" class="J_MakePoint"><img
																				src="${pageContext.request.contextPath}/statics/${orderSend.productImage}"
																				class="itempic J_ItemImg"> </a>
																		</div>
																		<div class="item-info">
																			<div class="item-basic-info">
																				<a href="#">
																					<p>${orderSend.productName},${orderSend.productTitle}</p>
																					<p class="info-little">
																						颜色：12#川南玛瑙 <br />包装：裸装
																					</p> </a>
																			</div>
																		</div></li>
																	<li class="td td-price">
																		<div class="item-price">
																			${orderSend.productPrice}</div></li>
																	<li class="td td-number">
																		<div class="item-number">
																			<span>×</span>${orderSend.orderCount}
																		</div></li>
																	<li class="td td-operation">
																		<div class="item-operation">
																			<!-- <a href="refund.html">退款</a> -->
																		</div></li>
																</ul>
															</c:forEach>
														</div>
														<div class="order-right">
															<li class="td td-amount">
																<div class="item-amount">
																	合计：${orderListSend.orderMoney }
																	<!-- <p>含运费：<span>10.00</span></p> -->
																</div></li>
															<div class="move-right">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">${orderListSend.typeName}</p>
																		<p class="order-info">
																			<!-- <a href="orderinfo.html">订单详情</a> -->
																		</p>
																	</div></li>
																<!-- <li class="td td-change">
																	<div class="am-btn am-btn-danger anniu">提醒发货</div></li> -->
															</div>
														</div>
													</div>

												</div>
											</c:forEach>
										</c:if>

									</div>

								</div>

							</div>




							<!-- 待收货 -->
							<div class="am-tab-panel am-fade am-in am-active orderlist" id="tab4">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<!-- 所有订单 -->
									<div class="order-list">
										<!-- 单个订单 -->
										<c:if test="${orderListSure !=null}">
											<c:forEach var="orderListSure" items="${orderListSure}">
												<div class="order-status5">
													<div class="order-title">
														<div class="dd-num">
															订单编号：<a href="javascript:;">${orderListSure.orderCode}</a>
														</div>
														<c:if test="${orderListSure.orderDate !=null}">
															<span>下单时间：<fmt:formatDate
																	value="${orderListSure.orderDate}" type="both" />&nbsp&nbsp&nbsp
															</span>
														</c:if>
														<c:if test="${orderListSure.orderSuccessDate !=null}">
															<span>成交时间：<fmt:formatDate
																	value="${orderListSure.orderSuccessDate}" type="both" />
															</span>
														</c:if>
														<!--    <em>店铺：小桔灯</em>-->
													</div>

													<div class="order-content">
														<div class="order-left">
															<!-- 订单里的商品 -->
															<c:forEach var="orderSure" items="${orderListSure.list}">
																<ul class="item-list item">
																	<li class="td td-item">
																		<div class="item-pic">
																			<a href="#" class="J_MakePoint"> <img
																				src="${pageContext.request.contextPath}/statics/${orderSure.productImage }"
																				class="itempic J_ItemImg"> </a>
																		</div>
																		<div class="item-info">
																			<div class="item-basic-info">
																				<a href="#">
																					<p>${orderSure.productName
																						},${orderSure.productTitle}</p>
																					<p class="info-little">
																						<!-- 颜色：12#川南玛瑙 <br />包装：裸装 -->
																					</p> </a>
																			</div>
																		</div></li>
																	<li class="td td-price">
																		<div class="item-price">
																			${orderSure.productPrice}</div></li>
																	<li class="td td-number">
																		<div class="item-number">
																			<span>×</span>${orderSure.orderCount}
																		</div></li>
																	<li class="td td-operation">
																		<div class="item-operation">
																			<!-- <a href="refund.html">退款/退货</a> -->
																		</div></li>
																</ul>
															</c:forEach>
														</div>
														<div class="order-right">
															<li class="td td-amount">
																<div class="item-amount">
																	合计：${orderListSure.orderMoney }
																	<!-- <p>含运费：<span>10.00</span></p> -->
																</div></li>
															<div class="move-right">
																<div class="move-right">
																	<li class="td td-status">
																		<div class="item-status">
																			<p class="Mystatus">${orderListSure.typeName }</p>
																			<p class="order-info">
																				<!-- <a href="orderinfo.html">订单详情</a> -->
																			</p>
																			<p class="order-info">
																					<a href="${pageContext.request.contextPath}/order/toLogistic.html?code=${orderListSure.orderCode}">查看物流</a>
																			</p>
																			<p class="order-info">
																				<!-- <a href="#">延长收货</a> -->
																			</p>
																		</div></li>
																	<li class="td td-change">
																		<form
																			action="updateOrder.html"
																			method="post">
																			<input name="orderCode" type="text"
																				style="display: none;"
																				value="${orderListSure.orderCode}" /> <input
																				name="reqType" type="text" style="display: none;"
																				value="sure" /> <input type="submit"
																				class="am-btn am-btn-danger anniu" value="确认收货" />
																		</form></li>
																</div>
															</div>
														</div>
													</div>

												</div>
											</c:forEach>
										</c:if>

									</div>

								</div>

							</div>


							<!-- 待评价 -->
							<div class="am-tab-panel am-fade am-in am-active orderlist" id="tab5">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<!-- 所有订单 -->
									<div class="order-list">
										<!-- 单个订单 -->
										<c:if test="${orderListComment !=null }">
											<c:forEach var="orderListComment" items="${orderListComment}">
												<div class="order-status5">
													<div class="order-title">
														<div class="dd-num">
															订单编号：<a href="javascript:;">${orderListComment.orderCode}</a>
														</div>
														<c:if test="${orderListComment.orderDate !=null}">
															<span>下单时间：<fmt:formatDate
																	value="${orderListComment.orderDate}" type="both" />&nbsp&nbsp&nbsp
															</span>
														</c:if>
														<c:if test="${orderListComment.orderSuccessDate !=null}">
															<span>成交时间：<fmt:formatDate
																	value="${orderListComment.orderSuccessDate}"
																	type="both" />
															</span>
														</c:if>
														<!--    <em>店铺：小桔灯</em>-->
													</div>

													<div class="order-content">
														<div class="order-left">
															<!-- 订单里的商品 -->
															<c:forEach var="orderComment"
																items="${orderListComment.list}">
																<ul class="item-list item">
																	<li class="td td-item">
																		<div class="item-pic">
																			<a href="#" class="J_MakePoint"> <img
																				src="${pageContext.request.contextPath}/statics/${orderComment.productImage}"
																				class="itempic J_ItemImg"> </a>
																		</div>
																		<div class="item-info">
																			<div class="item-basic-info">
																				<a href="#">
																					<p>${orderComment.productName
																						},${orderComment.productTitle}</p>
																					<p class="info-little">
																						<!-- 颜色：12#川南玛瑙 <br />包装：裸装 -->
																					</p> </a>
																			</div>
																		</div></li>
																	<li class="td td-price">
																		<div class="item-price">
																			${orderComment.productPrice}</div></li>
																	<li class="td td-number">
																		<div class="item-number">
																			<span>×</span>${orderComment.orderCount}
																		</div></li>
																	<li class="td td-operation">
																		<div class="item-operation">
																			<!-- <a href="refund.html">退款/退货</a> -->
																		</div></li>
																</ul>
															</c:forEach>
														</div>
														<div class="order-right">
															<li class="td td-amount">
																<div class="item-amount">
																	合计：${orderListComment.orderMoney }
																	<!-- <p>含运费：<span>10.00</span></p> -->
																</div></li>
															<div class="move-right">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">${orderListComment.typeName }</p>
																		<p class="order-info">
																			<!-- <a href="orderinfo.html">订单详情</a> -->
																		</p>
																		<p class="order-info">
																			<a href="${pageContext.request.contextPath}/order/toLogistic.html?code=${orderListComment.orderCode}">查看物流</a>
																		</p>
																	</div></li>
																<li class="td td-change">
																<form action="toCommentList.html" method="post">
																			<input name="orderCode" type="text"
																				style="display: none;"
																				value="${orderListComment.orderCode}" /> <input
																				name="reqType" type="text" style="display: none;"
																				value="sure" /> <input type="submit"
																				class="am-btn am-btn-danger anniu" value="评价商品" />
																		</form>
																</li>
															</div>
														</div>
													</div>

												</div>
											</c:forEach>
										</c:if>

									</div>

								</div>

							</div>

						</div>
				
					</div>
				</div>
			</div>
		
			<!--底部-->
			<div class="footer">
				<%@ include file="bottom.jsp"%>

			</div>
		</div>
		<aside class="menu">
			<%@ include file="left.jsp"%>
		</aside>
	</div>
	<%-- <input type="text" id="result" style="display: none" value="${sessionScope.result}"/> --%>
	<script type="text/javascript">
	var mLi= $(".message");
	var length=mLi.length;
	var array=[];
	var orderlist=[];
	var list =$(".orderlist");
	var item=document.getElementsByClassName("item");
	
	for (var i = 0; i < length; i++) {
		array[i]=mLi;
		orderlist[i]=list;
	}
				if(item[0].innerHTML!=null){
					page.style.cssText="display:block;";
				}else{
					page.style.cssText="display:none;";
				}
	for (var j = 0; j < length; j++) {
		array[j].click(function(){
			for (var i = 0; i < length; i++) {
			(function(i){
				list[i].style.cssText="display:block;";
			})(i);
			}
		});
	};
	
	$(document).ready(function(){
		for (var j = 0; j < length; j++) {
			list[j].style.cssText="display:none;";
		}
		var success='<%=session.getAttribute("success")%>';
		var info='<%=session.getAttribute("info")%>';
		var error='<%=session.getAttribute("error")%>';
		if (success != "null" && success != "") {
			zeroModal.success(success);
			<%session.removeAttribute("success");%>
		} else if (info != "null" && info != "") {
			zeroModal.alert(info);
			<%session.removeAttribute("info");%>
		} else if (error != "null" && error != "") {
			zeroModal.error(error);
			<%session.removeAttribute("error");%>
		}
	});
	</script>
</body>

</html>