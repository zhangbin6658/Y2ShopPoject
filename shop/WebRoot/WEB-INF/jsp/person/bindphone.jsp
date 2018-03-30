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

		<title>绑定手机</title>

		<link href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath}/statics/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/statics/css/stepstyle.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/statics/result/message.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/statics/result/bootstrap.min.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-1.7.2.min.js"></script>
		<script src="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

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

					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">绑定手机</strong> / <small>Bind&nbsp;Phone</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">绑定手机</p>
                            </span>
							<span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
							<span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					<form action="update.html" class="am-form am-form-horizontal">
						<div class="am-form-group">
							<label for="user-new-phone" class="am-form-label">验证手机</label>
							<div class="am-form-content">
								<input type="text" id="phone" name="phone" placeholder="请输入新手机号" required="required" pattern="^1[3578][0-9]{9}$" />
							</div>
						</div>
						<div class="am-form-group code">
							<label for="user-new-code" class="am-form-label">验证码</label>
							<div class="am-form-content">
								<input type="text" id="user-new-code" placeholder="短信验证码" style="width: 370px" required="required" />
							</div>
							<a class="btn" href="javascript:void(0);" onclick="sendMobileCode();" id="sendMobileCode">
								<input type="button" id="dyMobileButton" class="am-btn am-btn-danger" style="width: 140px" value="获取验证码" />
							</a>
						</div>
						<div class="info-btn">
							<input id="update-phone" type="submit" class="am-btn am-btn-danger" value="保存修改" />
						</div>

					</form>

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
		<script src="${pageContext.request.contextPath}/statics/js/bindphone.js"></script>
		<script src="${pageContext.request.contextPath}/statics/result/message.js" type="text/javascript"></script>
				<script type="text/javascript">
					$(document).ready(
							function() {
								var success='<%=session.getAttribute("success")%>';
								var info='<%=session.getAttribute("info")%>';
								var error='<%=session.getAttribute("error")%>';
								if (success != "null" && success != "") {
									$.message({
										message : success,
										type : 'success'
									});
								<%session.removeAttribute("success");%>
								}else if (info != "null" && info != "") {
									$.message({
										message : info,
										type : 'info'
									});
								<%session.removeAttribute("info");%>
								}else if (error != "null" && error != "") {
									$.message({
										message : error,
										type : 'error'
									}); 
								<%session.removeAttribute("error");%> 
							});
				</script>
	</body>

</html>