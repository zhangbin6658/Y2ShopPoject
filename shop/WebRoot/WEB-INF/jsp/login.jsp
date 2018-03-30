<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/amazeui.css" />
<link href="${pageContext.request.contextPath}/statics/css/dlstyle.css"
	rel="stylesheet" type="text/css">
<style type="text/css">
.login-box ul {
	list-style: none;
	background: #f8f8f8;
}

.login-box li {
	height: 37px;
	margin: 15px auto;
	overflow: hidden;
	transition: 0.5s;
}

.login-box li input {
	margin-left: 30px;
	width: 248px;
	height: 35px;
	outline: none;
	text-indent: 10px;
	background-color: rgba(255, 255, 255, .1);
	border: 1px solid #ccc;
	border-radius: 6px;
}

.login-box li p {
	padding: 5px 0;
	font-size: 14px;
	color: red;
}
</style>
</head>

<body>

	<div class="login-boxtitle">
		<a href="home.html"><img alt="logo"
			src="${pageContext.request.contextPath}/statics/images/logobig.png" />
		</a>
	</div>

	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg">
				<span></span><img
					src="${pageContext.request.contextPath}/statics/images/big.jpg" />
			</div>
			<div class="login-box" style="height:392px;">

				<h3 class="title"
					style="font-size:16px; color:blue; opacity:0.8; font-family:"
					Microsoftyahei";">登录商城</h3>
				<div class="clear"></div>
				<div class="login-form">
					<form id="login" action="doLogin.html" method="post">
						<!-- 	<div class="user-name">
							<label for="user"><i class="am-icon-user"></i> </label> <input
								type="text" name="name" id="user" placeholder="请输入用户名">
						</div>
						<div class="user-pass">
							<label for="password"><i class="am-icon-lock"></i> </label> <input
								type="password" name="password" id="password"
								placeholder="请输入密码">
						</div> -->
						<ul>
							<li><input type="text" placeholder="请输入用户名" name="name"
								id="name" required="required">
								<p>字母开头,长度6-10位字母数字下划线</p></li>
							<li><input type="password" placeholder="请输入密码"
								name="password" id="password" required="required">
								<p>字母数字长度6-10位</p></li>
						</ul>
						<div style="color: red;float: right;">${error}</div>
				</div>

				<div class="login-links" style="margin-left:32px;">
					<!-- <label for="remember-me"><input id="remember-me"
						type="checkbox">记住密码</label> <a href="#" class="am-fr">忘记密码</a> --> <a
						href="toRegister.html" class="zcnext am-fr am-btn-default">注册</a>
					<br />
				</div>
				<div class="am-cf">
					<input style="width: 246px; margin-left: 30px; border-radius:6px;"
						id="btn" type="button" name="" value="登 录"
						class="am-btn am-btn-primary am-btn-sm">
				</div>
				</form>

				<!-- <div class="partner">
					<h3>合作账号</h3>
					<div class="am-btn-group">
						<li><a href="#"><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span>
						</a></li>
						<li><a href="#"><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span>
						</a></li>
						<li><a href="#"><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span>
						</a></li>
					</div>
				</div> -->

			</div>
		</div>
	</div>


	<div class="footer ">
		<%@ include file="bottom.jsp"%>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>
	<script type="text/javascript">
		var reg = {
			name : /^[a-zA-Z0-9]{6,10}$/,
			password : /^[a-zA-Z0-9]{6,10}$/
		};
		var aLi = document.querySelectorAll('li');
		var arrObj = [];
		for (var i = 0; i < aLi.length; i++) {
			arrObj[i] = document.querySelectorAll('input')[i];
		}

		/*给每一个表单添加失去焦点事件*/
		for (var i = 0; i < aLi.length; i++) {
			if (i === 2)
				continue;
			arrObj[i].onblur = function() {
				if (this.value && reg[this.name].test(this.value)) {
					this.parentNode.style.height = '37px';
					this.className = 'right';
				} else {
					this.focus(); //当错误的时候将焦点返回给自己
					this.parentNode.style.height = '62px';
					this.className = 'wrong';
				}
			};
		};
		/*  var name=document.querySelector("#name").value;
		 var password=document.querySelector("#password").value; */
		var btn = document.querySelector("#btn");
		
		btn.onclick = function() {
		var name = document.querySelector("#name").value;
		var password = document.querySelector("#password").value;
			if (name.length > 0 && password.length > 0) {
				  if(/^[a-zA-Z0-9]{6,10}$/.test(name)&&/^[a-zA-Z0-9]{6,10}$/.test(password)){document.querySelector("#login").submit();}else{alert("用户名和密码输入有误");}
			} else {
				alert("用户名和密码不能为空");
			}
		}
	</script>
</body>

</html>