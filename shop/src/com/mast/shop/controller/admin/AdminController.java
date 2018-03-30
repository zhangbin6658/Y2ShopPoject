package com.mast.shop.controller.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mast.shop.bean.admin.Admin;
import com.mast.shop.bean.admin.DictionaryType;
import com.mast.shop.bean.business.Order;
import com.mast.shop.bean.business.OrderItem;
import com.mast.shop.bean.business.Product;
import com.mast.shop.bean.customer.Commentary;
import com.mast.shop.bean.customer.Customer;
import com.mast.shop.service.admin.AdminService;
import com.mast.shop.service.admin.DictionaryTypeService;
import com.mast.shop.service.business.ProductService;
import com.mast.shop.service.customer.CommentaryService;
import com.mast.shop.service.customer.CustomerService;
import com.mast.shop.service.customer.OrderService;
import com.mast.shop.tools.EncryptUtil;

/**
 * 管理员请求类
 * 
 * @author Administrator
 * @version 1.0
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private DictionaryTypeService dictionaryTypeService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private ProductService productService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private CommentaryService commentaryService;
	

	// 管理员后台登录
	@RequestMapping(value = "/login")
	public String login() {
		return "admin/login";
	}
	
	@RequestMapping(value = "/index")
	public String index() {
		return "admin/login";
	}
	
	@RequestMapping(value = "/dologin")
	public  String login(@RequestParam String adminName,@RequestParam String adminPassword,HttpSession session, HttpServletRequest request){
		Admin login = adminService.login(adminName);
		if(login!=null){
			String encryptPsd = login.getAdminPassword();
			//将密文逆转 ，截取 salt盐的明文
			byte[] salt = EncryptUtil.decodeHex(encryptPsd.substring(0, 16));
			//重新拼凑 盐+密码   进行sha1的加密
			byte[] hashPass = EncryptUtil.sha1(adminPassword.getBytes(),salt,1024);
			String newEcnryptPsd= EncryptUtil.encodeHex(salt) + EncryptUtil.encodeHex(hashPass);

			if (encryptPsd.equals(newEcnryptPsd)) {
				session.setAttribute("adminId", login.getAdminId());
				session.setAttribute("adminName", login.getAdminName());
				return "admin/index";
			} else {
				return "admin/login";
			}
		}
		return "admin/login";
	}
	/**
	 * 退出登录
	 * @param session
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.removeAttribute("adminId");
		session.invalidate();
		return "admin/login";
	}
	
	@RequestMapping(value = "/admintop")
	public String indexTop() {
		return "admin/head";
	}

	@RequestMapping(value = "/adminleft")
	public String indexLeft() {
		return "admin/left";
	}

	@RequestMapping(value = "/adminfoot")
	public String indexFoot() {
		return "admin/foot";
	}

	@RequestMapping(value = "/main")
	public String indexcenter() {
		return "admin/main";
	}
		
	/**
	 * 分页显示用户信息
	 * 
	 * @param pageIndex
	 * @param model
	 * @param session 
	 * @return
	 */
	@RequestMapping(value = "/customerlist")
	public String customerlist(
			@RequestParam(value = "nickName", required = false) String nickName,
			@RequestParam(value = "phone", required = false) String phone,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "pageIndex", required = false) String pageIndex,
			Model model, HttpSession session) {
		if(session.getAttribute("adminId")!=null){
		Integer page = 1;
		if (pageIndex != null) {
			page = Integer.valueOf(pageIndex);
		}else{
			page=1;
		}
		int pageCount = 1;
		int count = customerService.count();
		int pageSize = 3;
		if (pageCount > 0) {
			pageCount = count % pageSize == 0 ? (count / pageSize) : (count
					/ pageSize + 1);
		}

		if (page < 1) {
			page = 1;
		} else if (page > pageCount) {
			page = pageCount;
		}
		List<Customer> customers = customerService.customers(nickName, phone,
				name, page, pageSize);
		model.addAttribute("page", page);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("customers", customers);
		model.addAttribute("count", count);
		return "admin/customerlist";
		}
		return "admin/login";
	}

	/**
	 * 跳转到修改用户页面
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/customerupdate")
	public String customerupdate(@RequestParam("id") Integer id, Model model) {
		Customer find = customerService.find(id);
		model.addAttribute("customer", find);
		return "admin/customerupdate";
	}

	/**
	 * 修改用户
	 * 
	 * @param customer
	 * @return
	 */
	@RequestMapping(value = "/customerupdatesave")
	public String customerupdate(Customer customer,
			@RequestParam("id") Integer id, @RequestParam String passWord) {
		EncryptUtil encryptUtil= new EncryptUtil();
		//1
		byte[] random = encryptUtil.generateSalt(8);
		//2
		String randomHex = encryptUtil.encodeHex(random);
		//3+4
		String sha1Psd = encryptUtil.encodeHex(encryptUtil.sha1(passWord.getBytes(), random, 1024)); 
		//5
		String encryptPsd = randomHex + sha1Psd;
		/*System.out.println(encryptPsd);*/
		customer.setPassWord(encryptPsd);
		customer.setCustomerId(id);
		int update = customerService.update(customer);
		if (update > 0) {
			return "redirect:/admin/customerlist";
		}
		return null;
	}

	/**
	 * 刪除用戶
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/customerdelete")
	public String customerdelete(@RequestParam("id") Integer id) {
		if (customerService.delete(id) > 0) {
			return "redirect:/admin/customerlist";
		} else {
			return null;
		}
	}
	/**
	 * 商品分类显示
	 * @param model
	 * @param session
	 * @param productName
	 * @param queryCategoryLevel1
	 * @param queryCategoryLevel2
	 * @param queryCategoryLevel3
	 * @param pageIndex
	 * @return
	 */
	@RequestMapping(value = "/productlist")
	public String getProductList(
			Model model,
			HttpSession session,
			@RequestParam(value = "productName", required = false) String productName,
			@RequestParam(value = "queryCategoryLevel1", required = false) String queryCategoryLevel1,
			@RequestParam(value = "queryCategoryLevel2", required = false) String queryCategoryLevel2,
			@RequestParam(value = "queryCategoryLevel3", required = false) String queryCategoryLevel3,
			@RequestParam(value = "pageIndex", required = false) String pageIndex) {
		if(session.getAttribute("adminId")!=null){
		List<Product> productlist = null;
		List<DictionaryType> categoryLevel1List = null;// 列出一级分类列表，注：二级和三级分类列表通过异步ajax获取
		List<DictionaryType> categoryLevel2List = null;
		List<DictionaryType> categoryLevel3List = null;
		// 页面容量
		// 当前页码
		Integer currentPageNo = 0;
		if (pageIndex != null) {
			currentPageNo = Integer.valueOf(pageIndex);
		}else{
			currentPageNo=1;
		}

		// 总数量（表）
		int totalCount = 0;
		try {
			totalCount = productService.findByCount(productName,
					queryCategoryLevel1, queryCategoryLevel2,
					queryCategoryLevel3);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		int pageSize = 6;
		int totalPageCount = 1;
		if (totalCount > 0) {
			totalPageCount = totalCount % pageSize == 0 ? totalCount / pageSize
					: totalCount / pageSize + 1;
		}
		// 控制首页和尾页
		if (currentPageNo < 1) {
			currentPageNo = 1;
		} else if (currentPageNo > totalPageCount) {
			currentPageNo = totalPageCount;
		}
		List<DictionaryType> productCategroy = null;
		List<DictionaryType> productState = null;

		try {
			productlist = productService.findByCategroy(productName,
					queryCategoryLevel1, queryCategoryLevel2,
					queryCategoryLevel3, currentPageNo, pageSize);
			// productState =
			// dictionaryTypeService.getDataDictionaryList("productState");
			DictionaryType dictionaryType = new DictionaryType();
			dictionaryType.setTypeCodeId(1);
			dictionaryType.setTypeCode(null);
			productCategroy = dictionaryTypeService
					.findProductCategroy(dictionaryType);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("productlist", productlist);
		// model.addAttribute("productState", productState);
		model.addAttribute("productCategroy", productCategroy);
		model.addAttribute("productName", productName);
		model.addAttribute("queryCategoryLevel1", queryCategoryLevel1);
		model.addAttribute("queryCategoryLevel2", queryCategoryLevel2);
		model.addAttribute("queryCategoryLevel3", queryCategoryLevel3);
		model.addAttribute("page", currentPageNo);
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("totalCount", totalCount);

		// 二级分类列表和三级分类列表---回显
		
		/*if(queryCategoryLevel2 != null && !queryCategoryLevel2.equals("")){
		categoryLevel2List = getCategoryList(queryCategoryLevel1.toString());
		model.addAttribute("categoryLevel2List", categoryLevel2List); }
		if(queryCategoryLevel3 != null && !queryCategoryLevel3.equals("")){
		categoryLevel3List = getCategoryList(queryCategoryLevel2.toString());
		model.addAttribute("categoryLevel3List", categoryLevel3List); }*/
		
		return "admin/productlist";
		}
		return "admin/login";
	}

	@RequestMapping("productadd")
	public String productsave() {
		return "admin/productsave";
	}

	/**
	 * 跳转到新增商品 /修改商品
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("toproductsave")
	public String productsave(@RequestParam Integer id, Model model) {
		Product product = null;
		List<DictionaryType> productState = null;
		List<DictionaryType> proCategroy = null;
		try {

			DictionaryType dictionaryType = new DictionaryType();
			dictionaryType.setTypeCodeId(1);
			dictionaryType.setTypeCode(null);
			proCategroy = dictionaryTypeService
					.findProductCategroy(dictionaryType);

			product = productService.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("productCategroy", proCategroy);
		model.addAttribute("product", product);
		if (id != null) {
			return "admin/productupdate";
		} else {
			return "admin/productsave";
		}
	}

	/**
	 * 执行新增商品 /修改商品
	 * 
	 * @return
	 */
	@RequestMapping("productsave")
	public String productsave(
			@RequestParam(value = "id", required = false) Integer id,
			Product product,
			@RequestParam(value = "image", required = false) MultipartFile multipartFile,
			HttpServletRequest request) {

		String logoPicPath = null;
		String logoLocPath = null;
		if (!multipartFile.isEmpty()) {
			String path = request.getSession().getServletContext()
					.getRealPath("statics" + File.separator + "images");
			String oldFileName = multipartFile.getOriginalFilename();// 原文件名
			String prefix = FilenameUtils.getExtension(oldFileName);// 原文件后缀
			/*
			 * int filesize = 500000; if (multipartFile.getSize() > filesize)
			 * {// 上传大小不得超过 50k return null; } else
			 */
			if (prefix.equalsIgnoreCase("jpg")
					|| prefix.equalsIgnoreCase("png")
					|| prefix.equalsIgnoreCase("jepg")
					|| prefix.equalsIgnoreCase("pneg")) {// 上传图片格式
				String fileName = UUID.randomUUID() + ".jpg";// 上传LOGO图片命名:apk名称.apk
				File targetFile = new File(path, fileName);
				if (!targetFile.exists()) {
					targetFile.mkdirs();
				}
				try {
					multipartFile.transferTo(targetFile);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				logoPicPath = "images/" + fileName;
				logoLocPath = path + File.separator + fileName;
				
			} else {
			}
		} else {
		}
		if (id != null && id != 0) {
			product.setProductId(id);
			product.setProductImage(logoPicPath);
			if (productService.update(product) > 0) {
				return "redirect:/admin/productlist";
			} else {

			}
		} else {
			product.setProductImage(logoPicPath);
			product.setProductStartDateTime(new Date());
			product.setProductEndDateTime(null);
			product.setBusinessId(1);
			product.setSendTypeId(1);
			if (productService.save(product) > 0) {
				return "redirect:/admin/productlist";
			} else {

			}
		}
		return null;
	}
	/**
	 * 删除商品
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("deleteProduct")
	public String deleteImage(@RequestParam Integer id,
			HttpServletRequest request) {
		Product product = productService.findById(id);
		if (product.getProductImage() != null) {
			File file = new File(product.getProductImage());
			System.out.println(file.exists());
			/*if (file.exists()) {*/
				file.delete();
				if (productService.delete(id) > 0) {
					return "redirect:/admin/productlist";
				}
			/*}*/
		}
		return null;

	}

	/**
	 * 商品二级分类
	 * 
	 * @param typeCode
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/procategroy2.json",produces="application/json;charset=UTF-8")
	public String getCategroy2(
			@RequestParam("typeCode") String typeCode, Model model) {
		List<DictionaryType> proCategroy = null;
		String strJson = "";
		try {
			DictionaryType dictionaryType = new DictionaryType();
			dictionaryType.setTypeCodeId(2);
			dictionaryType.setTypeCode(typeCode);
			proCategroy = dictionaryTypeService
					.findProductCategroy(dictionaryType);
			for (DictionaryType item : proCategroy) {
			}
			Gson gson = new Gson();
			strJson = gson.toJson(proCategroy);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return strJson;
	}

	/**
	 * 商品三级分类
	 * 
	 * @param typeCode
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/procategroy3.json")
	public List<DictionaryType> getCategroy3(
			@RequestParam("typeCode") String typeCode, Model model) {
		List<DictionaryType> proCategroy = null;
		try {
			DictionaryType dictionaryType = new DictionaryType();
			dictionaryType.setTypeCodeId(3);
			dictionaryType.setTypeCode(typeCode);
			proCategroy = dictionaryTypeService
					.findProductCategroy(dictionaryType);
			model.addAttribute("proCategroy3", proCategroy);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return proCategroy;
	}
	
	
	String logicName="";
	@RequestMapping("/orderlists")
	public String orderlist(HttpSession session, Model model,@RequestParam(value="pageIndex",required=false) String pageIndex) throws Exception {
		Integer customerId = null;
		if (customerId == null) {
			// 查询出用户所有定单编号
			Integer page=null;
			Integer pageSize=6;
			Integer pageCount=null;
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
				
				logicName = "admin/orderlist";
			} else {
			}
		} else {
			session.setAttribute("info", "请登录");
			logicName = "admin/login";
		}
		return logicName;
	}
	public  void pCount(Integer customerId, String typeName, Integer pageSize, Integer page){
		int count=orderService.count(customerId, typeName);
		Integer pageCount = count%pageSize==0?count/pageSize:count/pageSize+1;
		if(page<1){
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
	
	
	/**
	 * 删除订单
	 * @param id
	 * @return
	 */
	@RequestMapping("/orderdelete")
	public String orderdelete(@RequestParam(value="id",required=false) Integer id,Order order){
		System.out.println(id);
		int delete = orderService.delete(id);
		if(delete>0){
			return "redirect:/admin/orderlist";
		}
		return null;
	}
	/**
	 * 查询订单列表
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/orderlist")
	public String orderlist(Model model,HttpSession session,@RequestParam(value = "pageIndex", required = false) String pageIndex){
		if(session.getAttribute("adminId")!=null){
			Integer page=null;									
			Integer pageSize=6;
			Integer pageCount=null;
			if(pageIndex!=null&&pageIndex!="") {
				page=Integer.valueOf(pageIndex);
			}else{
				page=1;
			}
			int count=orderService.orderCount();
			 pageCount = count%pageSize==0?(count/pageSize):(count/pageSize+1);
			if(page<1){
				page=1;
			}else if(page>pageCount){
				page=pageCount;
			}
			
			List<Order> orderlist = orderService.orderList(page, pageSize);
			
			model.addAttribute("page", page);
			model.addAttribute("pageCount", pageCount);
			/*Gson gson=new Gson();
			String json = gson.toJson(orderlist);*/
			model.addAttribute("orderlist", orderlist);
			return "admin/orderlist";
		}
		return "admin/login";
	}
	/**
	 * 查询评论列表
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/commentlist")
	public String commentlist(Model model,HttpSession session){
		if(session.getAttribute("adminId")!=null){
		List<Commentary> commentaryList = commentaryService.listComment();
		model.addAttribute("commentaryList", commentaryList);
		return "admin/commentlist";
		}
		return "admin/login";
	}
	
	@RequestMapping(value="/orderupdate")
	public String orderlist(@RequestParam(value="id",required=false) Integer id,ModelAndView modelAndView,Order order){
		order.setOrderState(4);
		order.setOrderId(id);
		if(orderService.updateOrderState(order)>0){
			return "redirect:/admin/orderlist";
		}
		return null;
	}
}
