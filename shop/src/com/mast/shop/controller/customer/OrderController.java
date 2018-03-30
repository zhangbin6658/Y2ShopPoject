package com.mast.shop.controller.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.stream.events.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mast.shop.bean.admin.SendType;
import com.mast.shop.bean.business.Order;
import com.mast.shop.bean.business.OrderItem;
import com.mast.shop.bean.business.Product;
import com.mast.shop.bean.customer.Cart;
import com.mast.shop.bean.customer.Commentary;
import com.mast.shop.bean.customer.Customer;
import com.mast.shop.bean.customer.Logistics;
import com.mast.shop.dao.customer.CartDao;
import com.mast.shop.service.business.ProductService;
import com.mast.shop.service.customer.CartService;
import com.mast.shop.service.customer.CommentaryService;
import com.mast.shop.service.customer.CustomerService;
import com.mast.shop.service.customer.OrderService;
import com.mast.shop.service.impl.customer.CommentaryServiceImpl;
import com.mast.shop.tools.LogisticsTool;
import com.mast.shop.tools.PaymentUtil;
import com.mast.shop.tools.RandomTool;

/**
 * 订单管理
 * 
 * @author ZhangBin
 * 
 */
@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private CommentaryService commentaryService;
	@Autowired
	private CartService cartService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private ProductService productService;
	// 逻辑视图名
	private String logicName = null;

	Commentary commentary = null;
	// 接收支付通道编码:
	private String pd_FrpId;

	public void setPd_FrpId(String pd_FrpId) {
		this.pd_FrpId = pd_FrpId;
	}

	// 接收付款成功后的参数:
	private double r3_Amt;
	private String r6_Order;

	public void setR3_Amt(double r3_Amt) {
		this.r3_Amt = r3_Amt;
	}

	public void setR6_Order(String r6_Order) {
		this.r6_Order = r6_Order;
	}

	/**
	 * 提交订单
	 * 
	 * @param orderCount
	 * @param orderPrice
	 * @param productId
	 * @param orderPayment
	 * @param orderSendType
	 * @param session
	 * @param orderAddress
	 * @return
	 */
	@RequestMapping(value = "/saveOrder")
	public String saveOrder(HttpSession session,
			@RequestParam String orderCount, Order order,Model model,
			HttpServletRequest request, @RequestParam String payment) {
		List<Cart> cartlist = cartService.listCart((Integer) session
				.getAttribute("customerId"));
		Customer customer = customerService.find((Integer) session.getAttribute("customerId"));
		int save = 0;
		if (cartlist.size() > 0 && cartlist != null) {
			int cartSize = cartlist.size();
			for (int i = 0; i < cartSize; i++) {
				order = new Order();
				order.setCustomerId((Integer) (session
						.getAttribute("customerId")));
				order.setOrderDate(new Date());
				order.setOrderReceiptId(null);
				order.setOrderSendDate(null);
				order.setOrderSendPrice(0.0);
				order.setOrderCode(RandomTool.orderCode());
				order.setOrderState(3);
				order.setOrderbLook("是");
				order.setOrdercLook("是");
				order.setProductId(cartlist.get(i).getProductId());
				
				order.setOrderCount(cartlist.get(i).getCartCount());
				int price = (int) cartlist.get(i).getProductPrice();
				order.setOrderPrice(Double.parseDouble(request
						.getParameter("orderPrice")));
				order.setOrderSendType(null);
				Integer address = null;
				if (request.getParameter("orderAddress") != null) {
					address = Integer.parseInt(request
							.getParameter("orderAddress"));
				}
				order.setOrderAddress(address);
				order.setOrderPayment(payment);
				Product product = productService.findById(cartlist.get(i).getProductId());
				Product productObj=new Product();
				productObj.setProductCount(product.getProductCount() - cartlist.get(i).getCartCount());
				productObj.setProductCount(product.getProductSail()+ cartlist.get(i).getCartCount());
				productObj.setProductId(cartlist.get(i).getProductId());
				productService.updateCount(productObj);
				if ("钱包支付".equals(order.getOrderPayment())) {
					save = orderService.save(order);
				}
			}
			if (save > 0) {
				
				customer.setWallet(customer.getWallet() - order.getOrderPrice());
				customer.setOrderCode(order.getOrderCode());
				if (customerService.updateWallet(customer) > 0) {
					int delete = 0;
					try {
						delete = cartService.deleteCartByCid((Integer) session
								.getAttribute("customerId"));
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					if (delete > 0) {
						System.out.println("钱包支付成功");
						return "success";
					}

				}
			}
		}
		return null;

	}

	/**
	 * 跳转到订单管理页面，并显示订单信息
	 * 
	 * @return
	 */
	Integer pageCount=null;
	@RequestMapping("/toOrder")
	public String toOrder(HttpSession session, Model model,@RequestParam(value="pageIndex",required=false) String pageIndex) throws Exception {
		Integer customerId = (Integer) session.getAttribute("customerId");
		if (customerId != null) {
			// 查询出用户所有定单编号
			Integer page=null;
			Integer pageSize=6;
			if(pageIndex!=null&&pageIndex!="") {
				page=Integer.valueOf(pageIndex);
			}else{
				page=1;
			}
			// null(所有状态),待付款，待发货，待收货，待评论。
			String typeName = null;
			pCount(customerId, typeName, pageSize, page);
			List<OrderItem> orderItems = findOrderItem(customerId, typeName,page,pageSize);
			if (orderItems != null) {
				model.addAttribute("orderItems", orderItems);
				model.addAttribute("page", page);
				model.addAttribute("pageCount", pageCount);
				typeName = "待付款";
				pCount(customerId, typeName, pageSize, page);
				List<OrderItem> orderListPay = findOrderItem(customerId,
						typeName,page,pageSize);
				if (orderListPay != null) {
					model.addAttribute("orderListPay", orderListPay);
				}
				typeName = "待发货";
				pCount(customerId, typeName, pageSize, page);
				List<OrderItem> orderListSend = findOrderItem(customerId,
						typeName,page,pageSize);
				System.out.println("待发货" + orderListSend);
				if (orderListSend != null) {
					model.addAttribute("orderListSend", orderListSend);
				}
				typeName = "待收货";
				pCount(customerId, typeName, pageSize, page);
				List<OrderItem> orderListSure = findOrderItem(customerId,
						typeName,page,pageSize);
				if (orderListSure != null) {
					model.addAttribute("orderListSure", orderListSure);
				}
				typeName = "待评价";
				pCount(customerId, typeName, pageSize, page);
				List<OrderItem> orderListComment = findOrderItem(customerId,
						typeName,page,pageSize);
				if (orderListComment != null) {
					model.addAttribute("orderListComment", orderListComment);
				}
				
				logicName = "person/order";
			} else {
				session.setAttribute("info", "你还没有订单,赶快去下单吧！");
				logicName = "person/order";
			}
		} else {
			session.setAttribute("info", "请登录");
			logicName = "redirect:/toLogin";
		}
		return logicName;
	}
	public  void pCount(Integer customerId, String typeName, Integer pageSize, Integer page){
		int count=orderService.count(customerId, typeName);
		 pageCount = count%pageSize==0?count/pageSize:count/pageSize+1;
		if(page<=1){
			page=1;
		}else if(page>=pageCount){
			page=pageCount;
		}
	}
	/**
	 * 查询所有不同状态的订单
	 * 
	 * @param customerId
	 * @param typeName
	 * @return
	 * @throws Exception
	 */
	public List<OrderItem> findOrderItem(Integer customerId, String typeName,Integer pageIndex,Integer pageSize)
			throws Exception {
		List<OrderItem> orderItemsList = null;
		// 查询出用户所有定单编号
	
		List<String> codeList = orderService.findOrderByCustomerIdAndTypeName(
				customerId, typeName,pageIndex,pageSize);
		if (codeList.size() > 0) {
			orderItemsList = new ArrayList<OrderItem>();
			int codeListLen = codeList.size();
			// 遍历出所有订单号
			for (int i = 0; i < codeListLen; i++) {
				String code = codeList.get(i);
				// 根据订单编号查询订单中商品信息
				List<Order> orderInfo = orderService.findOrderByOrderCode(code);
				if (orderInfo != null) {
					OrderItem item = new OrderItem();
					item = orderService.findOrderDateAndPriceByOrderCode(code);
					item.setOrderCode(code);
					item.setList(orderInfo);
					orderItemsList.add(item);
				}
			}
		}

		return orderItemsList;
	}

	/**
	 * 修改订单
	 * 
	 * @param code
	 * @param reqType
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateOrder")
	public String updateOrderState(
			@RequestParam(value = "orderCode", required = false) String code,
			@RequestParam(value = "reqType", required = false) String reqType,
			HttpSession session) throws Exception {
		Integer id = (Integer) session.getAttribute("customerId");
		Order order = new Order();
		if (id != null) {
			order.setCustomerId(id);
			if (code != null && code != "") {
				order.setOrderCode(code);
			}
			String sure = "sure";
			String del = "del";
			if (sure.equals(reqType)) {
				// 确认收货
				String typeName = "待评价";
				Integer typeId = orderService
						.findDictionarytypeByTypeName(typeName);
				order.setOrderState(typeId);
			} else if (del.equals(reqType)) {
				// 删除订单
				order.setOrdercLook("否");
			}
			int num = orderService.updateOrderByOrderCode(order);
			if (num > 0) {
				session.setAttribute("success", "操作成功");
				logicName = "redirect:/person/toOrder";
			} else {
				session.setAttribute("error", "操作失败");
				logicName = "person/order";
			}
		} else {
			session.setAttribute("info", "请登录");
			logicName = "redirect:/person/toLogin";
		}
		return logicName;
	}

	// 为订单付款:
	public String payOrder(HttpServletResponse response, Integer id)
			throws IOException {
		// 1.修改数据:
		/*
		 * Order currOrder = orderService.findByOid(order.getOid());
		 * currOrder.setAddr(order.getAddr());
		 * currOrder.setName(order.getName());
		 * currOrder.setPhone(order.getPhone()); // 修改订单
		 * orderService.update(currOrder);
		 */
		Order currOrder = orderService.find(id);
		// 2.完成付款:
		// 付款需要的参数:
		String p0_Cmd = "Buy"; // 业务类型:
		String p1_MerId = "10001126856";// 商户编号:
		String p2_Order = currOrder.getOrderCode();// 订单编号:
		String p3_Amt = "0.01"; // 付款金额:
		String p4_Cur = "CNY"; // 交易币种:
		String p5_Pid = ""; // 商品名称:
		String p6_Pcat = ""; // 商品种类:
		String p7_Pdesc = ""; // 商品描述:
		String p8_Url = "http://127.0.0.1:8080/shop/order/callBack.html"; // 商户接收支付成功数据的地址:192.168.36.69:8080
		String p9_SAF = ""; // 送货地址:
		String pa_MP = ""; // 商户扩展信息:
		String pd_FrpId = this.pd_FrpId;// 支付通道编码:
		String pr_NeedResponse = "1"; // 应答机制:
		String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl"; // 秘钥
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
				p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
				pd_FrpId, pr_NeedResponse, keyValue); // hmac
		// 向易宝发送请求:
		StringBuffer sb = new StringBuffer(
				"https://www.yeepay.com/app-merchant-proxy/node?");
		sb.append("p0_Cmd=").append(p0_Cmd).append("&");
		sb.append("p1_MerId=").append(p1_MerId).append("&");
		sb.append("p2_Order=").append(p2_Order).append("&");
		sb.append("p3_Amt=").append(p3_Amt).append("&");
		sb.append("p4_Cur=").append(p4_Cur).append("&");
		sb.append("p5_Pid=").append(p5_Pid).append("&");
		sb.append("p6_Pcat=").append(p6_Pcat).append("&");
		sb.append("p7_Pdesc=").append(p7_Pdesc).append("&");
		sb.append("p8_Url=").append(p8_Url).append("&");
		sb.append("p9_SAF=").append(p9_SAF).append("&");
		sb.append("pa_MP=").append(pa_MP).append("&");
		sb.append("pd_FrpId=").append(pd_FrpId).append("&");
		sb.append("pr_NeedResponse=").append(pr_NeedResponse).append("&");
		sb.append("hmac=").append(hmac);

		// 重定向:向易宝出发:
		response.sendRedirect(sb.toString());
		return null;
	}

	// 付款成功后跳转回来的路径:
	public String callBack(Model model, Integer id) {
		// 修改订单的状态:
		Order currOrder = null;
		try {
			currOrder = orderService.find(id);
			currOrder.setOrderState(6);
			// 修改订单状态为2:已经付款:
			orderService.updateOrderByOrderCode(currOrder);
		} catch (Exception e) {
			e.printStackTrace();
		}
		r6_Order = currOrder.getOrderCode();
		r3_Amt = (double) currOrder.getOrderPrice();
		model.addAttribute("success", "支付成功!订单编号为: " + r6_Order + " 付款金额为: "
				+ r3_Amt);
		return "msg";
	}

	/**
	 * 查询指定待评论订单
	 * 
	 * @param code
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/toCommentList")
	public String commentOrder(
			@RequestParam(value = "orderCode", required = false) String code,
			Model model) throws Exception {
		if (code != null) {
			// 根据订单编号查询订单中商品信息
			List<Order> orderInfo = orderService.findOrderByOrderCode(code);
			if (orderInfo != null) {
				model.addAttribute("orderInfo", orderInfo);
				logicName = "person/commentlist";
			}
		}
		return logicName;
	}

	/**
	 * 评论订单商品
	 * 
	 * @param req
	 * @param session
	 * @param count
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/insertCommentary")
	public String insertCommentary(HttpServletRequest req, HttpSession session,
			@RequestParam(value = "orderCode1", required = false) String code,
			@RequestParam(value = "count", required = false) String count)
			throws Exception {
		if (count != null && count != "" && code != null && code != "") {
			int num = Integer.valueOf(count);
			Integer customerId = (Integer) session.getAttribute("customerId");
			for (int i = 1; i <= num; i++) {
				// 获取评论内容
				String content = "content" + i;
				String commentaryContent = req.getParameter(content);
				// 获取评论类型
				String commentaryTitle = "title" + i;
				String title = req.getParameter(commentaryTitle);
				// 获取评价商品id
				String proid = "product" + i;
				Integer productId = Integer.valueOf(req.getParameter(proid));
				// 获取评论图片

				Commentary com = new Commentary();
				com.setCommentaryTitle(title);
				com.setCommentaryContent(commentaryContent);
				// com.setCommentaryPicture(commentaryPicture);
				Date date = new Date();
				com.setCommentaryTime(date);
				com.setCustomerId(customerId);
				com.setProductId(productId);
				int resultNum = orderService.saveCommentary(com);
				if (resultNum > 0) {
					// 交易成功
					String typeName = "交易成功";
					Integer typeId = orderService
							.findDictionarytypeByTypeName(typeName);
					Order order = new Order();
					order.setCustomerId(customerId);
					order.setOrderCode(code);
					order.setOrderState(typeId);
					int num1 = orderService.updateOrderByOrderCode(order);
					if (num1 > 0) {
						session.setAttribute("success", "操作成功");
						logicName = "redirect:/person/toOrder";
					} else {
						session.setAttribute("error", "操作失败");
						logicName = "person/order";
					}

				} else {
					logicName = "redirect:/person/toCommentList";
				}

			}
		}

		return logicName;
	}

	/**
	 * 查询单号请求物流信息
	 * 
	 * @param orderCode
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/toLogistic")
	public String toLogistic(HttpServletRequest req,
	/* @RequestParam(value="orderCode",required=false) String orderCode, */
	Model model) throws Exception {
		String orderCode = req.getParameter("code");
		if (orderCode != null) {
			List<SendType> sendList = orderService
					.findSendTypeByOrderCode(orderCode);
			String logisticName = sendList.get(0).getSendTypeName();

			String sendTypeCode = sendList.get(0).getSendTypeCode();
			String logisticCode = sendList.get(0).getLogisticCode();
			if (sendTypeCode != null && logisticCode != null) {

				String result = LogisticsTool.logisticsReq(sendTypeCode,
						logisticCode);

				/**
				 * 使用google的gson.jar解析复杂json数据
				 */
				JsonParser parser = new JsonParser(); // 创建JSON解析器
				JsonObject object = (JsonObject) parser.parse(result);// 创建JsonObject对象
				// (JsonObject) parser.parse(new FileReader(result)); //
				// 创建JsonObject对象
				String logisticCodes = object.get("LogisticCode").getAsString(); // 将json数据转为为String型的数据(快递单号)
				String shipperCode = object.get("ShipperCode").getAsString(); // 将json数据转为为String型的数据(快递编码)
				String state = object.get("State").getAsString(); // 将json数据转为为String型的数据(订单状态)
				// 将json数据转为为String型的数据
				boolean success = object.get("Success").getAsBoolean(); // 将json数据转为为boolean型的数据(请求是否成功)

				JsonArray array = object.get("Traces").getAsJsonArray(); // 得到为json的数组
				int arrayLen = array.size();
				ArrayList<Logistics> arrayList = new ArrayList<Logistics>();
				for (int i = 0; i < arrayLen; i++) {
					Logistics logistics = new Logistics();
					JsonObject subObject = array.get(i).getAsJsonObject();
					logistics.setId(i);
					logistics.setSubstance(subObject.get("AcceptStation")
							.getAsString());
					logistics
							.setDate(subObject.get("AcceptTime").getAsString());
					arrayList.add(logistics);
				}
				Integer resState = Integer.valueOf(state);
				String logisticState = null;
				switch (resState) {
				case 0:
					logisticState = "已经整装待发了，客官不要急哟。";
					break;
				case 1:
					logisticState = "已揽收";
					break;
				case 2:
					logisticState = "在途中";
					break;
				case 3:
					logisticState = "已签收";
					break;
				case 4:
					logisticState = "问题件";
					break;
				}
				model.addAttribute("logisticName", logisticName);
				model.addAttribute("logisticCodes", logisticCodes);
				model.addAttribute("logisticState", logisticState);
				model.addAttribute("logisticsList", arrayList);
				for (Logistics logistics : arrayList) {
				}
				logicName = "person/logistics";
			}

		}
		return logicName;
	}
}
