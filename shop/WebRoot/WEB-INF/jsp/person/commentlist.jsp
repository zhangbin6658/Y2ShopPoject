<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>发表评论</title>

<link
	href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/statics/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath}/statics/css/personal.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/statics/css/appstyle.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/statics/js/jquery-1.7.2.min.js"></script>
</head>

<body>
	<!--头 -->
	<header>
		<article>
			<div class="mt-logo">
				<!--顶部导航条 -->
				<%@ include file="top.jsp"%>
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
				<li class="index"><a href="#">首页</a></li>
				<li class="qc"><a href="#">闪购</a></li>
				<li class="qc"><a href="#">限时抢</a></li>
				<li class="qc"><a href="#">团购</a></li>
				<li class="qc last"><a href="#">大包装</a></li>
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

				<div class="user-comment">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">发表评论</strong> / <small>Make&nbsp;Comments</small>
						</div>
					</div>
					<hr />
					<form action="insertCommentary.html" method="post"
						enctype="multipart/form-data">
						<!-- 所有商品 -->
						<div class="comment-main">
							<!-- 每个商品 -->
							<c:set var="countp" scope="session" value="1"></c:set>
							<c:forEach var="order" items="${orderInfo }">
								<input name="orderCode${countp}" style="display: none"
									type="text" value="${order.orderCode }" />
								<div class="comment-list">
									<div class="item-pic">
										<a href="#" class="J_MakePoint"> <img
											src="${pageContext.request.contextPath}/statics/${order.productImage}"
											class="itempic">
										</a>
									</div>
									<div class="item-title">

										<div class="item-name">
											<a href="#">
												<p class="item-basic-info">${order.productName},${order.productTitle}</p>
											</a>
										</div>
										<div class="item-info">
											<div class="info-little">
												<span>单价：${order.productPrice}</span><br> <span>数量：<span>×</span>${order.orderCount}</span>
											</div>
											<div class="item-price">
												<input type="text" style="display: none"
													name="product${countp}" value="${order.productId }" />
												<!-- 价格：<strong>19.88元</strong> -->
											</div>
										</div>
									</div>
									<div class="clear"></div>

									<div name="" class="item-opinion">
										<ul name="title" id="title">
											<li id="one" onclick="onetitlevalue('#title${countp}')"><i
												class="op1"></i>好评</li>
											<li id="two" onclick="twotitlevalue('#title${countp}')"><i
												class="op2"></i>中评</li>
											<li id="three" onclick="threetitlevalue('#title${countp}')"><i
												class="op3"></i>差评</li>
										</ul>

										<input name="title${countp}" id="title${countp}"
											style="display: none" value="1" type="text" />
										<script type="text/javascript">
											function onetitlevalue(e) {

												$(e).attr("value", "好评")
											}
											function twotitlevalue(e) {
												$(e).attr("value", "中评")
											}
											function threetitlevalue(e) {
												$(e).attr("value", "差评")
											}
										</script>
									</div>
									<div class="item-comment">
										<textarea name="content${countp}"
											placeholder="请写下对宝贝的感受吧，对他人帮助很大哦！" required="required"></textarea>
									</div>
									<!-- <div class="filePic">
										<input id="uploadPic" type="file" name="files"
											class="inputPic" allowexts="jpeg,jpg,png,bmp"
											accept="image/*" multiple> <span>晒照片(0/5)</span>
										<img id="comPic" alt=""/>
										<script type="text/javascript">
											$("#uploadPic").on(change,function(){
												var picUrl = $("#uploadPic").val();
												alert(picUrl);
												fileFormat = picUrl.substring(filePath.lastIndexOf(".")).toLowerCase();
												// 检查是否是图片  
												if (!fileFormat.match(/.png|.jpg|.jpeg|.bmp/)) {
													error_prompt_alert('上传错误,文件格式必须为：png/jpg/jpeg/bmp');
													return;
												}
												$("#comPic").attr('src',
														picUrl);

											})
										</script>
									</div> -->
								</div>
								<c:set var="countp" value="${countp+1}"></c:set>

							</c:forEach>
							<input type="text" style="display: none" name="count"
								value="${countp-1}" />
							<!--多个商品评论-->
							<%-- <div class="comment-list">
								<div class="item-pic">
									<a href="#" class="J_MakePoint">
										<img src="${pageContext.request.contextPath}/statics/images/comment.jpg_400x400.jpg" class="itempic">
									</a>
								</div>

								<div class="item-title">

									<div class="item-name">
										<a href="#">
											<p class="item-basic-info">美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
										</a>
									</div>
									<div class="item-info">
										<div class="info-little">
											<span>颜色：洛阳牡丹</span>
											<span>包装：裸装</span>
										</div>
										<div class="item-price">
											价格：<strong>19.88元</strong>
										</div>
									</div>
								</div>
								<div class="clear"></div>
								<div class="item-comment">
									<textarea placeholder="请写下对宝贝的感受吧，对他人帮助很大哦！"></textarea>
								</div>
								<div class="filePic">
									<input type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*" >
									<span>晒照片(0/5)</span>
									<img src="${pageContext.request.contextPath}/statics/images/image.jpg" alt="">
								</div>
								<div class="item-opinion">
									<li><i class="op1"></i>好评</li>
									<li><i class="op2"></i>中评</li>
									<li><i class="op3"></i>差评</li>
								</div>
							</div>
							
							<div class="comment-list">
								<div class="item-pic">
									<a href="#" class="J_MakePoint">
										<img src="${pageContext.request.contextPath}/statics/images/comment.jpg_400x400.jpg" class="itempic">
									</a>
								</div>

								<div class="item-title">

									<div class="item-name">
										<a href="#">
											<p class="item-basic-info">美康粉黛醉美唇膏 持久保湿滋润防水不掉色</p>
										</a>
									</div>
									<div class="item-info">
										<div class="info-little">
											<span>颜色：洛阳牡丹</span>
											<span>包装：裸装</span>
										</div>
										<div class="item-price">
											价格：<strong>19.88元</strong>
										</div>
									</div>
								</div>
								<div class="clear"></div>
								<div class="item-comment">
									<textarea placeholder="请写下对宝贝的感受吧，对他人帮助很大哦！"></textarea>
								</div>
								<div class="filePic">
									<input type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*" >
									<span>晒照片(0/5)</span>
									<img src="${pageContext.request.contextPath}/statics/images/image.jpg" alt="">
								</div>
								<div class="item-opinion">
									<li><i class="op1"></i>好评</li>
									<li><i class="op2"></i>中评</li>
									<li><i class="op3"></i>差评</li>
								</div>
							</div> --%>
							<div class="info-btn">
								<input type="submit" class="am-btn am-btn-danger" value="发表评论" />
							</div>
					</form>
					<script type="text/javascript">
						$(document).ready(
								function() {
									$(".comment-list .item-opinion li").click(
											function() {
												$(this).prevAll().children('i')
														.removeClass("active");
												$(this).nextAll().children('i')
														.removeClass("active");
												$(this).children('i').addClass(
														"active");

											});
								})
					</script>



				</div>

			</div>

		</div>
		<!--底部-->
		<div class="footer">
			<%@ include file="bottom.jsp"%>
		</div>
	</div>

	<aside class="menu">
		<%@ include file="left.jsp"%>
	</aside>
	</div>

</body>

</html>