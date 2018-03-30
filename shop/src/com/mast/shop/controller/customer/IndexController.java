package com.mast.shop.controller.customer;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.Md5Crypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.mast.shop.bean.admin.Address;
import com.mast.shop.bean.admin.DictionaryType;
import com.mast.shop.bean.business.Order;
import com.mast.shop.bean.business.Product;
import com.mast.shop.bean.customer.Cart;
import com.mast.shop.bean.customer.Customer;
import com.mast.shop.service.admin.DictionaryTypeService;
import com.mast.shop.service.business.ProductService;
import com.mast.shop.service.customer.CartService;
import com.mast.shop.service.customer.CustomerService;
import com.mast.shop.service.customer.OrderService;
import com.mast.shop.tools.EncryptUtil;

/**
 * 请求类
 * 
 * @author Administrator
 * 
 */
@Controller
public class IndexController {
	@Autowired
	private CustomerService customerService;
	@Autowired
	private DictionaryTypeService dictionaryTypeService;
	@Autowired
	private ProductService productService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private CartService cartService;

	Customer customer = new Customer();

	@RequestMapping("/toLogin")
	public String toLogin() {
		return "login";
	}

	/**
	 * 跳转到主页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/index")
	public String index(Model model) {
		DictionaryType dictionaryType=new DictionaryType();
		dictionaryType.setTypeCodeId(1);
		dictionaryType.setTypeCode(null);
		List<DictionaryType> list = dictionaryTypeService.findProductCategroy(dictionaryType);
		model.addAttribute("list", list);
		List<Product> product = productService.findByDate();
		model.addAttribute("pDate", product);
		List<Product> productBySail = productService.findBySail();
		model.addAttribute("pSail", productBySail);
		return "home3";
	}
	/**
	 * 商品分类展示
	 * @param model
	 * @param productName
	 * @return
	 */
	@RequestMapping(value="/productCategroy")
	public String productCategroy(Model model,@RequestParam(value="pageIndex",required=false) String pageIndex,
			@RequestParam(value="productName",required=false) String productName,
			@RequestParam(value="procategroy1",required=false) String procategroy1,
			@RequestParam(value="procategroy2",required=false) String procategroy2) {
		
		Integer page=1;
		if(pageIndex!=null){
			page=Integer.valueOf(pageIndex);
		}
		
		DictionaryType dictionaryType=new DictionaryType();
		dictionaryType.setTypeCodeId(1);
		dictionaryType.setTypeCode(null);
		List<DictionaryType> list = dictionaryTypeService.findProductCategroy(dictionaryType);
		model.addAttribute("list", list);
		/*Product productObj = productService.find(product);*/
		int pageSize=8;
		int size=0;
		try {
			 /*String encodeBase64 = EncryptUtil.encodeBase64(procategroy1);
			 String decodeBase64String = EncryptUtil.decodeBase64String(procategroy2);*/
			size = productService.findByCount(productName, procategroy1, procategroy2, null);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		};
		List<Product> productlist=null;
		int pageCount=size%pageSize==0?size/pageSize:size/pageSize+1;
		if(page<1) {
			page=1;
		}else if(page>pageCount){
			page=pageCount;
		}
		try {
			productlist = productService.findByCategroy(productName, procategroy1, procategroy2, null, page, pageSize);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		model.addAttribute("productlist", productlist);
		model.addAttribute("page", page);
		model.addAttribute("pageCount", pageCount);
		return "productcategroy";
	}
	
	/**
	 * 根据cusid查询所有订单
	 * @param cusid
	 * @return
	 */
	public List <Order> findOrderBycid(Integer cusid){
		List<Order> orderlist = orderService.findOrderByCustomerId(cusid);
		return orderlist;
		
	}
	
	@RequestMapping(value = "/myShopCart")
	public String myShopCart(HttpSession session,Model model){
		List<Cart> cartlist=cartService.listCart((Integer)(session.getAttribute("customerId")));
		model.addAttribute("cartlist", cartlist);
		session.setAttribute("cartlist", cartlist);
		return "shopcart";
	}
	/**
	 * 跳转到购物车页面
	 * 
	 * @param id
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/deleteCart")
	public String deleteCart(@RequestParam Integer cartid){
		if(cartService.deleteCart(cartid)>0){
			return "redirect:/myShopCart";
		}
		return null;
	} 
	@RequestMapping(value = "/toShopCart")
	public String saveCart( Model model,@RequestParam Integer id,@RequestParam Double price,@RequestParam String count,
			HttpSession session) {
		if (session.getAttribute("name") != null) {
			Cart cart = new Cart();
			Cart listCart = cartService.findById(id);
			if(listCart==null){
				List<Cart> list = new ArrayList<Cart>();
				cart.setCustomerId((Integer) (session.getAttribute("customerId")));
				cart.setProductId(id);
				cart.setProductPrice(price);
				cart.setCartCount(Integer.parseInt(count));
				cart.setOrderPrice(price*Integer.parseInt(count));
				cart.setCartTime(new Date());
				list.add(cart);
				if(cartService.save(cart) > 0) {
					List<Cart> cartlist=cartService.listCart((Integer)(session.getAttribute("customerId")));
					model.addAttribute("cartlist", cartlist);
					session.setAttribute("cartlist", cartlist);
					return "shopcart";
				}
			}else{
				cart.setCartCount(Integer.parseInt(count)+listCart.getCartCount());
				cart.setOrderPrice(price*cart.getCartCount());
				cart.setProductId(id);
				if(cartService.updateCart(cart) > 0) {
					List<Cart> cartlist=cartService.listCart((Integer)(session.getAttribute("customerId")));
					model.addAttribute("cartlist", cartlist);
					return "shopcart";
				}else{
				}
			}
		} else {
			return "message";
		}
		return null;
	}

	/**
	 * 登录处理
	 * @param model
	 * @param request
	 * @param name 昵称
	 * @param passWord
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/doLogin", method = RequestMethod.POST)
	public String login(
			Model model,
			HttpServletRequest request,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "password", required = false) String passWord,
			HttpSession session) {

		Customer login = customerService.login(name);
		if(login!=null){
			String encryptPsd = login.getPassWord();
			//将密文逆转 ，截取 salt盐的明文
			byte[] salt = EncryptUtil.decodeHex(encryptPsd.substring(0, 16));
			//重新拼凑 盐+密码   进行sha1的加密
			byte[] hashPass = EncryptUtil.sha1(passWord.getBytes(),salt,1024);
			String newEcnryptPsd= EncryptUtil.encodeHex(salt) + EncryptUtil.encodeHex(hashPass);

			if (encryptPsd.equals(newEcnryptPsd)) {
				session.setAttribute("customerId", login.getCustomerId());
				session.setAttribute("phone", login.getPhone());
				session.setAttribute("name", name);
				return "redirect:index";
			} else {
				request.setAttribute("error", name);
				return "redirect:fileLogin";
			}
		}else{
			return "redirect:fileLogin";
		}
		}

	@RequestMapping(value = "/fileLogin")
	public String fileLogin(HttpServletRequest request) {
		if (request.getAttribute("name") == null) {
			request.setAttribute("error", "帐号密码有误！");
		}
		return "login";
	}

	@RequestMapping("/toRegister")
	public String toRegister() {
		return "register";
	}
	/**
	 * 注册
	 * @param model
	 * @param nickName
	 * @param passWord
	 * @param phone
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/doRegister",method = RequestMethod.POST)
	public String doRegister(
			Model model,
			@RequestParam(value = "nickName", required = false) String nickName,
			@RequestParam(value = "passWord", required = false) String passWord,
			@RequestParam(value = "phone",required = false) String phone
			) {
		customer.setNickName(nickName);
		//1：生成一个随机数 
		//2:用可逆的加密算法加密随机数
		//3:将随机数和我们的密码 用sha1不可逆算法加密
		//4：将第三步得到的字符串值用可逆的加密算法加密
		//5：将第2步和第4步的值拼凑
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
		customer.setPhone(phone);
		Date date=new Date();
		//-		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/mm/dd HH:mm:ss");
		//		Date registerTime=(date)sdf.format(date);
		customer.setRegisterTime(date);
		int num=customerService.save(customer);
		if(num>0){
			return "login";
		}else{
			return "redircet:toRegister";
		}
	}
	
	/**
	 * pan
	 * @param nickName
	 * @param result
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/nickNameExist.json")
	public String cusExists(String nickName,Map<String, String> map){
		Customer customer = customerService.findByNickName(nickName);
		if(customer!=null) {
			map.put("result", "exists");
		}else{
			map.put("result", "notexists");
		}
		return JSON.toJSONString(map);
		
	}
	
	@RequestMapping("/toPerson")
	public String toPersonIndex(){
		return "redirect:/person/toPerson";

	}

	/**
	 * 跳转到商品详情页面
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/toProductShow")
	public String toShow(@RequestParam Integer id, Model model) {
		Product product = productService.findById(id);
		model.addAttribute("product", product);
		return "introduction";
	}

	int num = 1;
	/**
	 * 查询地址
	 */
	List<Address> addressList=null;
	public List<Address> addressList(HttpSession session){
	  try {
		  addressList = customerService.findAddressByCustomerId((Integer)(session.getAttribute("customerId")));
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return addressList;
		
	}
	/**
	 * 跳转到支付页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toSaveOrder")
	public String saveOrder(Cart cart,HttpSession session, Model model) {
		if (session.getAttribute("name") != null) {
			Customer customer = customerService.find((Integer) session
					.getAttribute("customerId"));
			List<Address> listaddress=null;
			try {
				listaddress = addressList(session);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			List<Cart> cartlist=cartService.listCart((Integer)(session.getAttribute("customerId")));
		  /*Cart product = cartService.findById(id);
			cart.setCartCount(cartCount);
			cart.setOrderPrice(product.getProductPrice()*cartCount);*/
			/*int updateCart = cartService.updateBatch(cartlist);
			if(updateCart>0){*/
				model.addAttribute("addressList", listaddress);
				model.addAttribute("product", cartlist);
				model.addAttribute("wallet", customer.getWallet());
				session.setAttribute("wallet", customer.getWallet());
				session.setAttribute("product", cartlist);
				return "pay";
			/*}*/
		} else {
			return "message";
		}
	}

	/**
	 * 跳转到
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/personal")
	public String personal(){
		return "person/index";
	}
	/**
	 * 客户新增收货地址
	 * @param addressSignName
	 * @param addressSignPhone
	 * @param province
	 * @param city
	 * @param town
	 * @param introduce
	 * @param session
	 * @return
	 * @throws Exception
	 */
	String please="请选择";
	Address address;
	@RequestMapping(value="/addAddress",method=RequestMethod.POST)
	public String addAddress(@RequestParam(value = "addressSignName", required = false) String addressSignName,
			@RequestParam(value = "addressSignPhone", required = false) String addressSignPhone,
			@RequestParam(value = "province", required = false) String province,
			@RequestParam(value = "city", required = false) String city,
			@RequestParam(value = "town", required = false) String town,
			@RequestParam(value = "introduce",required = false) String introduce,
			HttpSession session
			)throws Exception{
		String logicName=null;
		address=new Address();
		Integer id = (Integer) session.getAttribute("customerId");
		if (id != null) {
			address.setCustomerId(id);
		}else{
			session.setAttribute("info", "请登录");
			logicName="redirect:/toLogin";
		}
		if (addressSignName != null && addressSignName != "") {
			address.setAddressSignName(addressSignName);
		}
		if (addressSignPhone != null && addressSignPhone != "") {
			address.setAddressSignPhone(addressSignPhone);
		}
		String addressName = null;
		if (!please.equals(province) && addressSignPhone != "") {
			addressName = province;
		}
		if (!please.equals(city) && city != "") {
			addressName =addressName+city;
		}
		if (!please.equals(town) && town != "") {
			addressName =addressName+town;
		}
		if (introduce != null && introduce !=""){
			addressName =addressName+introduce;
		}
		if (addressName != null) {
			address.setAddressName(addressName);
		}
		address.setAddressDefault("否");
		Date date =new Date();
		address.setAddressDate(date);
		int num = customerService.saveAddress(address);
		List<Address> listaddress = addressList(session);
		session.setAttribute("addressList", listaddress);
		if(num >0){
			session.setAttribute("address", address);
			logicName= "pay";
		}else{
			logicName= "pay";
		}
		return logicName;
	}

	@RequestMapping(value="/deleteAddress",method=RequestMethod.GET)
	public String deleteAddress(HttpServletRequest req, HttpSession session)
			throws Exception {
		String logicName=null;
		String id = req.getParameter("addressId");
		if (id != null || id != "") {
			Integer addressId = Integer.valueOf(id);
			int num = customerService.deleteAddressByAddressId(addressId);
			List<Address> listaddress = addressList(session);
			session.setAttribute("addressList", listaddress);
			if (num > 0) {
				logicName= "pay";
			} else {
				logicName= "pay";
			}
		}
		return logicName;
	}
	/**
	 * 退出
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value="/logout")
	public String logout(HttpSession httpSession){
		httpSession.removeAttribute("customerId");
		httpSession.invalidate();
		return "login";
		
	}
	
	
}
