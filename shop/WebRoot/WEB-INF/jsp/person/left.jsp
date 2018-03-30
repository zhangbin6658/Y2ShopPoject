<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<ul>
				<li class="person active"><a href="index.html"><i
						class="am-icon-user"></i>个人中心</a>
				</li>
				<li class="person">
					<p>
						<i class="am-icon-newspaper-o"></i>个人资料
					</p>
					<ul >
						<!-- <li><a href="toInformation.html">个人信息</a>
						</li> -->
						<li><a href="${pageContext.request.contextPath}/person/toSafety.html">安全设置</a>
						</li>
						<li><a href="${pageContext.request.contextPath}/person/toAddress.html">地址管理</a>
						</li>
						<!-- <li><a href="toCardlist.html">快捷支付</a>
						</li> -->
					</ul>
				</li>
				<li class="person">
					<p>
						<i class="am-icon-balance-scale"></i>我的交易
					</p>
					<ul>
						<li><a href="${pageContext.request.contextPath}/order/toOrder.html">订单管理</a>
						</li>
						<!-- <li><a href="toChange.html">退款售后</a>
						</li> -->
						<li><a href="${pageContext.request.contextPath}/person/toComment.html">评价商品</a>
						</li>
					</ul>
				</li>
				<!-- <li class="person">
					<p>
						<i class="am-icon-dollar"></i>我的资产
					</p>
					<ul>
						<li><a href="toPoints.html">我的积分</a>
						</li>
						<li><a href="toCoupon.html">优惠券 </a>
						</li>
						<li><a href="toBonus.html">红包</a>
						</li>
						<li><a href="toWalletlist.html">账户余额</a>
						</li>
						<li><a href="toBill.html">账单明细</a>
						</li>
					</ul>
				</li>

				<li class="person">
					<p>
						<i class="am-icon-tags"></i>我的收藏
					</p>
					<ul>
						<li><a href="toCollection.html">收藏</a>
						</li>
						<li><a href="">足迹</a>
						</li>
					</ul>
				</li>

				<li class="person">
					<p>
						<i class="am-icon-qq"></i>在线客服
					</p>
					<ul>
						<li><a href="toConsultation.html">商品咨询</a>
						</li>
						<li><a href="toSuggest.html">意见反馈</a>
						</li>

						<li><a href="toNews.html">我的消息</a>
						</li>
					</ul>
				</li> -->
			</ul>
