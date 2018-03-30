<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员注册-有点</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/css.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/messages_zh.js"></script>
</head>
<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="img/coin02.png" /><span><a href="${pageContext.request.contextPath}/admin/index.html">首页</a><!-- &nbsp;-&nbsp;<a
					href="#">公共管理</a>&nbsp; -->-</span>&nbsp;客户管理
			</div>
		</div>
		<div class="page ">
			<!-- 会员注册页面样式 -->
			<div class="banneradd bor">
				<div class="baTopNo">
					<span>会员注册</span>
				</div>
				<div class="baBody">
					<div class="bbD">
						用户名：<input type="text" class="input3" />
					</div>
					<div class="bbD">
						&nbsp;&nbsp;&nbsp;密码：<input type="password" class="input3" />
					</div>
					<div class="bbD">
						<p class="bbDP">
							<a class="btn_ok btn_yes" href="#">提交</a> <a
								class="btn_ok btn_no" href="#">取消</a>
						</p>
					</div>
				</div>
			</div>

			<!-- 会员注册页面样式end -->
		</div>
	</div>
</body>
</html>