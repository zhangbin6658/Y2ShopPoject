<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>行家添加-有点</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/statics/css/css.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/statics/js/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/statics/js/messages_zh.js"></script>
<style type="text/css">
.bbD img {
	width: 160px;
	height: 100px;
	padding-left: 20px;
}

.bbD select {
	width: 240px;
	height: 40px;
	margin-left: 10px;
}

.bbD input,.bbD textarea,.bbD select {
	outline: none;
	padding: 8px 6px;
}

.clearFix::after {
	clear: both;
	content: '';
	display: block;
}

.bbD>span,.bbD>p,.bbD>input,.bbD>select {
	float: left;
}

.error {
	color: red;
}

.bbD .text2 {
	margin-left: -25px;
	overflow: auto;
}

.bbD div {
	display: none;
	color: red;
	padding-left: 16px;
}
</style>
</head>
<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img
					src="${pageContext.request.contextPath}/statics/images/coin02.png" /><span><a
					href="${pageContext.request.contextPath}/admin/main.html">首页</a> <!-- &nbsp;-&nbsp;<a
					href="#">公共管理</a>&nbsp; -->-</span>&nbsp;<a
					href="${pageContext.request.contextPath}/admin/productlist.html">商品管理</a>
			</div>
		</div>
		<div class="page">
			<!-- 上传广告页面样式 -->
			<div class="banneradd bor">
				<div class="baTopNo">
					<span>商品修改</span>
				</div>
				<form id="productsave" action="productsave.html" method="post"
					enctype="multipart/form-data">
					<div class="baBody">
						<div class="bbD clearFix" style="">
							<span>商品图片：</span>
							<!-- <div class="vipHead vipHead1 " style="background-color: red; float:left;" > -->
							<img
								src="${pageContext.request.contextPath}/statics/${product.productImage}"
								style="float:left;" />
							<!-- <p class="vipP" >上传图片</p> -->
							<input type="file" id="image" name="image"
								value="${product.productImage}" required="required" />
							<!-- </div> -->
						</div>
						<div class="bbD clearFix">
							<span>商品名称：</span><input type="text" name="productName"
								value="${product.productName}" required="required"
								class="input3" />
						</div>

						<div class="bbD clearFix">
							<span>商品标题：</span><input type="text" name="productTitle"
								required="required" value="${product.productTitle}"
								class="input3" />
						</div>
						<div class="bbD clearFix">
							<span>商品库存：</span><input type="text" name="productCount"
								required="required" minlength="1"
								value="${product.productCount}" class="input3" /><div>请输入整数数字</div>
						</div>
						<div class="bbD clearFix">
							<span>商品销量：</span><input type="text" name="productSail"
								minlength="1" value="${product.productSail}" class="input3" /><div>请输入整数数字</div>
						</div>

						<div class="bbD clearFix">
							<span>一级分类：</span> <select id="queryCategoryLevel1"
								name="productOneId" class="form-control">
								<option value="">--请选择--</option>
								<c:forEach items="${productCategroy}" var="productCategroy">
									<option value="${productCategroy.typeCode}"
										<c:if test="${productCategroy.typeCode== productOneId}">selected="selected"</c:if>>
										${productCategroy.typeName}</option>
								</c:forEach>
							</select>
						</div>

						<div class="bbD clearFix">
							<span>二级分类：</span> <select name="productTwoId"
								id="queryCategoryLevel2" class="form-control">
								<c:if test="${proCategroy != null }">
									<option value="">--请选择--</option>
									<c:forEach var="proCategory" items="${proCategroy2}">
										<option
											<c:if test="${proCategroy2.typeCode== productTwoId}">selected="selected"</c:if>
											value="${proCategroy2.typeCode}">${proCategroy2.typeName}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>

						<div class="bbD clearFix">
							<span>三级分类：</span> <select name="productThreeId"
								id="queryCategoryLevel3" class="form-control">
								<c:if test="${categoryLevel3List != null }">
									<option value="">--请选择--</option>
									<c:forEach var="proCategory3" items="${proCategroy3}">
										<option
											<c:if test="${proCategroy3.typeCode == productThreeId }">selected="selected"</c:if>
											value="${proCategroy3.typeCode}">${dictionarytype.typeName}</option>
									</c:forEach>
								</c:if>
							</select>

						</div>

						<div class="bbD clearFix">
							<span>商品重量：</span><input type="text" name="productWeight"
								required="required" value="${product.productWeight}"
								class="input3" /><div>请输入数字</div>
						</div>

						<div class="bbD clearFix">
							<span>商品规格：</span><input type="text" name="productSize"
								required="required" value="${product.productSize}"
								class="input3" />
							<div></div>
						</div>

						<div class="bbD clearFix">
							<span>商品价格：</span><input type="text" name="productPrice"
								value="${product.productPrice}" class="input3" />
							<div>请输入小数或整数</div>
						</div>

						<div class="bbD clearFix">
							<span>发货地点：</span><input type="text" name="productAddress"
								required="required" value="${product.productAddress}"
								class="input3" />
							
						</div>
						<div class="bbD clearFix" style="">
							<span>商品介绍：</span>
							<textarea class="text2" name="productIntroduction"
								style="float: left; margin-left:10px;" required="required"
								value="${product.productIntroduction}">${product.productIntroduction}</textarea>
							<!-- <div>aaa</div> -->
						</div>
						<div class="bbD ">
							<span>审核状态：</span>
							<%-- <c:forEach items="${productState}" var="productState"> --%>
							<label class="lar"><input type="radio"
								name="productStatus" checked="checked" value="1"
								<c:if test="${product.productStatus==1}">checked</c:if> />待审核</label> <label
								class="lar"><input type="radio" name="productStatus"
								value="2"
								<c:if test="${product.productStatus==2}">checked</c:if> />审核通过</label> <label
								class="lar"><input type="radio" name="productStatus"
								value="3"
								<c:if test="${product.productStatus==3}">checked</c:if> />审核未通过</label>
							<label class="lar"><input type="radio"
								name="productStatus" value="4"
								<c:if test="${product.productStatus==4}">checked</c:if> />上架</label> <label
								class="lar"><input type="radio" name="productStatus"
								value="5"
								<c:if test="${product.productStatus==5}">checked</c:if> />库存不足</label> <label
								class="lar"><input type="radio" name="productStatus"
								value="6"
								<c:if test="${product.productStatus==6}">checked</c:if> />下架</label>
							<%-- </c:forEach> --%>
						</div>

						<div class="bbD">
							<p class="bbDP">
								<input id="ok" class="btn_ok btn_yes" value="修改">
								<!-- 修改</button> -->
								<a class="btn_ok btn_no" href="javascript:history.back();">取消</a>
							</p>
						</div>
					</div>
				</form>
			</div>
			<!-- 上传广告页面样式end -->
		</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/statics/js/productcategroy.js"></script>
	<script type="text/javascript">
		var reg = {
			/* productName : /^[A-Za-z0-9\u4e00-\u9fa5]{8,12}$/,
        	productTitle : /^[A-Za-z0-9\u4e00-\u9fa5]{16,20}$/, */
        	productCount:  /^\d{1,10}$/,
        /* productSail:  /^[1-9]/, */
        	productWeight: /^[\d.\d|\d]{1,10}$/,
        	productPrice: /^[\d.\d|\d]{1,10}$/
			/* productIntroduction : /^[1-9a-zA-Z_]\w$/ */

		};
		var aLi = document.querySelectorAll('.bbD div');
		var arrObj = [];
		for (var i = 0; i < aLi.length; i++) {
			arrObj[i] = document.querySelectorAll('.bbD input.input3')[i];
		}

		/*给每一个表单添加失去焦点事件*//*  if(i === 2)continue; */
		for (var i = 0; i < aLi.length; i++) {
			(function(i){
				arrObj[i].onblur = function() {
				if (this.value && reg[this.name].test(this.value)) {
				
					this.nextSibling.style.display = "none";
				} else {
					this.focus(); //当错误的时候将焦点返回给自己
					this.nextSibling.style.display = "block";
				}
			};
		})(i);
			
		};
		
		
		document.getElementById("ok").onclick=function(){
			var image=document.getElementById("image").value;
		     	var categroy1=document.getElementById("queryCategoryLevel1").value;
				var categroy2=document.getElementById("queryCategoryLevel2").value;
				if(image!=null &&image!=''){
					if(categroy1!=null && categroy1!=""){
						 if(categroy2!=null && categroy2!=""){
							 document.getElementById("productsave").submit();
						 }else{
							 alert("请选择商品二级分类");
						 }
					}else{
						alert("请选择商品一级分类");
					}
				}else{
					alert("请上传图片");
				}
		};
		
		
		
	</script>
</body>
</html>