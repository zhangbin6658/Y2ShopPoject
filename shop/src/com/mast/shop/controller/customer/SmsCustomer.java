package com.mast.shop.controller.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mast.shop.tools.SmsHttpTool;

/**
 * 短信验证码请求类
 * 
 * @author ZhangBin
 * 
 */

@Controller
@RequestMapping("/sms")
public class SmsCustomer {

	// 用户名
	private static String Uid = "旋风忽来";

	// 接口安全秘钥
	private static String Key = "fb15a6d249cb9c5a05e7";

	// 手机号码，多个号码如13800000000,13800000001,13800000002
	// private static String smsMob = "18220791130";

	// 短信内容
	// private static String smsText = "登录验证码：666666";
	@RequestMapping(value = "/sendSms", method = RequestMethod.POST)
//	@ResponseBody
	public void sendSms(Model model,
			@RequestParam(value = "phone", required = false) String smsMob,
			@RequestParam(value = "num", required = false) String num,
			HttpServletResponse resp,
			HttpServletRequest req)
			throws ServletException, IOException {
		// String smsMob = req.getParameter("phone");// 获取手机号
		// String num = req.getParameter("num");//请求类型
		String smsText = null;
		System.out.println("---------:" + smsMob + "------:" + num);
		if (smsMob == null) {
		} else {
			int random = 1 + (int) (Math.random() * 999998 + 1);
			if ("1".equals (num)) {
				smsText = "注册验证码：" + random;
			} else if (("2".equals (num))) {
				smsText = "换绑验证码：" + random;
			}

			SmsHttpTool sms = SmsHttpTool.getInstance();
			int successCount = sms.sendMsgUtf8(Uid, Key, smsText, smsMob);
			System.out.println("------phone:" + smsMob + "-----" + smsText);
			//int successCount=1;
			 if (successCount > 0) {
			 // 发送成功，返回验证码到页面
			 resp.getWriter().print(random);
			 System.out.println("true");
			 } else {
			 resp.getWriter().print(0);
			 }
		}
	}
}
