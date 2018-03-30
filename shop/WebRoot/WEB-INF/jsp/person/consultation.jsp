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

		<title>商品咨询</title>

		<link href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath}/statics/css/personal.css" rel="stylesheet" type="text/css">

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
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">商品咨询</strong> / <small>Commodity&nbsp;Consultation</small></div>
					</div>
					<hr/>
					<div class="suggestmain">
						<p>咨询问题分类：</p>
						<div class="suggestlist">
							<select data-am-selected>
								<option value="a" selected>请选择问题类型</option>
								<option value="b">产品问题</option>
								<option value="c">促销问题</option>
								<option value="d">支付问题</option>
								<option value="e">退款问题</option>
								<option value="f">配送问题</option>
								<option value="g">售后问题</option>
								<option value="h">发票问题</option>
								<option value="o">退换货</option>
								<option value="m">其他</option>
							</select>
						</div>
						<div class="suggestDetail">
							<p>描述问题：</p>
							<blockquote class="textArea">
								<textarea name="opinionContent" id="say_some" cols="60" rows="5" autocomplete="off" placeholder="在此描述您的意见具体内容"></textarea>
								<div class="fontTip"><i class="cur">0</i> / <i>200</i></div>
							</blockquote>
						</div>
						<div class="am-btn am-btn-danger anniu">提交</div>
						<p class="suggestTel"><i class="am-icon-phone"></i>客服电话：400-007-1234</p>
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