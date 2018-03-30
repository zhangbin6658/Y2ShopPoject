<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isErrorPage="true"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>访问的页面找不到了</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="background-color: rgba(0,123,193,1)"><!--  -->
   <h2 style="text-align:center;color: #fff;"> 茫茫大海中，访问的页面找不到了</h2><br>
   <div style="margin-left:120px; position: relative;">
   		<img alt="" src="${pageContext.request.contextPath}/statics/images/404.jpg" width="800px" height="500px" >
   		<div style="position: absolute;top:359px;left:256px;height: 600px">
   			<a href="javascript:history.back();" style="opacity:0; color: #fff; display: block;width: 228px; height:50px;border: 2px solid #fff; text-align: center;line-height: 54px;font-size: 14px;" >返回上一页</a>
   		</div>
   </div>
  </body>
</html>
