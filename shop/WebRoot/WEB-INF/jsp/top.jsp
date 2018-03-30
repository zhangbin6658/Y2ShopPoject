<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--顶部导航条 -->
			
			<div class="am-container header">
				<c:if test="${sessionScope.name==null}">
					<ul class="message-l">
					<div class="topMessage">
						<div class="menu-hd">
							<a href="toLogin.html" target="_top" class="h">亲，请登录</a>
							<a href="toRegister.html" target="_top">免费注册</a>
						</div>
					</div>
				</ul>
				</c:if>
				<c:if test="${sessionScope.name!=null}">
				<ul class="message-r">
					<div class="topMessage home ">
						<marquee scrollamount="3" direction="up"><h3 style="float:left; color: red;">欢迎</h3>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:blue;">${sessionScope.name}</span></marquee>
					</div>
					<div class="topMessage home">
						<div class="menu-hd"><a href="${pageContext.request.contextPath}/index.html" target="_top" class="h">商城首页</a></div>
					</div>
					<div class="topMessage my-shangcheng">
						<div class="menu-hd MyShangcheng"><a href="${pageContext.request.contextPath}/personal" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
					</div>
					<div class="topMessage mini-cart">
						<div class="menu-hd"><a id="mc-menu-hd" href="${pageContext.request.contextPath}/myShopCart" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h"></strong></a></div>
					</div>
					<div class="topMessage favorite">
						<div class="menu-hd"><a href="${pageContext.request.contextPath}/logout" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>退出</span></a></div>
					</div>
				</ul>
				</c:if>
				</div>

				
				
