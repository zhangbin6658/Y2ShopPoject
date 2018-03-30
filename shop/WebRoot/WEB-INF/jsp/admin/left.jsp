<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页左侧导航</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/public.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/public.js"></script>
<style type="text/css">
	.system_log dd img{
		height:50px;
	}
	.system_log .menu-choice{
		
	}
	.system_log dd a{
		display:block;
		height:48px;
		line-height:48px;
	}
	
</style>
<head></head>

<body id="bg">
	<!-- 左边节点 -->
	<div class="container">

		<div class="leftsidebar_box">
			<a href="${pageContext.request.contextPath}/admin/main.html" target="main"><div class="line">
					<img src="${pageContext.request.contextPath}/statics/images/coin01.png" />&nbsp;&nbsp;首页
				</div></a>
			<!-- <dl class="system_log">
			<dt><img class="icon1" src="${pageContext.request.contextPath}/statics/images/coin01.png" /><img class="icon2"src="${pageContext.request.contextPath}/statics/images/coin02.png" />
				首页<img class="icon3" src="${pageContext.request.contextPath}/statics/images/coin19.png" /><img class="icon4" src="${pageContext.request.contextPath}/statics/images/coin20.png" /></dt>
		</dl> -->
			<dl class="system_log">
				<dt>
					<img class="icon1" src="${pageContext.request.contextPath}/statics/images/coin03.png" /><img class="icon2"
						src="${pageContext.request.contextPath}/statics/images/coin04.png" /> 网站管理<img class="icon3"
						src="${pageContext.request.contextPath}/statics/images/coin19.png" /><img class="icon4"
						src="${pageContext.request.contextPath}/statics/images/coin20.png" />
				</dt>
				<dd style="">
					<img class="coin11" src="${pageContext.request.contextPath}/statics/images/coin111.png" /><img class="coin22"
						src="${pageContext.request.contextPath}/statics/images/coin222.png" /><a class="cks product" href="${pageContext.request.contextPath}/admin/productlist.html"
						target="main">商品管理</a><img class="icon5" src="${pageContext.request.contextPath}/statics/images/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="${pageContext.request.contextPath}/statics/images/coin05.png" /><img class="icon2"
						src="${pageContext.request.contextPath}/statics/images/coin06.png" /> 公共管理<img class="icon3"
						src="${pageContext.request.contextPath}/statics/images/coin19.png" /><img class="icon4"
						src="${pageContext.request.contextPath}/statics/images/coin20.png" />
				</dt>
				<dd >
					<img class="coin11" src="${pageContext.request.contextPath}/statics/images/coin111.png" /><img class="coin22"
						src="${pageContext.request.contextPath}/statics/images/coin222.png" /><a class="cks" href="${pageContext.request.contextPath}/admin/orderlist.html"
						target="main">订单管理</a><img class="icon5" src="${pageContext.request.contextPath}/statics/images/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="${pageContext.request.contextPath}/statics/images/coin111.png" /><img class="coin22"
						src="${pageContext.request.contextPath}/statics/images/coin222.png" /><a class="cks" href="${pageContext.request.contextPath}/admin/commentlist.html"
						target="main">评论管理</a><img class="icon5" src="${pageContext.request.contextPath}/statics/images/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="${pageContext.request.contextPath}/statics/images/coin07.png" /><img class="icon2"
						src="${pageContext.request.contextPath}/statics/images/coin08.png" /> 客户管理<img class="icon3"
						src="${pageContext.request.contextPath}/statics/images/coin19.png" /><img class="icon4"
						src="${pageContext.request.contextPath}/statics/images/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="${pageContext.request.contextPath}/statics/images/coin111.png" /><img class="coin22"
						src="${pageContext.request.contextPath}/statics/images/coin222.png" /><a href="${pageContext.request.contextPath}/admin/customerlist" target="main"
						class="cks">客户管理</a><img class="icon5" src="${pageContext.request.contextPath}/statics/images/coin21.png" />
				</dd>
			</dl>
			<%-- <dl class="system_log">
				<dt>
					<img class="icon1" src="${pageContext.request.contextPath}/statics/images/coin10.png" /><img class="icon2"
						src="${pageContext.request.contextPath}/statics/images/coin09.png" /> 行家管理<img class="icon3"
						src="${pageContext.request.contextPath}/statics/images/coin19.png" /><img class="icon4"
						src="${pageContext.request.contextPath}/statics/images/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="${pageContext.request.contextPath}/statics/images/coin111.png" /><img class="coin22"
						src="${pageContext.request.contextPath}/statics/images/coin222.png" /><a href="../connoisseur.html"
						target="main" class="cks">行家管理</a><img class="icon5"
						src="${pageContext.request.contextPath}/statics/images/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="${pageContext.request.contextPath}/statics/images/coin11.png" /><img class="icon2"
						src="${pageContext.request.contextPath}/statics/images/coin12.png" /> 话题管理<img class="icon3"
						src="${pageContext.request.contextPath}/statics/images/coin19.png" /><img class="icon4"
						src="${pageContext.request.contextPath}/statics/images/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="${pageContext.request.contextPath}/statics/images/coin111.png" /><img class="coin22"
						src="${pageContext.request.contextPath}/statics/images/coin222.png" /><a href="../topic.html" target="main"
						class="cks">话题管理</a><img class="icon5" src="${pageContext.request.contextPath}/statics/images/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="${pageContext.request.contextPath}/statics/images/coin14.png" /><img class="icon2"
						src="${pageContext.request.contextPath}/statics/images/coin13.png" /> 心愿管理<img class="icon3"
						src="${pageContext.request.contextPath}/statics/images/coin19.png" /><img class="icon4"
						src="${pageContext.request.contextPath}/statics/images/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="${pageContext.request.contextPath}/statics/images/coin111.png" /><img class="coin22"
						src="${pageContext.request.contextPath}/statics/images/coin222.png" /><a href="../wish.html" target="main"
						class="cks">心愿管理</a><img class="icon5" src="${pageContext.request.contextPath}/statics/images/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="${pageContext.request.contextPath}/statics/images/coin15.png" /><img class="icon2"
						src="${pageContext.request.contextPath}/statics/images/coin16.png" /> 约见管理<img class="icon3"
						src="${pageContext.request.contextPath}/statics/images/coin19.png" /><img class="icon4"
						src="${pageContext.request.contextPath}/statics/images/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="${pageContext.request.contextPath}/statics/images/coin111.png" /><img class="coin22"
						src="${pageContext.request.contextPath}/statics/images/coin222.png" /><a href="../appointment.html"
						target="main" class="cks">约见管理</a><img class="icon5"
						src="${pageContext.request.contextPath}/statics/images/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="${pageContext.request.contextPath}/statics/images/coin17.png" /><img class="icon2"
						src="${pageContext.request.contextPath}/statics/images/coin18.png" /> 收支管理<img class="icon3"
						src="${pageContext.request.contextPath}/statics/images/coin19.png" /><img class="icon4"
						src="${pageContext.request.contextPath}/statics/images/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="${pageContext.request.contextPath}/statics/images/coin111.png" /><img class="coin22"
						src="${pageContext.request.contextPath}/statics/images/coin222.png" /><a href="../balance.html"
						target="main" class="cks">收支管理</a><img class="icon5"
						src="${pageContext.request.contextPath}/statics/images/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="${pageContext.request.contextPath}/statics/images/coinL1.png" /><img class="icon2"
						src="${pageContext.request.contextPath}/statics/images/coinL2.png" /> 系统管理<img class="icon3"
						src="${pageContext.request.contextPath}/statics/images/coin19.png" /><img class="icon4"
						src="${pageContext.request.contextPath}/statics/images/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="${pageContext.request.contextPath}/statics/images/coin111.png" /><img class="coin22"
						src="${pageContext.request.contextPath}/statics/images/coin222.png" /><a href="../changepwd.html"
						target="main" class="cks">修改密码</a><img class="icon5"
						src="${pageContext.request.contextPath}/statics/images/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="${pageContext.request.contextPath}/statics/images/coin111.png" /><img class="coin22"
						src="${pageContext.request.contextPath}/statics/images/coin222.png" /><a class="cks">退出</a><img
						class="icon5" src="${pageContext.request.contextPath}/statics/images/coin21.png" />
				</dd>
			</dl> --%>

		</div>

	</div>
</body>
</html>
