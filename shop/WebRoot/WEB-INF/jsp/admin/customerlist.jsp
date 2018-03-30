<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员管理-有点</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/css.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/css/manhuaDate.1.0.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/manhuaDate.1.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.7.2.min.js"></script>
	<!-- <script type="text/javascript" src="js/page.js" ></script> -->
	<script type="text/javascript">
$(function (){
  $("input.mh_date").manhuaDate({
    Event : "click",//可选               
    Left : 0,//弹出时间停靠的左边位置
    Top : -16,//弹出时间停靠的顶部边位置
    fuhao : "-",//日期连接符默认为-
    isTime : false,//是否开启时间值默认为false
    beginY : 1949,//年份的开始默认为1949
    endY :2100//年份的结束默认为2049
  });
});
</script>

</head>

<body>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="${pageContext.request.contextPath}/statics/images/coin02.png" /><span><a href="${pageContext.request.contextPath}/admin/main.html">首页</a><!-- &nbsp;-&nbsp;<a
					href="#">公共管理</a>&nbsp; -->-</span>&nbsp;<a href="${pageContext.request.contextPath}/admin/customerlist.html">客户管理</a>
			</div>
		</div>

		<div class="page">
			<!-- vip页面样式 -->
			<div class="vip">
				<div class="conform">
					<%-- <form action="admin/customerlist.html">
						<!-- <div class="cfD">
							时间段：<input class="vinput mh_date" type="text" readonly="true" />&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
							<input class="vinput mh_date" type="text" readonly="true" />
						</div> -->
						<div class="cfD">
							昵称：<input class="addUser" type="text" placeholder="" name="nickName"/>
							电话：<input class="addUser" type="text" placeholder="" name="phone"/>
							姓名：<input class="addUser" type="text" placeholder="" name="name"/>
							
							<input class="button" type="submit" value="查询"/>
							<a href="${pageContext.request.contextPath }/admin/customerlist.html">搜索</a>
							<!-- <a class="addA addA1" href="vipadd.html">新增会员+</a> <a
								class="addA addA1 addA2" href="vipadd.html">密码重置</a> -->
						</div>
					</form> --%>
				</div>
				<!-- vip 表格 显示 -->
				<div class="conShow">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<!-- <td width="66px" class="tdColor tdC">序号</td> -->
							<td width="100px" class="tdColor">昵称</td>
							<!-- <td width="100px" class="tdColor">密码</td> -->
							<td width="150px" class="tdColor">手机号码</td>
							<td width="100px" class="tdColor">姓名</td>
							<td width="240px" class="tdColor">身份证号</td>
							<td width="250px" class="tdColor">注册时间</td>
							<td width="130px" class="tdColor">操作</td>
						</tr>
						
						<c:forEach items="${customers}" var="customers">
						
							<tr>
							<!-- <td>1</td>
							<td><div class="onsImg onsImgv">
									<img src="img/banimg.png">
								</div></td> -->
							<input type="hidden" name="id" value="${customers.customerId}"/>
							<td>${customers.nickName}</td>
							<%-- <td>${customers.passWord}</td> --%>
							<td>${customers.phone}</td>
							<td>${customers.name}</td>
							<td>${customers.ID}</td>
							<td><fmt:formatDate value="${customers.registerTime}" type="both"/></td>
							<!-- <td>0.00<input class="vipinput" type="text" /><a
								class="vsAdd">增加</a></td>
							<td>总监</td> -->
							<td><a href="${pageContext.request.contextPath }/admin/customerupdate?id=${customers.customerId}"><img class="operation"
									src="${pageContext.request.contextPath }/statics/images/update.png"></a> <%-- <img class="operation delban"
								src="${pageContext.request.contextPath }/statics/images/delete.png"> --%></td>
						</tr>
						<!-- 删除弹出框 -->
	<div class="banDel">
		<div class="delete">
			<div class="close">
				<a><img src="${pageContext.request.contextPath }/statics/images/shanchu.png" /></a>
			</div>
			<p class="delP1">你确定要删除此条记录吗？</p>
			<p class="delP2">
				<a href="${pageContext.request.contextPath }/admin/customerdelete.html?id=${customers.customerId}" class="ok yes">确定</a><a href="javascript:history.back();" class="ok no">取消</a>
			</p>
		</div>
	</div>
	<!-- 删除弹出框  end-->
						
						</c:forEach>
					</table>
					<div class="paging" >
						<c:if test="${page>1}">
							<a href="${pageContext.request.contextPath}/admin/customerlist?pageIndex=1">首页</a>
							<a href="${pageContext.request.contextPath}/admin/customerlist?pageIndex=${page-1}">上一页</a>
						</c:if>
						
						<c:if test="${page<pageCount}">
							<a href="${pageContext.request.contextPath}/admin/customerlist?pageIndex=${page+1}">下一页</a>
							<a href="${pageContext.request.contextPath}/admin/customerlist?pageIndex=${pageCount}">尾页</a>
						</c:if>
					</div>
				</div>
				<!-- vip 表格 显示 end-->
			</div>
			<!-- vip页面样式end -->
		</div>

	</div>


	</body>

<script type="text/javascript">

// 广告弹出框
$(".delban").click(function(){
  $(".banDel").show();
});
$(".close").click(function(){
  $(".banDel").hide();
});
$(".no").click(function(){
  $(".banDel").hide();
});
// 广告弹出框 end
</script>
</html>