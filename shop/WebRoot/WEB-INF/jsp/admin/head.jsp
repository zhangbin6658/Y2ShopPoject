<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>头部-有点</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/public.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/public.js"></script>
</head>

<body>
	<!-- 头部 -->
	<div class="head">
	
		<div class="headL" style="width:1020px;">
			<marquee style=" margin:0 0 0 300px; line-height:100px; color:rgba(255,100,255,1);  font-size:26px;" scrollamount="10" direction="left">欢迎来到商城管理</marquee>
			<%-- <img class="headLogo" src="${pageContext.request.contextPath}/statics/images/headLogo.png" /> --%>
		</div>
		<div class="headR" style="width:110px;">
			<p class="p1">
				欢迎，${sessionScope.adminName}
			</p>
			<p class="p2">
				<!-- <a href="#" class="resetPWD">重置密码</a>&nbsp;&nbsp; -->
				<a href="javascript:exit();" class="goOut" >退出</a>
			</p>
		</div>
		<!-- onclick="{if(confirm(&quot;确定退出吗&quot;)){return true;}return false;}" -->
	</div>

	<div class="closeOut">
		<div class="coDiv">
			<p class="p1">
				<span>X</span>
			</p>
			<p class="p2">确定退出当前用户？</p>
			<P class="p3">
				<a class="ok yes" href="#">确定</a><a class="ok no" href="#">取消</a>
			</p>
		</div>
	</div>


<script type="text/javascript">
/* $(".goOut").click(function(){
			$("#center").css("display","none");
			window.location.href="${pageContext.request.contextPath}/admin/logout.html";
		}		
	); */
	function exit(){
		window.open('logout', '_top');
	}
</script>
</body>
</html>