package com.mast.shop.security;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

/**
 * 重写我们的登陆身份认证返回方法
 * 类描述：  
 * 类名称：com.tz.ssspm.security.LoginFormAuthticationFilter       
 * 创建人：tz  
 * 创建时间：2016年11月19日 下午10:24:53
 * @version   V1.0
 */
public class LoginFormAuthticationFilter extends FormAuthenticationFilter{
	/**
	 * 重写身份认证不成功方法
 	 */
	protected boolean onLoginFailure(AuthenticationToken token, 
								AuthenticationException e,
					            ServletRequest request, 
					            ServletResponse response){
		String errorMsg = "";
		if(e instanceof UnknownAccountException ||
				e instanceof IncorrectCredentialsException){
			errorMsg = "用户名和密码不正确";
			
		}else{
			errorMsg = "出现未知错误,请联系管理员";
		}
		request.setAttribute("errorMsg", errorMsg);
	 
		return true;
	}
	
	/**
	 * 重写身份认证成功以后返回地址 
 	 */
	protected void issueSuccessRedirect(ServletRequest request, ServletResponse response) throws Exception {
		String successUrl = getSuccessUrl();
		WebUtils.issueRedirect(request, response, successUrl, null, true);
	}
		
}
