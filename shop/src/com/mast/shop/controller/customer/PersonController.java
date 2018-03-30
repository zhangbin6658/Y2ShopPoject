package com.mast.shop.controller.customer;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mast.shop.bean.admin.Address;
import com.mast.shop.bean.customer.Commentary;
import com.mast.shop.bean.customer.Customer;
import com.mast.shop.service.customer.CommentaryService;
import com.mast.shop.service.customer.CustomerService;
import com.mast.shop.service.customer.OrderService;
import com.mast.shop.tools.EncryptUtil;
/**
 * 个人中心
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("/person")
public class PersonController {
	@Autowired
	private CustomerService customerService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private CommentaryService commentaryService;
	Customer customer = new Customer();
	Address address = new Address();
	@RequestMapping(value = "/findCustomerAll", method = RequestMethod.POST)
	public String findCustomerAll(
			HttpServletRequest req,
			HttpServletResponse resp,
			HttpSession session,
			@RequestParam(value = "nickName", required = false) String nickName,
			@RequestParam(value = "oldPwd", required = false) String oldPwd,
			@RequestParam(value = "newPwd", required = false) String newPwd,
			@RequestParam(value = "phone", required = false) String phone,
			@RequestParam(value = "ID", required = false) String ID,
			@RequestParam(value = "name", required = false) String name)
			throws ServletException, IOException {
		String logicName=null;
		Integer id = (Integer) session.getAttribute("customerId");
		if (id != null) {
			customer.setCustomerId(id);
		}else{
			session.setAttribute("info", "请登录");
			logicName="redirect:/toLogin";
		}
		if (nickName != null && nickName != "") {
			customer.setNickName(nickName);
		}
		if (oldPwd != null && oldPwd != "") {
			customer.setPassWord(oldPwd);
		}
		if (phone != null && phone != "") {
			customer.setPhone(phone);
		}
		if (ID != null && ID != "") {
			customer.setID(ID);
		}
		if (name != null && name != "") {
			customer.setName(name);
		}
		Customer cus = customerService.findCusAll(customer);
		boolean flag = true;
		if (cus != null) {
			req.setAttribute("flag", flag);
			resp.getWriter().print(flag);
		} else {
			flag = false;
			req.setAttribute("flag", flag);
			resp.getWriter().print(flag);
		}
		return logicName;
	}

	/**
	 * 个人信息修改
	 * 
	 * @param model
	 * @param nickName
	 * @param oldPwd
	 * @param newPwd
	 * @param phone
	 * @param address
	 * @param ID
	 * @param name
	 * @param session
	 * @return
	 */
	@RequestMapping("/update")
	public String update(
			Model model,
			@RequestParam(value = "nickName", required = false) String nickName,
			@RequestParam(value = "oldPwd", required = false) String oldPwd,
			@RequestParam(value = "newPwd", required = false) String newPwd,
			@RequestParam(value = "phone", required = false) String phone,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "ID", required = false) String ID,
			@RequestParam(value = "name", required = false) String name,
			HttpSession session, HttpServletRequest req) {
		String logicName=null;
		Integer id = (Integer) session.getAttribute("customerId");
		if (id != null) {
			customer.setCustomerId(id);
		}else{
			session.setAttribute("info", "请登录");
			logicName="redirect:/toLogin";
		}
		if (nickName != null && nickName != "") {
			customer.setNickName(nickName);
		}
		
		if (phone != null && phone != "") {
			customer.setPhone(phone);
		}
		if (address != null && address != "") {
			customer.setAddress(address);
		}
		if (ID != null && ID != "") {
			customer.setID(ID);
		}
		if (name != null && name != "") {
			customer.setName(name);
		}
		if (oldPwd != null && oldPwd != "") {
			Customer findCus = customerService.findCusAll(customer);
			if(findCus != null){
			String encryptPsd = findCus.getPassWord();
			//将密文逆转 ，截取 salt盐的明文
			byte[] salt = EncryptUtil.decodeHex(encryptPsd.substring(0, 16));
			//重新拼凑 盐+密码   进行sha1的加密
			byte[] hashPass = EncryptUtil.sha1(oldPwd.getBytes(),salt,1024);
			String newEcnryptPsd= EncryptUtil.encodeHex(salt) + EncryptUtil.encodeHex(hashPass);
			customer.setPassWord(newEcnryptPsd);
			if (newEcnryptPsd.equals(encryptPsd)) {
				EncryptUtil encryptUtil= new EncryptUtil();
				//1
				byte[] random = encryptUtil.generateSalt(8);
				//2
				String randomHex = encryptUtil.encodeHex(random);
				//3+4
				String sha1Psd = encryptUtil.encodeHex(encryptUtil.sha1(newPwd.getBytes(), random, 1024)); 
				//5
				String encryptPsd2 = randomHex + sha1Psd;
				customer.setPassWord(encryptPsd2);
				int num = customerService.update(customer);
				if (num > 0) {
					session.setAttribute("success", "修改成功");
					logicName= "redirect:/person/toPerson";
				} else {
					session.setAttribute("error", "修改失败，请稍后再试");
					logicName= "person/password";
				}
			} else {
				session.setAttribute("info", "密码输入错误");
				logicName= "person/password";
			}
		}else{
			session.setAttribute("error", "修改失败，请稍后再试");
			logicName= "person/password";
		}
		} else {
			int num = customerService.update(customer);
			if (num > 0) {
				session.setAttribute("success", "修改成功");
				logicName= "person/index";
			} else {
				session.setAttribute("error", "修改失败，请稍后再试");
				logicName= "person/password";
			}
		}
		return logicName;
	}

	/**
	 * 跳转到地址页面并显示
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/toAddress")
	public String toAddress(HttpSession session,HttpServletRequest req, Model model) {
		// 逻辑视图名
		String logicName = null;
		Integer id = (Integer) session.getAttribute("customerId");
		if (id != null) {
			try {
				List<Address> addressList = customerService
						.findAddressByCustomerId(id);
				if (addressList != null) {
					model.addAttribute("addressList", addressList);
					//编辑地址根据addressId获取信息
					String arid= req.getParameter("addressId");
					if(arid !=null){
						Integer addressId=Integer.valueOf(arid);
						Address updateAddress = customerService.findAddressByAddressId(addressId);
						if(updateAddress !=null){
							model.addAttribute("updateAddress",updateAddress);
							logicName = "person/address";
						}
					}else{
						logicName = "person/address";
					}
				} else {
					logicName = "person/index";
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			

		} else {
			logicName = "redirect:/toLogin";
		}
		return logicName;
	}
	
	
	String please="请选择";
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
	@RequestMapping("/addAddress")
	public String addAddress(@RequestParam(value = "addressSignName", required = false) String addressSignName,
			@RequestParam(value = "addressSignPhone", required = false) String addressSignPhone,
			@RequestParam(value = "province", required = false) String province,
			@RequestParam(value = "city", required = false) String city,
			@RequestParam(value = "town", required = false) String town,
			@RequestParam(value = "introduce",required = false) String introduce,
			HttpSession session
			)throws Exception{
		String logicName=null;
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
		if(num >0){
			session.setAttribute("success", "新增成功");
			logicName= "redirect:/person/toAddress";
		}else{
			session.setAttribute("error", "新增失败");
			logicName= "person/address";
		}
		return logicName;
	}
	
	
	/**
	 * 修改收货地址
	 * 设置默认收货地址和编辑收货地址
	 * @param req
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/updateAddress")
	public String updateAddress(
			HttpSession session,
			@RequestParam(value = "addressSignName", required = false) String addressSignName,
			@RequestParam(value = "addressSignPhone", required = false) String addressSignPhone,
			@RequestParam(value = "province", required = false) String province,
			@RequestParam(value = "city", required = false) String city,
			@RequestParam(value = "town", required = false) String town,
			@RequestParam(value = "introduce",required = false) String introduce,
			HttpServletRequest req

	) throws Exception {
		String logicName=null;
		Integer customerId = (Integer) session.getAttribute("customerId");
		Integer addressId = Integer.valueOf(req.getParameter("addressId"));
		// 获取修改类型，1表示修改默认，2表示编辑地址
		Integer updateType = Integer.valueOf(req.getParameter("n"));
		if (customerId != null && addressId != null) {
			Address address=new Address();
			address.setAddressId(addressId);
			// address.setCustomerId(customerId);
			if(updateType == 1 ) {
				// 取消原来默认地址
				int defNum =0;
				defNum = customerService.updateDefaultByCustomerId(customerId);
				List<Address> addressList=customerService.findAddressByCustomerId(customerId);
				if(addressList.size()>=1){
					defNum=1; 
				}
				if (defNum > 0) {
					// 设置默认地址
					address.setAddressId(addressId);
					address.setAddressDefault("是");
					int num = customerService.updateAddressByAddressId(address);
					if (num > 0) {
						session.setAttribute("success", "设置成功");
						logicName= "redirect:/person/toAddress";
					} else {
						session.setAttribute("error", "设置失败");
						logicName= "person/address";
					}
				} else {
					logicName= "redirect:/person/toAddress";
				}

			} else {
				// 编辑地址
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
				
				int num = customerService.updateAddressByAddressId(address);
				if(num>0){
					session.setAttribute("success", "修改成功");
					logicName= "redirect:/person/toAddress";
				}else{
					session.setAttribute("error", "修改失败");
					logicName= "redirect:/person/toAddress";
				}

			}
		}else{
			logicName="redirect:/toLogin";
		}

		return logicName;
	}

	/**
	 * 删除客户收货地址
	 * 
	 * @param req
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteAddress")
	public String deleteAddress(HttpServletRequest req, HttpSession session)
			throws Exception {
		String logicName=null;
		String id = req.getParameter("addressId");
		if (id != null || id != "") {
			Integer addressId = Integer.valueOf(id);
			int num = customerService.deleteAddressByAddressId(addressId);
			if (num > 0) {
				session.setAttribute("success", "删除成功");
				logicName= "redirect:/person/toAddress";
			} else {
				session.setAttribute("error", "删除失败");
				logicName= "person/address";
			}
		}
		return logicName;

	}
	/**
	 * 客户实名认证
	 * @param name
	 * @param ID
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/Certification")
	public String certification(@RequestParam(value="name",required=false)String name,
			@RequestParam(value="idcard",required=false)String ID,
			HttpSession session)throws Exception{
		String logicName=null;
		if(ID !=null && ID !=""){
			customer.setID(ID);
			//查找该身份证是否被实名过
			Customer cus=customerService.findCusAll(customer);
			if(cus == null){
				if(name !=null && name !=""){
					customer.setName(name);
				}
				Integer Id=(Integer)session.getAttribute("customerId");
				if(Id !=null){
					customer.setCustomerId(Id);
				}else{
					logicName="redirect:/toLogin";
				}
				int num=customerService.update(customer);
				if(num>0){
					session.setAttribute("success", "认证成功");
					logicName= "redirect:/person/toAddress";
				}else{
					session.setAttribute("error", "认证失败");
					logicName= "person/idcard";
				}
			}else{
				session.setAttribute("info", "同一身份证不能进行多次实名操作！");
				logicName= "person/idcard";
			}
		}
		return logicName;
		
	}
	
	
	
	

	@RequestMapping("/toPerson")
	public String toPersonIndex() {
		return "person/index";
	}

	@RequestMapping("/toHome")
	public String toHome() {
		return "redirect:/customer/toHome";
	}

	@RequestMapping("/toInformation")
	public String toInformation() {
		return "person/information";
	}

	@RequestMapping("/toSafety")
	public String toSafety() {
		return "person/safety";
	}

	@RequestMapping("/toCardlist")
	public String toCardlist() {
		return "person/cardlist";
	}
	@RequestMapping("/toOrder")
	public String toOrder(){
		return "redirect:/order/toOrder";
	}
	
	@RequestMapping("/toChange")
	public String toChange() {
		return "person/change";
	}
	/**
	 * 查询评论信息
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/toComment")
	public String toComment(HttpSession session,Model model) {
		String name = session.getAttribute("name").toString();
		List<Commentary> list = commentaryService.listCommentByCid(name);
		model.addAttribute("commentList",list);
		return "person/comment";
	}

	@RequestMapping("/toPoints")
	public String toPoints() {
		return "person/points";
	}

	@RequestMapping("/toCoupon")
	public String toCoupon() {
		return "person/coupon";
	}

	@RequestMapping("/toBonus")
	public String toBonus() {
		return "person/bonus";
	}

	@RequestMapping("/toWalletlist")
	public String toWalletlist() {
		return "person/walletlist";
	}

	@RequestMapping("/toCollection")
	public String toCollection() {
		return "person/collection";
	}

	@RequestMapping("/toFoot")
	public String toFoot() {
		return "person/foot";
	}

	@RequestMapping("/toConsultation")
	public String toConsultation() {
		return "person/consultation";
	}

	@RequestMapping("/toSuggest")
	public String toSuggest() {
		return "person/suggest";
	}

	@RequestMapping("/toNews")
	public String toNews() {
		return "person/news";
	}

	@RequestMapping("/toPassWord")
	public String toPassWord() {
		return "person/password";
	}

	@RequestMapping("/toBindphone")
	public String toBindphone() {
		return "person/bindphone";
	}
	
	@RequestMapping("/toIdCard")
	public String toIdCard(){
		return "person/idcard";
	}
}
