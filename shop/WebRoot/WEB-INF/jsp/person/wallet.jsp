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

		<title>账户余额</title>

		<link href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath}/statics/css/personal.css" rel="stylesheet" type="text/css">

		<script src="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/js/jquery.min.js"  type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/js/amazeui.js"  type="text/javascript"></script>	
		
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
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">账户余额</strong> / <small>Account&nbsp;Balance</small></div>
						</div>
						<hr/>	
						<div class="finance">
							<div class="financeText">
								<p>可用余额:<span>¥0.0</span></p>
								<a href="safety.html">安全中心：保护账户资产安全</a>
							</div>
							<div class="financeTip">
								<img src="${pageContext.request.contextPath}/statics/images/Balance.png" />
								<a href="walletlist.html">查看账户明细</a>
								<p>提示：余额是您在本商城的一个账户，如账户内有款项，下单时可以直接勾选使用，抵消部分总额，方便快捷安全高效。</p>
							</div>
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