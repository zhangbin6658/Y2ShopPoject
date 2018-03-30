<i><%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>会员编辑-有点</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/statics/css/css.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>
<style type="text/css">
	*{font-style: normal;}
	.clearFix::after{content:'';display:block;clear:both;}
	.bbD >span,.bbD > input,.bbD > div{float:left;font-style: normal;}
	.bbD > input{outline:none;}
	.bbD{margin-left:50px;}
	.bbD  div{color: red;padding-left: 16px;display: none;}
</style>
</head>
<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
			<img src="${pageContext.request.contextPath}/statics/images/coin02.png" /><span><a href="${pageContext.request.contextPath}/admin/main.html">首页</a><!-- &nbsp;-&nbsp;<a
					href="#">公共管理</a>&nbsp; -->-</span>&nbsp;<a href="${pageContext.request.contextPath}/admin/customerlist.html">客户管理</a>
				<%-- <img src="${pageContext.request.contextPath}/statics/images/coin02.png"><span><a href="#">首页</a>&nbsp;-&nbsp;<a href="#">公共管理</a>&nbsp;-</span>&nbsp;会员编辑 --%>
			</div>
		</div>
		<div class="page ">
			<!-- 上传广告页面样式 -->
			<div class="banneradd bor ">
			<div class="baTopNo">
					<span>订单修改</span>
				</div>
			<form action="customerupdatesave.html" method="post" id="updatecustomer">
				<!-- <div class="baTopNo">
					<span>会员编辑</span>
				</div>
				<div class="baBody">
					<div class="bbD">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;头像：
						<div class="vipHead">
							<img src="img/userPICS.png" />
							<p class="vipP">更换头像</p>
							<input class="file1" type="file" />
						</div>
					</div> -->	
					<input type="hidden" name="id" value="${customer.customerId}">
					<div class="bbD clearFix">
						<span>客户昵称：</span><input type="text" class="input3 message" value="${customer.nickName}" name="nickName" required="required">
						<div>昵称</div>
					</div>
					<div class="bbD clearFix">
						<span>客户密码：</span><input type="text" class="input3 message" value="${customer.passWord}" name="passWord" required="required">
						<div>昵称</div>
					</div>
					<div class="bbD clearFix">
						<span>手机号码：</span><input type="text" class="input3 message" value="${customer.phone}" name="phone" required="required">
						<div>昵称</div>
					</div>
					<!-- <div class="bbD">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;余额：&nbsp;&nbsp;&nbsp;0.00元</div> -->
					<div class="bbD clearFix">
						<span>注册日期：</span><input class="input3" type="text" value="<fmt:formatDate value="${customer.registerTime}" type="both"/>" name="registerTime" readonly="readonly">
					</div>
					<!-- <fmt:formatDate value="${customer.registerTime}" type="both"/> -->
					<div class="bbD clearFix">
						<span>客户积分：</span><input class="input3 message" type="text" value="${customer.score}" name="score">
						<div>昵称</div>
					</div>
					<div class="bbD clearFix">
						<span>客户姓名：</span><input class="input3" type="text" value="${customer.name}" readonly="readonly" name="name">
					</div>
					<div class="bbD clearFix">
						<span>身份证号：</span><input class="input3" type="text" value="${customer.ID}" readonly name="ID">
					</div>
					<div class="bbD ">
						<p class="bbDP">
							<input id="btn" class="btn_ok btn_yes" href="" value="修改">
							<a class="btn_ok btn_no" href="#">取消</a>
						</p>
					</div>
				</div>
				</form>
			</div>

			<!-- 上传广告页面样式end -->
		</div>
	<div></div>
	<script type="text/javascript">
	var reg = {
        nickName :/^[a-zA-Z_]\w{5,17}$/,
        passWord : /^[1-9a-zA-Z_]\w{5,10}$/,
        phone:  /^[1-9]{11}$/,
        score: /^\d.\d|\d$/
        /* name: "/^[1-9a-zA-Z_]\w$/",
        ID:/^\d{18}$/ */
    };
    var aLi = document.querySelectorAll('.bbD div');
    var arrObj = [];
    for( var i=0; i<aLi.length; i++ ){
        arrObj[i] = document.querySelectorAll('.bbD input.message')[i];
    }
   
     for( var i=0; i<aLi.length; i++ ){
        arrObj[i].onblur = function () {
            if(this.value && reg[this.name].test(this.value)){
             this.nextSibling.style.display="none";
            }else{
                this.focus(); //当错误的时候将焦点返回给自己
               /*  this.nextSibling.style.display="block"; */
             this.nextSibling.style.display="block";
            }
        };
    };
    	
		
		document.querySelector("#btn").onclick=function(){
			document.getElementById("updatecustomer").submit();
		}
	</script>
</body>
</html></i>