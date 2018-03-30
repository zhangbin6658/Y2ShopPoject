<%@page import="com.mast.shop.tools.EncryptUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'productGategroy.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
/* public css start */
* {
	padding: 0;
	margin: 0;
}

.clearFix::after {
	content: '';
	display: block;
	clear: both;
}

.blue {
	background: blue ! important;
}

.green {
	background: green ! important;
}

.red {
	background: red ! important;
}

a {
	text-decoration: none;
}

ul {
	list-style: none;
}
/* public css end */
.list-left {
	margin-left: 30px;
	width: 180px;
	float: left;
	margin-top:90px;
}

.list-left li {
	height: 45px;
	position: relative;
	border-bottom: 1px solid #f00;
	background-color: rgba(100, 255, 100, 0.5)
}
/*.list-left a:hover{background-color:red;}*/
.list-left li span {
	color: deepblue;
	display: block;
	height: 45px;
	font-size: 14px;
	line-height: 45px;
	border-bottom: 1px solid red;
	padding: 0 20px;
}

.list-left li i {
	width: 8px;
	height: 20px;
	font-style: normal;
	font-family: "宋体";
	position: absolute;
	right: 10px;
	color: red;
	line-height: 45px;
	top: 0;
}

/*.list-right start */
.list-right {
	margin-top:84px;
}

.list {
	float: left;
	height:60px;
	width: 1000px;
	border: 1px solid red;
	opacity:0;
	margin-top: 2px;
	margin-left: 25px;
	font-size:12px;
	overflow: hidden;
}

.list-right a {
	width: 260px;
	height: 150px;
	display:block;
	border:1px solid blue;
}

.list-right img{
	width:100%;
	height:100%;
	overflow: hidden;
}

.list-right p,.list-right span {
	font-size: 14px;
	font-family: "宋体";
	padding-left: 15px;
	padding-bottom: 1px;
}

.list-right p {
	color: ;
}

.list-right span {
	color: ;
}

.list-right li {
	
}
/* .list-right end */
/*  */
.page  li{float:left;padding:0 20px; background-color: skyblue;}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>
</head>

<body>
	<div class="clearFix" id="wrap">
		

		<div class="list-left" >
			<a href="${pageContext.request.contextPath}/productCategroy.html"><span class="red" style="width:180px; display: block;height:36px;line-height: 36px;text-indent: 20px; color:#fff;">商品展示</span></a>
			<ul class="clearFix">
				<c:forEach items="${list}" var="productcategroy1">
				
					<li class="procategroy1"><a href="${pageContext.request.contextPath}/productCategroy.html?procategroy1=${productcategroy1.typeCode}&pageIndex=1"> <input class="code"
							type="hidden" value="${productcategroy1.typeCode}" /> <span
							class="typename">${productcategroy1.typeName}</span><i>></i> </a>
					</li>
				</c:forEach>
			</ul>
		</div>
		
		<p class="title" style="text-indent: 28px;"></p>
		<div class="list" id="list" style="">
			<%-- <c:forEach items="${proCategroy2}" var="proCategroy2">
				<ul>
					<li>${proCategroy2.typeName}</li>
				</ul>
			</c:forEach> --%>
		</div>
		<div class="list-right " style="margin-left:18px;" >
			
			<ul class="clearFix" style="width: 1386px;">
				<c:if test="${fn:length(productlist)>0}">
					<c:forEach items="${productlist}" var="product">
					<input name="id" type="hidden" value="${product.productId}">
					<li style="float:left; padding:10px 8px;"><a href="toProductShow?id=${product.productId}"><img
					src="${pageContext.request.contextPath}/statics/${product.productImage}"></a>
					<div>
						<p style="width:240px; display: block; padding-top:2px; font-family:宋体">商品名称：${product.productName}</p>
						<p style="padding-top:2px; font-family: 宋体;" >商品价格：${product.productPrice}</p>
						<span style="width:240px; display: block;padding-top:2px; font-family:Microsoft yahei;">商品简介：${product.productTitle}</span>
					</div>
					</li>
		   		</c:forEach>
				</c:if>
				<c:if test="${fn:length(productlist)<=0}">
					<p style="margin-left: 200px;">没有查询到此商品</p>
				</c:if>
			</ul>
		</div>
		   <div class="page" style="margin-left:680px;">
		   		<c:if test="${page>1}">
		   			<a href="${pageContext.request.contextPath}/productCategroy.html?pageIndex=1">首页</a>	
		   			<a href="${pageContext.request.contextPath}/productCategroy.html?pageIndex=${page-1}">上一页</a>
		   		</c:if>
		   		<c:if test="${page<pageCount}">
		   			<a href="${pageContext.request.contextPath}/productCategroy.html?pageIndex=${page+1}">下一页</a>
		   			<a href="${pageContext.request.contextPath}/productCategroy.html?pageIndex=${pageCount}">尾页</a>
		   		</c:if>
		   </div>
	</div>
	
	<script type="text/javascript">
		var procategroy1 = document.getElementsByClassName("procategroy1");
		var length = procategroy1.length;
		var code = document.getElementsByClassName("code");
		var typename = document.getElementsByClassName("typename");
		var list = document.getElementById("list");
		var array = [];
		var j;
		for ( var i = 0; i < length; i++) {
			array[i] = document.getElementsByClassName("procategroy1")[i];
		}
		for (j = 0; j < length; j++) {
			(function(j) {
				array[j].onmouseover = function() {
					if (code[j].value != null && code[j].value != "") {
						var procode = code[j].value;
						$.ajax({
							type : "get",
							dataType : "json",
							data : {
								typeCode : procode
							},
							url : "admin/procategroy2.json",
							success : function(data) {
							    var strJson = eval(data);
								$(".title").html(typename[j].innerHTML);
								list.style.cssText="opacity:1;";
								$(".list").html("<ul id='listui' class='clearFix'></ul>");
								for(var u=0;u<strJson.length;u++){
								  $("#listui").append("<a style='font-style:normal;' href='${pageContext.request.contextPath}/productCategroy.html?procategroy2="+strJson[u].typeCode+"&pageIndex=1'  class='prolist'><li style='padding:10px 40px; float:left; '>"+strJson[u].typeName+"</li></a>");
								}
							},
							error : function() {
								alert("错误");
							}
						});
					} else {
						alert();
					}
				};
			})(j);
			/* var prolist=document.querySelectorAll("prolist");
			var length=prolist.length;
			for (var i = 0; i < length; i++) {
				prolist[i].click(function(){
				alert();
			});
			} */
			
			
		}
	</script>
</body>
</html>
