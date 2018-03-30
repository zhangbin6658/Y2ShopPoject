<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="am-container header">
					<c:if test="${sessionScope.name==null}">
						<ul class="message-l">
						<div class="topMessage">
							<div class="menu-hd">
								<a href="toHome.html" target="_top" class="h">亲，请登录</a> <a
									href="#" target="_top">免费注册</a>
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
							<div class="menu-hd">
								<a href="${pageContext.request.contextPath}/index.html" target="" class="h">商城首页</a>
							</div>
						</div>
						<div class="topMessage my-shangcheng">
							<div class="menu-hd MyShangcheng">
								<a href="${pageContext.request.contextPath}/toPerson.html" target="_top"><i
									class="am-icon-user am-icon-fw"></i>个人中心</a>
							</div>
						</div>
						<div class="topMessage mini-cart">
							<div class="menu-hd">
								<a id="mc-menu-hd" href="${pageContext.request.contextPath}/myShopCart.html" target="_top"><i
									class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
									id="J_MiniCartNum" class="h"></strong> </a>
							</div>
						</div>
						<div class="topMessage favorite">
							<div class="menu-hd">
								<a href="${pageContext.request.contextPath}/logout.html" target="_top"><i
									class="am-icon-heart am-icon-fw"></i><span>退出</span> </a>
							</div>
					</ul>
					</c:if>
				</div>

				<!--悬浮搜索框-->

				<%-- <div class="nav white">
					<div class="logoBig">
						<li><img
							src="${pageContext.request.contextPath}/statics/images/logobig.png" />
						</li>
					</div>

					<div class="search-bar pr">
						<a name="index_none_header_sysc" href="#"></a>
						<form>
							<input id="searchInput" name="index_none_header_sysc" type="text"
								placeholder="搜索" autocomplete="off"> <input
								id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
								type="submit">
						</form>
					</div>
				</div>

				<div class="clear"></div> --%>