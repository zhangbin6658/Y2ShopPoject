<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>

<head lang="en">
<meta charset="UTF-8">
<title>注册</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
<link href="${pageContext.request.contextPath}/statics/css/dlstyle.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath}/statics/js/jquery-1.12.4.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

<style type="text/css">
	.test{display:none;}
</style>
</head>

<body>

	<div class="login-boxtitle">
		<a href="home/demo.html"><img alt=""
			src="${pageContext.request.contextPath}/statics/images/logobig.png" />
		</a>
	</div>

	<div class="res-banner">
		<div class="res-main">
			<div class="login-banner-bg">
				<span></span><img
					src="${pageContext.request.contextPath}/statics/images/big.jpg" />
			</div>
			<div class="login-box">

				<div class="am-tabs" id="doc-my-tabs">
					<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
						<li><a href="">手机号注册</a></li>
					</ul>

					<div class="am-tabs-bd">
						<div class="am-tab-panel" style="margin-top: -20px;">
							<form action="doRegister.html" id="registerForm" name="form" method="post">
								
								<div class="user-phone phone regex">
									<label for="phone"><i
										class="am-icon-mobile-phone am-icon-md"></i> </label> <input
										id="name" type="text" name="nickName"  class="text"
										required="required" placeholder="请输入用户名"><div id="exists" class="test" style="display: block; padding-top:2px;">请输入至少6位字符或数字</div>
										<img style="float:left;" id="image" alt="" src="">
								</div>
								<!-- onblur="checkPassWord(this);" -->
								<div class="user-pass regex">
									<label for="password"><i class="am-icon-lock"></i> </label> <input
										type="password" name="passWord" id="password" class="text"
										required="required" placeholder="设置密码" pattern="[a-zA-Z0-9]{6,10}" /><div class="test">请输入6-10位字符或数字</div>
								</div>
								<div class="user-pass regex">
								<!-- onblur="checkPassWordRepeat(this);" -->
									<label for="passwordRepeat"><i class="am-icon-lock"></i>
									</label>
										<input
										type="password" name="passwords" id="passwords" class="text"
										required="required" placeholder="确认密码" pattern="[a-zA-Z0-9]{6,10}" maxlength="18"/><div class="test">两次密码输入不一致</div>
								</div>
								<div class="user-phone regex">
								<!-- onblur="checkPhone(this);" -->
									<label for="phone"><i
										class="am-icon-mobile-phone am-icon-md"></i> </label> <input
										id="phone" type="text" name="phone" required="required" placeholder="请输入手机号" class="text"
										pattern="^1[3|5|7|8][0-9]{9}$" /><div class="test">手机格式输入有误</div>
								</div>
								<div class="verification">
									<label for="code"><i class="am-icon-code-fork"></i> </label> <input
										type="text" name="" id="code" placeholder="请输入验证码" onblur="" required="required"/>
								</div>

								<div class="am-cf">
									<input id="register" type="button" name="" value="注册"
										class="am-btn am-btn-primary am-btn-sm am-fl" />
								</div>
							</form>
							<input type="button" id="dyMobileButton" class="btn"
								value="发送验证码" />
							<div class="login-links">
								<label for="reader-me"> <input id="reader-me"
									type="checkbox"> 点击表示您同意商城《服务协议》 </label>
							</div>
							<hr>
						</div>
					</div>
				</div>

			</div>
		</div>

		<div class="footer ">
			<%@ include file="bottom.jsp" %>
		</div>
		<script
			src="${pageContext.request.contextPath}/statics/js/customer.js"></script>
			<script type="text/javascript">
				$(document).ready(function(){
					$("#name").bind("blur",function(){
					var nickName=$("#name").val();
					if(nickName!=null&&nickName!=''){
						$.ajax({
							url:"nickNameExist.json",
							type:"post",
							data:{nickName:nickName},
							dataType:"json",
							success:function(data){
								if(data.result=="exists"){
									
									/* $("#image").attr("src","statics/images/no.png"); */
									$("#name").val('');
									$("#name").focus();
								}else{
									/* $("#image").attr("src","statics/images/ok.png"); */
									
								}
							}
						})
					}else{
						$("#exists").html("请输入用户名").css({"color":"red","font-size":"12px"});
									$(".phone").css("height","60px");
									$("#name").focus();
					}
				})	
				});
				
				var text=document.getElementsByClassName("text");
				var regex=document.getElementsByClassName("regex");
				var test=document.getElementsByClassName("test");
				var check=document.getElementById("reader-me");
				var array=[];
				var reg = {
				nickName : 	/^[a-zA-Z0-9]{6,10}$/,
				passWord : 	/^[a-zA-Z0-9]{6,10}$/,
				passwords : /^[a-zA-Z0-9]{6,10}$/,
				phone :		/^1[3|5|7|8][0-9]{9}$/
				};
				for ( var i = 0; i < text.length; i++) {
					array[i]=text[i];
				}
				for ( var j = 0; j < text.length; j++) {
					if(j===2)
					continue;
					(function(j){
						text[j].onblur=function(){
						if (this.value && reg[this.name].test(this.value)) {
							regex[j].style.height="42px";
							test[j].style.cssText="display:none;";
						}else{
							regex[j].style.height="62px";
							test[j].style.cssText="display:block;font-size:12px; color:red;";
						}
					}
					})(j);
				};
				text[2].onblur=function(){
					if (this.value && this.value==password.value) {
						regex[2].style.height="42px";
						test[2].style.cssText="display:none;";
					}else{
						regex[2].style.height="62px";
						test[2].style.cssText="display:block;font-size:12px; color:red;";
					}
				}
				$("#register").click(function(){
						if(document.getElementById("password").value!=null && document.getElementById("password").value!=''&&
							/^[a-zA-Z0-9]{6,10}$/.test(document.getElementById("password").value)==true&&
							/^[a-zA-Z0-9]{6,10}$/.test(document.getElementById("name").value)==true&&
							/^1[3|5|7|8][0-9]{9}$/.test(document.getElementById("phone").value)==true&&
							document.getElementById("code").value!=null){
							if(check.checked==true){
							$("#registerForm").submit();
							}else{
							alert("请同意商城协议");
							}
						}else{
							alert("用户名,密码，手机号格式输入有误");
						}
					});
			</script>
</body>

</html>