<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>账户明细</title>

		<link href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath}/statics/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/statics/css/wallet.css" rel="stylesheet" type="text/css">

		<script src="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>

	</head>

	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<%@ include file="top.jsp" %>
					</div>
				</div>
			</article>
		</header>
		<div class="nav-table">
			<div class="long-title"><span class="all-goods">全部分类</span></div>
			<div class="nav-cont">
				<ul>
					<li class="index"><a href="#">首页</a></li>
					<li class="qc"><a href="#">闪购</a></li>
					<li class="qc"><a href="#">限时抢</a></li>
					<li class="qc"><a href="#">团购</a></li>
					<li class="qc last"><a href="#">大包装</a></li>
				</ul>
				<div class="nav-extra">
					<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
					<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
				</div>
			</div>
		</div>
		<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">
					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">账单明细</strong> / <small>Electronic&nbsp;bill</small></div>
					</div>
					<hr>
					<div class="finance">
						<div class="financeText">
							<p>可用余额:<span>¥0.0</span></p>
							<p>账户状态:<span>有效</span></p>
							<a href="safety.html">安全中心：保护账户资产安全</a>
						</div>
					</div>

					<!--交易时间	-->

					<div class="order-time">
						<label class="form-label">交易时间：</label>
						<div class="show-input">
							<select class="am-selected" data-am-selected>
								<option value="today">今天</option>
								<option value="sevenDays" selected="">最近一周</option>
								<option value="oneMonth">最近一个月</option>
								<option value="threeMonths">最近三个月</option>
								<option class="date-trigger">自定义时间</option>
							</select>
						</div>
						<div class="clear"></div>
					</div>

					<div class="walletList">

						<div class="walletTitle">
							<li class="time">创建时间</th>
								<li class="name">详情</th>
									<li class="amount">金额</th>
										<li class="balance">余额</th>
						</div>
						<div class="clear"></div>
						<div class="walletCont">
							<li class="cost">
								<div class="time">
									<p> 2016-03-12
									</p>
									<p class="text-muted"> 18:41
									</p>
								</div>
								<div class="title name">
									<p class="content">
										消费
									</p>
								</div>

								<div class="amount">
									<span class="amount-pay">-32.00</span>
								</div>
								<div class="balance">
									<span>余额：</span><em>0</em>
								</div>
							</li>

							<li>
								<div class="time">
									<p> 2016-03-06
									</p>
									<p class="text-muted"> 22:22
									</p>
								</div>
								<div class="title name">
									<p class="content">
										退款至钱包
									</p>
								</div>

								<div class="amount">
									<span class="amount-pay">+16.00</span>
								</div>
								<div class="balance">
									<span>余额：</span><em>32</em>
								</div>
							</li>

							<li class="cost">
								<div class="time">
									<p> 2016-02-28
									</p>
									<p class="text-muted"> 17:58
									</p>
								</div>
								<div class="title name">
									<p class="content">
										消费
									</p>
								</div>

								<div class="amount">
									<span class="amount-pay">-16.00</span>
								</div>
								<div class="balance">
									<span>余额：</span><em>16</em>
								</div>
							</li>

							<li class="cost">
								<div class="time">
									<p> 2016-02-14
									</p>
									<p class="text-muted"> 20:42
									</p>
								</div>
								<div class="title name">
									<p class="content">
										提现
									</p>
								</div>

								<div class="amount">
									<span class="amount-pay">-100.00</span>
								</div>
								<div class="balance">
									<span>余额：</span><em>32</em>
								</div>
							</li>

							<li>
								<div class="time">
									<p> 2016-02-02
									</p>
									<p class="text-muted"> 13:24
									</p>
								</div>
								<div class="title name">
									<p class="content">
										充值
									</p>
								</div>

								<div class="amount">
									<span class="amount-pay">+132.00</span>
								</div>
								<div class="balance">
									<span>余额：</span><em>132</em>
								</div>
							</li>
							<li class="cost">
								<div class="time">
									<p> 2016-01-30
									</p>
									<p class="text-muted"> 11:33
									</p>
								</div>
								<div class="title name">
									<p class="content">
										提现
									</p>
								</div>

								<div class="amount">
									<span class="amount-pay">-47.00</span>
								</div>
								<div class="balance">
									<span>余额：</span><em>0</em>
								</div>
							</li>
							<li class="cost">
								<div class="time">
									<p> 2016-01-30
									</p>
									<p class="text-muted"> 08:27
									</p>
								</div>
								<div class="title name">
									<p class="content">
										消费
									</p>
								</div>

								<div class="amount">
									<span class="amount-pay">-53.00</span>
								</div>
								<div class="balance">
									<span>余额：</span><em>47</em>
								</div>
							</li>
							<li>
								<div class="time">
									<p> 2016-01-28
									</p>
									<p class="text-muted"> 10:58
									</p>
								</div>
								<div class="title name">
									<p class="content">
										充值
									</p>
								</div>

								<div class="amount">
									<span class="amount-pay">+100.00</span>
								</div>
								<div class="balance">
									<span>余额：</span><em>100</em>
								</div>
							</li>
						</div>
						
						<!--分页-->
						<ul class="am-pagination am-pagination-right">
							<li class="am-disabled"><a href="#">&laquo;</a></li>
							<li class="am-active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>

					</div>

				</div>
				<!--底部-->
				<div class="footer">
					<%@ include file="bottom.jsp" %>
				</div>
			</div>

			<aside class="menu">
			<%@ include file="left.jsp" %>
			</aside>
		</div>

	</body>

</html>