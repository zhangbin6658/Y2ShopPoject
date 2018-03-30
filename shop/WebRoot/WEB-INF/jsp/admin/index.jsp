<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页-有点</title>

</head>
<frameset rows="100,*" cols="*" scrolling="No" framespacing="0"
	frameborder="no" border="0">
	<frame src="${pageContext.request.contextPath}/admin/admintop.html"
		name="headmenu" id="mainFrame" title="mainFrame">
	<!-- 引用头部 -->
	<!-- 引用左边和主体部分 -->
	<frameset rows="100*" cols="220,*" scrolling="No" framespacing="0" id="center" style="display: none;"
		frameborder="no" border="0">
		<frame src="${pageContext.request.contextPath}/admin/adminleft.html"
			name="leftmenu" id="mainFrame" title="mainFrame">
		<frame src="${pageContext.request.contextPath}/admin/main.html"
			name="main" scrolling="yes" noresize="noresize" id="rightFrame"
			title="rightFrame">
	</frameset>
</frameset>

</html>