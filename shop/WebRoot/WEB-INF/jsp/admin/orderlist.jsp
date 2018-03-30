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
<style type="text/css">
	.updateOrder{margin-left:50px; width:100px; height:30px; background: rgba(1,173,255,.5); font-size: 12px; color: #fff; float: left;}
	.updateOrder:hover{cursor: pointer;}
</style>
</head>

<body onload="autoRowSpan(tb,0,0)">
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
				<img src="${pageContext.request.contextPath}/statics/images/coin02.png" /><span><a href="${pageContext.request.contextPath}/admin/main.html">首页</a><!-- &nbsp;-&nbsp;<a
					href="#">公共管理</a>&nbsp; -->-</span>&nbsp;<a href="${pageContext.request.contextPath}/admin/orderlist.html">订单管理</a>
			</div>
		</div>

		<div class="page">
			<!-- vip页面样式 -->
			<div class="baTopNo">
					<span>订单显示</span>
				</div>
			<div class="vip">
				
				<!-- vip 表格 显示 -->
				<div class="conShow">
				<%-- ${orderlist.nickName} --%>
					<table border="1" cellspacing="0" cellpadding="0" id="">
						<tr>
							<td width="180px" class="tdColor tdC">订单编号</td>
							<!-- <td width="100px" class="tdColor">昵称</td> -->
							<!-- <td width="100px" class="tdColor">密码</td> -->
							<td width="150px" class="tdColor">商品图片</td>
							<td width="100px" class="tdColor">商品名称</td>
							<td width="80px" class="tdColor">购买数量</td>
							<td width="80px" class="tdColor">商品价格</td>
							<!-- <td width="150px" class="tdColor">联系方式</td> -->
							<td width="80px" class="tdColor">订单状态</td>
							<td width="280px" class="tdColor">操作</td>
						</tr>
						<c:forEach items="${orderlist}" var="orderlist">
							<tr>
							<!-- <td>1</td>
							<td><div class="onsImg onsImgv">
									<img src="img/banimg.png">
								</div></td> -->
							
							<td>${orderlist.orderCode}</td>
							<%-- <td>${orderlist.nickName}</td> --%>
							<td><img alt="" width="120px" height="80px" src="${pageContext.request.contextPath }/statics/${orderlist.productImage}"></td>
							<td>${orderlist.productName}</td>
							<td>${orderlist.orderCount}</td>
							<td>${orderlist.productPrice}</td>
							<%-- <td>${orderlist.phone}</td> --%>
							<c:if test="${orderlist.orderState==1}">
								<td>待付款</td>
							</c:if>
							<c:if test="${orderlist.orderState==2}">
								<td>取消订单</td>
							</c:if>
							<c:if test="${orderlist.orderState==3}">
								<td>待发货</td>
							</c:if>
							<c:if test="${orderlist.orderState==4}">
								<td>待收货</td>
							</c:if>
							<c:if test="${orderlist.orderState==5}">
								<td>待评价</td>
							</c:if>
							<c:if test="${orderlist.orderState==6}">
								<td>交易成功</td>
							</c:if>
							<c:if test="${orderlist.orderState==7}">
								<td>退货退款</td>
							</c:if>
							<c:if test="${orderlist.orderState==8}">
								<td>退款</td>
							</c:if>
							<c:if test="${orderlist.orderState==9}">
								<td>投诉中</td>
							</c:if>
							
							<td><%-- <a href="javascript:void(0);"><img class="operation"
									src="${pageContext.request.contextPath }/statics/images/update.png"></a> --%> 
									<c:if test="${orderlist.orderState==3}">
									<form action="orderupdate.html" method="post">
									<input type="hidden" name="id" value="${orderlist.orderId}"/>
									<input class="updateOrder"  type="submit" value="正在发货...">
									</form>
									</c:if>
									<a href="${pageContext.request.contextPath }/admin/orderdelete.html?id=${orderlist.orderId}"><img class="operation delban"
								src="${pageContext.request.contextPath }/statics/images/delete.png"></a>
								</td>
						</tr>
						<!-- 删除弹出框 -->
	<div class="banDel">
		<div class="delete">
			<div class="close">
				<a><img src="${pageContext.request.contextPath }/statics/images/shanchu.png" /></a>
			</div>
			<p class="delP1">你确定要删除此条记录吗？</p>
			<p class="delP2">
				<a href="${pageContext.request.contextPath }/admin/orderdelete.html?id=${orderlist.orderId}" class="ok yes">确定</a><a href="" class="ok no" >取消</a>
			</p>
		</div>
	</div>
	<!-- 删除弹出框  end-->
						
						</c:forEach>
					</table>
					<div class="paging" >
						<c:if test="${page>1}">
							<a href="${pageContext.request.contextPath}/admin/orderlist.html?pageIndex=1">首页</a>
							<a href="${pageContext.request.contextPath}/admin/orderlist.html?pageIndex=${page-1}">上一页</a>
						</c:if>
						
						<c:if test="${page<pageCount}">
							<a href="${pageContext.request.contextPath}/admin/orderlist.html?pageIndex=${page+1}">下一页</a>
							<a href="${pageContext.request.contextPath}/admin/orderlist.html?pageIndex=${pageCount}">尾页</a>
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
/* window.onload = function(){
    var tab = document.getElementById("tab");
    var maxCol = 6, val, count, start;

    for(var col = maxCol-1; col >= 0 ; col--){
        count = 1;
        val = "";
        for(var i=0; i<tab.rows.length; i++){
            if(val == tab.rows[i].cells[col].innerHTML){
                count++;
            }else{
                if(count > 1){ //合并
                    start = i - count;
                    tab.rows[start].cells[col].rowSpan = count;
                    for(var j=start+1; j<i; j++){
                        tab.rows[j].cells[col].style.display = "none";
                    }
                    count = 1;
                }
                val = tab.rows[i].cells[col].innerHTML;
            }
        }
        if(count > 1 ){ //合并，最后几行相同的情况下
            start = i - count;
            tab.rows[start].cells[col].rowSpan = count;
            for(var j=start+1; j<i; j++){
                tab.rows[j].cells[col].style.display = "none";
            }
        }
    }
}; */

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