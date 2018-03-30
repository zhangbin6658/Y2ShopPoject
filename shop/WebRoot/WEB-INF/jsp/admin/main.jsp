<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页引用-有点</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/css.css" />
</head>

<body>
	<div id="pageAll">
		<div class="page">
			<!-- main页面样式 -->
			<div class="indexL">
				<%-- <img class="indexBn" src="${pageContext.request.contextPath}/statics/images/indexBanner.png" /><br> --%>
				<!-- 更多模板：<a href="http://www.mycodes.net/" target="_blank">源码之家</a> -->
			</div>
			<!-- main页面样式end -->
		</div>
	</div>
</body>
</html>