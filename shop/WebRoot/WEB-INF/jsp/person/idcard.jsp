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

		<title>实名认证</title>

		<link href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath}/statics/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/statics/css/stepstyle.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/statics/result/message.css" rel="stylesheet" type="text/css">
		<script
	src="${pageContext.request.contextPath}/statics/js/jquery-1.12.4.js"></script>
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
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">实名认证</strong> / <small>Real&nbsp;authentication</small></div>
					</div>
					<hr/>
					<div class="authentication">
						<p class="tip">请填写您身份证上的真实信息，以用于报关审核</p>
						<form id="saveIdcard" action="Certification.html" method="post">
						<div class="authenticationInfo">
							<p class="title">填写个人信息</p>

							<div class="am-form-group">
								<label for="user-name" class="am-form-label">真实姓名</label>
								<div class="am-form-content">
									<input type="text" id="user-name" name="name" required="required" placeholder="请输入您的真实姓名">
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-IDcard" class="am-form-label">身份证号</label>
								<div class="am-form-content">
									<input type="text" class="idcard" id="user-IDcard" name="idcard" maxlength="18" required="required" placeholder="请输入您的身份证信息">
									<span id="testIdCard"></span>
								</div>
							</div>
						</div>
						<%-- <div class="authenticationPic">
							<p class="title">上传身份证照片</p>
							<p class="tip">请按要求上传身份证</p>
							<ul class="cardlist">
								<li>
									<div class="cardPic">
										<img src="${pageContext.request.contextPath}/statics/images/cardbg.jpg">
										<div class="cardText"><i class="am-icon-plus"></i>
											<p>正面照片</p>
										</div>
										<p class="titleText">身份证正面</p>
									</div>
									<div class="cardExample">
										<img src="${pageContext.request.contextPath}/statics/images/cardbg.jpg">
										<p class="titleText">示例</p>										
									</div>
									
								</li>
								<li>
									<div class="cardPic">
										<img src="${pageContext.request.contextPath}/statics/images/cardbg.jpg">
										<div class="cardText"><i class="am-icon-plus"></i>
											<p>背面照片</p>
										</div>
										<p class="titleText">身份证背面</p>
									</div>
									<div class="cardExample">
										<img src="${pageContext.request.contextPath}/statics/images/cardbg.jpg">
										<p class="titleText">示例</p>										
									</div>
									
								</li>
							</ul>
						</div> --%>
						<div class="info-btn">
							<input type="button" id="btn" class=" am-btn am-btn-danger"value="提交"></input>
						</div>
						</form>
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
									}); }
								<%session.removeAttribute("error");%> 
								});
								document.getElementById("user-IDcard").onblur=function(){
									if(/^\d{6}(1|2)[0-9]{3}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])\d{3}(\d|X)$/.test(this.value)){
									document.getElementById("testIdCard").innerHTML="";
									
									}else{
										document.getElementById("testIdCard").innerHTML="身份证信息填写有误";
										this.focus();
										document.getElementById("testIdCard").style.cssText="margin-left:20px;color:red;font-size:12px;";
									};
								document.querySelector("#btn").onclick=function(){
								console.log(document.getElementById("user-IDcard").value);
								console.log(document.getElementById("user-name").value);
									if(/^\d{6}(1|2)[0-9]{3}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])\d{3}(\d|X)$/.test(document.getElementById("user-IDcard").value)==true&&document.getElementById("user-name").value!=null&&document.getElementById("user-name").value!=""){
										document.getElementById("saveIdcard").submit();
									}else{
										alert("身份证信息填写有误");
									}
								}
								}
								
								
				</script>
	</body>

</html>