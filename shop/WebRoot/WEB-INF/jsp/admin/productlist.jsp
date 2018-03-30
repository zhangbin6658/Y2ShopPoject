<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
	%>
	<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品列表</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/statics/css/css.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>
	
<!-- <script type="text/javascript" src="js/page.js" ></script> -->
<style type="text/css">
	.clearFix::after{clear:both; display: block;content:'';}
	/* .cfD  li::after,.cfD > div::after{clear:both; display: block;content:'';}; */
	.cfD::after{clear:both; display: block;content:'';}
	.cfD  li select,.cfD ul li  label,.cfD  li input{float:left;}
	ul li label{line-height: 30px;}
	.cfD  li select,.cfD  li input{width:160px;}
	.cfD   select{margin-right:20px;}
</style>
</head>

<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="${pageContext.request.contextPath}/statics/images/coin02.png" /><span><a href="${pageContext.request.contextPath}/admin/main.html">首页</a><!-- &nbsp;-&nbsp;<a
					href="#">公共管理</a>&nbsp; -->-</span>&nbsp;<a href="${pageContext.request.contextPath}/admin/productlist.html">商品管理</a>
			</div>
		</div>

		<div class="page">
			<!-- user页面样式 -->
			<div class="connoisseur">
				<div class="conform">
					<form id="list" method="post" action="productlist.html">
						<div class="cfD">
						<ul>
							<li><label class="control-label col-md-3 col-sm-3 col-xs-12">商品名称</label><input type="text" name="productName" placeholder="输入商品名称" style="width: 160px;height:30px;margin-left: 10px;"/></li>
							<li><label class="control-label col-md-3 col-sm-3 col-xs-12">一级分类</label>
							<div class="col-md-6 col-sm-6 col-xs-12 bbD">
        						<select id="queryCategoryLevel1" name="queryCategoryLevel1">
        							<option value="">--请选择--</option>
        							<c:forEach items="${productCategroy}" var="productCategroy">
        								<option value="${productCategroy.typeCode}">${productCategroy.typeName}</option>
        							</c:forEach>
        						</select>
							</div>
							</li>
							<li><label class="control-label col-md-3 col-sm-3 col-xs-12">二级分类</label>
							<div class="col-md-6 col-sm-6 col-xs-12 bbD">
							<input type="hidden" name="categorylevel2list" id="categorylevel2list"/>
        						<select name="queryCategoryLevel2" id="queryCategoryLevel2" class="form-control">
        							<c:if test="${proCategroy != null }">
									   <option value="">--请选择--</option>
									   <c:forEach var="proCategory" items="${proCategroy2}">
									   		<option <c:if test="${proCategroy2.typeCode== queryCategoryLevel2}">selected="selected"</c:if>
									   		value="${proCategroy2.typeCode}">${proCategroy2.typeName}</option>
									   </c:forEach>
									</c:if>
        						</select>
							</div>
							</li>
							<li>
							<label class="control-label col-md-3 col-sm-3 col-xs-12">三级分类</label>
							<div class="col-md-6 col-sm-6 col-xs-12 bbD">
        						<select name="queryCategoryLevel3" id="queryCategoryLevel3" class="form-control">
        							<c:if test="${categoryLevel3List != null }">
									   <option value="">--请选择--</option>
									   <c:forEach var="proCategory3" items="${proCategroy3}">
									   		<option <c:if test="${proCategroy3.typeCode == queryCategoryLevel3 }">selected="selected"</c:if>
									   		value="${proCategroy3.typeCode}">${dictionarytype.typeName}</option>
									   </c:forEach>
									</c:if>
        						</select>
							</div>
						</li>
						</ul>
							 
							
							
							
							
							<!-- <input class="userinput" type="text" placeholder="输入用户名">&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
							<input class="userinput vpr" type="text" placeholder="输入用户密码"> -->
							<a style="float:left; display:block; text-align: center; vertical-align: middle; line-height: 40px; margin-top: 50px;margin-left: 120px;" class="userbtn" id="find">查询</a>
							<a style="float:left; display:block; text-align: center; vertical-align: middle; line-height: 40px; margin-top: 50px; margin-left: 526px; " class="userbtn" href="${pageContext.request.contextPath}/admin/toproductsave.html?id=""">添加</a>
						</div>
					</form>
				</div>
				<!-- user 表格 显示 -->
				<div class="conShow" style="margin-left: 120px;">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<!-- <td width="66px" class="tdColor tdC">序号</td> -->
							<td width="150px" class="tdColor">商品图</td>
							<!-- <td width="150px" class="tdColor">商品标题</td> -->
							<td width="200px" class="tdColor">商品名称</td>
							<td width="100px" class="tdColor">商品价格</td>
							<td width="100px" class="tdColor">商品状态</td>
							<td width="240px" class="tdColor">操作</td>
						</tr>
						<c:forEach items="${productlist}" var="productlist">
							<tr height="40px">
								<input type="hidden" name="id" value="${productlist.productId}"/>
								<td><img alt="" width="80px" height="50px"
									src="${pageContext.request.contextPath}/statics/${productlist.productImage}"></td>
								<%-- <td>${productlist.productTitle}</td> --%>
								<td>${productlist.productName}</td>
								<td>${productlist.productPrice}</td>
								<c:if test="${productlist.productStatus==1}">
									<td>待审核</td>
								</c:if>
								<c:if test="${productlist.productStatus==2}">
									<td>审核通过</td>
								</c:if>
								<c:if test="${productlist.productStatus==3}">
									<td>审核未通过</td>
								</c:if>
								<c:if test="${productlist.productStatus==4}">
									<td>已上架</td>
								</c:if>
								<c:if test="${productlist.productStatus==5}">
									<td>库存不足</td>
								</c:if>
								<c:if test="${productlist.productStatus==6}">
									<td>已下架</td>
								</c:if>
								<td><a href="${pageContext.request.contextPath}/admin/toproductsave.html?id=${productlist.productId}"><img
										class="operation"
										src="${pageContext.request.contextPath}/statics/images/update.png"></a>
									
										<a href="${pageContext.request.contextPath }/admin/deleteProduct.html?id=${productlist.productId}" class="ok yes"><img class="operation delban" 
									src="${pageContext.request.contextPath}/statics/images/delete.png"></td></a>
							</tr>
												<!-- 删除弹出框 -->
	<div class="banDel">
		<div class="delete">
			<div class="close">
				<a><img src="${pageContext.request.contextPath }/statics/images/shanchu.png" /></a>
			</div>
			<p class="delP1">你确定要删除此条记录吗？</p>
			<p class="delP2">
				<a href="${pageContext.request.contextPath }/admin/deleteProduct.html?id=${productlist.productId}" class="ok yes">确定</a><a href="" class="ok no">取消</a>
			</p>
		</div>
	</div>
	<!-- 删除弹出框  end-->
						</c:forEach>
					</table>
					
					<div class="paging">
						<c:if test="${page>1}">
							<a
							href="${pageContext.request.contextPath}/admin/productlist?pageIndex=1">首页</a>
						<a
							href="${pageContext.request.contextPath}/admin/productlist?pageIndex=${page-1}">上一页</a>
						</c:if>
						<c:if test="${page<totalPageCount}">
							<a
							href="${pageContext.request.contextPath}/admin/productlist?pageIndex=${page+1}">下一页</a>
						<a
							href="${pageContext.request.contextPath}/admin/productlist?pageIndex=${totalPageCount}">尾页</a>
						</c:if>
					</div>
				</div>
				<!-- user 表格 显示 end-->
			</div>
			<!-- user页面样式end -->
		</div>

	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/productcategroy.js"></script>
<script type="text/javascript">

	// 广告弹出框
	$(".delban").click(function() {
		$(".banDel").show();
	});
	$(".close").click(function() {
		$(".banDel").hide();
	});
	$(".no").click(function() {
		$(".banDel").hide();
	});
	$
	// 广告弹出框 end
	$("#find").click(function(){
		$("#list").submit();
	});
</script>
	</html>