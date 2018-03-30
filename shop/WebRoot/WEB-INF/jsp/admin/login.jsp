<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录-有点</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/public.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/page.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/public.js"></script>
</head>
<body>

	<!-- 登录页面头部 -->
	<!-- <div class="logHead" style="">
		<img src="img/logLOGO.png" />
	</div> -->
	<!-- 登录页面头部结束 -->

	<!-- 登录body -->
	<div class="logDiv" style="width: 1360px;">
	<form action="dologin.html" method="post" id="login">
		<img class="logBanner" src="${pageContext.request.contextPath}/statics/images/logBanner.png" />
		<div class="logGet">
			<!-- 头部提示信息 -->
			<div class="logD logDtip">
				<p class="p1">登录</p>
				<p class="p2">管理员登录</p>
			</div>
			<!-- 输入框 -->
			<div class="lgD">
				<img class="img1" src="${pageContext.request.contextPath}/statics/images/logName.png" /><input type="text" name="adminName"
					placeholder="输入用户名" />
			</div>
			<div class="lgD">
				<img class="img1" src="${pageContext.request.contextPath}/statics/images/logPwd.png" /><input type="password" name="adminPassword"
					placeholder="输入用户密码" />
			</div>
			<!-- <div class="lgD logD2">
				<input class="getYZM" type="text" />
				<div class="logYZM">
					<img class="yzm" src="img/logYZM.png" />
				</div>
			</div> -->
			<div class="logC">
				<input id="btn" style="width: 315px; height:45px; background-color: #e70; color:#fff; font-size: 18px;line-height: 45px; text-align: center; cursor: pointer;" value="登 录">
			</div>
		</div>
		</form>
	</div>
	<!-- 登录body  end -->

	<!-- 登录页面底部 -->
	<div class="logFoot">
		<p class="p1">&copy courage team 2017</p>
		<!-- <p class="p2">南京设易网络科技有限公司 登记序号：苏ICP备11003578号-2</p> -->
	</div>
	<!-- 登录页面底部end -->
	<script type="text/javascript">
		$("#btn").click(function(){
			console.log("aa");
			$("#login").submit();
		})
	</script>
</body>
</html>