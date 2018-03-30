<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>地址管理</title>

<link
	href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath}/statics/css/personal.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/statics/css/addstyle.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/statics/result/message.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/statics/result/bootstrap.min.css" rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/js/amazeuis.js"></script>

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
		<div class="long-title">
			<span class="all-goods">全部分类</span>
		</div>
		<div class="nav-cont">
			<ul>
				<li class="index"><a href="#">首页</a>
				</li>
				<li class="qc"><a href="#">闪购</a>
				</li>
				<li class="qc"><a href="#">限时抢</a>
				</li>
				<li class="qc"><a href="#">团购</a>
				</li>
				<li class="qc last"><a href="#">大包装</a>
				</li>
			</ul>
			<div class="nav-extra">
				<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利 <i
					class="am-icon-angle-right" style="padding-left: 10px;"></i>
			</div>
		</div>
	</div>
	<b class="line"></b>

	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-address">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small>
						</div>
					</div>
					<hr />
					<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
						<c:if test="${addressList != null}">
							<c:forEach var="address" items="${addressList}">
								<c:if test="${address.addressDefault == '是' }">
									<li class="user-addresslist defaultAddr">
								</c:if>
								<c:if test="${address.addressDefault == '否' }">
									<li class="user-addresslist">
								</c:if>
								<span class="new-option-r"><i
									class="am-icon-check-circle"></i> <c:if
										test="${address.addressDefault == '是' }">默认地址</c:if> <c:if
										test="${address.addressDefault == '否' }">
										<a
											href="updateAddress.html?addressId=${address.addressId }&n=1">设为默认</a>
									</c:if> </span>
								<p class="new-tit new-p-re">
									<span class="new-txt">${address.addressSignName }</span> <span
										class="new-txt-rd2">${address.addressSignPhone }</span>
								</p>
								<div class="new-mu_l2a new-p-re">
									<p class="new-mu_l2cw">
										<span class="title">地址：</span> <span class="province">${address.addressName
											}</span>
										<!-- <span class="city">武汉</span>市 <span class="dist">洪山</span>区 <span
										class="street">雄楚大道666号(中南财经政法大学)</span> -->
									</p>
								</div>
								<div class="new-addr-btn">
									<a href="toAddress.html?addressId=${address.addressId }"><i
										class="am-icon-edit"></i>编辑</a> <span class="new-addr-bar">|</span>
									<a href="deleteAddress.html?addressId=${address.addressId}"
										onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a>
								</div>
								</li>


							</c:forEach>
						</c:if>
					</ul>
					<div class="clear"></div>
					<a class="new-abtn-type"
						data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
					<!--例子-->
					<div class="am-modal am-modal-no-btn" id="doc-modal-1">

						<div class="add-dress">

							<!--标题 -->
							<div class="am-cf am-padding">
								<div class="am-fl am-cf">
									<strong class="am-text-danger am-text-lg"> <c:if
											test="${updateAddress == null }">新增地址
									</strong> / <small>Add&nbsp;address</small>
									</c:if>
									<c:if test="${updateAddress != null }">编辑地址</strong> / <small>Update&nbsp;address</small>
									</c:if>
								</div>
							</div>
							<hr />

							<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
								<c:if test="${updateAddress == null }">
									<form action="addAddress.html" class="am-form am-form-horizontal" method="post">
								</c:if>
								<c:if test="${updateAddress != null }">
									<form action="updateAddress.html?addressId=${updateAddress.addressId }&n=2" class="am-form am-form-horizontal" method="post">
								</c:if>
									<%-- <input type="text" name="addressId" style="display: none" value="${updateAddress.addressId }" /> --%>
									<div class="am-form-group">
									<label for="user-name" class="am-form-label">收货人</label>
									<div class="am-form-content">
										<input type="text" id="addressSignName" name="addressSignName"
											placeholder="收货人" required="required"
											value="${updateAddress.addressSignName }" />
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">手机号码</label>
									<div class="am-form-content">
										<input id="phone" name="addressSignPhone" placeholder="手机号必填"
											type="text" required="required" pattern="^1[3578][0-9]{9}$"
											value="${updateAddress.addressSignPhone }" />
									</div>
								</div>
								<div class="am-form-group">
									<label for="user-address" class="am-form-label">所在地</label>
									<div class="am-form-content address">
										<select id="province" name="province" data-am-selected>
											<option value="请选择">请选择</option>
										</select> <select id="city" name="city" data-am-selected>
											<option value="请选择">请选择</option>
										</select> <select id="town" name="town" data-am-selected>
											<option value="请选择">请选择</option>
										</select>
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-intro" class="am-form-label">详细地址</label>
									<div class="am-form-content">
										<textarea class="" rows="3" id="intro" name="introduce" placeholder="输入详细地址"
											required="required"></textarea>
										<small>100字以内写出你的详细地址...</small>
									</div>
								</div>

								<div class="am-form-group">
									<div class="am-u-sm-9 am-u-sm-push-3">
										<input type="submit" class="am-btn am-btn-danger" value="保存" />
										<a href="toPerson.html" class="am-close am-btn am-btn-danger"
											data-am-modal-close>取消</a>
									</div>
								</div>
								</form>
							</div>

						</div>

					</div>
					<script src="${pageContext.request.contextPath}/statics/js/area.js"></script>
					<script
						src="${pageContext.request.contextPath}/statics/js/select.js"></script>

				</div>
				<script src="${pageContext.request.contextPath}/statics/result/message.js" type="text/javascript"></script>
				<script src="${pageContext.request.contextPath}/statics/result/result.js" type="text/javascript"></script>
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
								}
							
							
								$(".new-option-r").click(
										function() {
											$(this).parent('.user-addresslist')
													.addClass("defaultAddr")
													.siblings().removeClass(
															"defaultAddr");
										});

								var $ww = $(window).width();
								if ($ww > 640) {
									$("#doc-modal-1").removeClass(
											"am-modal am-modal-no-btn")
								}

							});
				</script>

				<div class="clear"></div>

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