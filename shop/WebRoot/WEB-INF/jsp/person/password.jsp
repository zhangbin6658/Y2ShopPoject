<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>修改密码</title>

		<link href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath}/statics/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/statics/css/stepstyle.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/statics/css/zeroModal.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-1.7.2.min.js"></script>
		<script src="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script src="${pageContext.request.contextPath}/statics/js/zeroModal.min.js"></script>
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
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改密码</strong> / <small>Password</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">重置密码</p>
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
					<form action="update.html" class="am-form am-form-horizontal" method="post">
						<div class="am-form-group">
							<label for="user-old-password" class="am-form-label">原密码</label>
							<div class="am-form-content">
								<input type="password" id="user-old-password" name="oldPwd" placeholder="请输入原登录密码" required="required" pattern="[a-zA-Z0-9]{6,10}" />
								<p id="p-oldPwd" style="color: red;"></p>
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-new-password" class="am-form-label">新密码</label>
							<div class="am-form-content">
								<input type="password" id="user-new-password" name="newPwd" placeholder="由数字、字母组合" required="required" pattern="[a-zA-Z0-9]{6,10}"/>
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-confirm-password" class="am-form-label">确认密码</label>
							<div class="am-form-content">
								<input type="password" id="user-confirm-password" name="newPwds" placeholder="请再次输入上面的密码" required="required" pattern="[a-zA-Z0-9]{6,10}" />
							</div>
						</div>
						<div class="info-btn">
							<input type="submit" id="updatePwd" class="am-btn am-btn-danger" value="保存修改" />
							<%-- <c:if test="${requestScope.result !=null}">
								<p style="color: red;"><%=${requestScope.result}%></p>
								
							</c:if> --%>
							
							
							<%
							String result=(String)request.getAttribute("result");
							if(result !=null && result !=""){%>
							<p style="color: red;"><%=result %></p>
							<%} %>
							 
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
		<script src="${pageContext.request.contextPath}/statics/js/password.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			var success='<%=session.getAttribute("success")%>';
			var info='<%=session.getAttribute("info")%>';
			var error='<%=session.getAttribute("error")%>';
			if (success != "null" && success != "") {
				zeroModal.success(success);
				<%session.removeAttribute("success");%>
			} else if (info != "null" && info != "") {
				zeroModal.alert(info);
				<%session.removeAttribute("info");%>
			} else if (error != "null" && error != "") {
				zeroModal.error(error);
				<%session.removeAttribute("error");%>
			}
		});
		
		</script>
		
		
	</body>

</html>