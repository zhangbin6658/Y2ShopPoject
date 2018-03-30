<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>物流</title>

		<link href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath}/statics/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/statics/css/lostyle.css" rel="stylesheet" type="text/css">

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
					<div class="user-logistics">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">物流跟踪</strong> / <small>Logistics&nbsp;History</small></div>
						</div>
						<hr/>
						<div class="package-title">
							<div class="m-item">
								<div class="item-pic">
									<img src="${pageContext.request.contextPath}/statics/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
								</div>
								<div class="item-info">
									<p class="log-status">物流状态:<span>${logisticState}</span> </p>
									<p>承运公司：${logisticName }</p>
									<p>快递单号：${logisticCodes }</p>
									<!-- <p>官方电话：4001-888-888</p> -->
								</div>
							</div>
                         <div class="clear"></div>
						</div>
						<div class="package-status">
							<ul class="status-list">
								<c:forEach var="logistic" items="${logisticsList }">	
								<li class="latest">
									<p class="text">${logistic.substance }</p>
									<div class="time-list">
										<span class="date">${logistic.date }<!-- </span><span class="week">周六</span><span class="time">15:35:42</span> -->
									</div>
								</li>
								</c:forEach>
																							
								
							</ul>
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