package com.mast.shop.security;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.mast.shop.bean.customer.Customer;
import com.mast.shop.service.customer.CustomerService;
import com.mast.shop.tools.EncryptUtil;
import com.mast.shop.tools.Principle;


public class UserRealm extends AuthorizingRealm{
	
	@Autowired
	private CustomerService customerService;
	//用户身份认证
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		//获取页面传入的用户名和密码 token
		UsernamePasswordToken authtoken = (UsernamePasswordToken)token;
		String userName= authtoken.getUsername();
		//模拟根据得到的userName	去数据库查询这个用户是否存在
		/*User user = new User();
		user.setLoginName("admin"); 
		user.setPassword("123456");*/
		//根据userName去数据库查询用户对象
		
		Customer customer= this.customerService.login(userName);
		Principle principle = new Principle(customer.getCustomerId(),customer.getNickName(),customer.getName());
		if(userName.equals(customer.getNickName())){//身份信息已经确认，接下来进行凭证信息匹配
			//身份信息确认以后，凭证信息的确认由SimpleAuthenticationInfo 的父类AuthenticationInfo进行验证
			//获取salt
			byte[] salt = EncryptUtil.decodeHex(customer.getPassWord().substring(0,16));
			//告诉shiro用什么加密算法(sha1,md5) 和迭代次数
			
			/*SimpleAuthenticationInfo simpleAuthenticationInfo =
						new SimpleAuthenticationInfo(user.getLoginName(),user.getPassword(),
									getName()); 
			*/
			SimpleAuthenticationInfo simpleAuthenticationInfo =
					new SimpleAuthenticationInfo(principle,customer.getPassWord().substring(16),
								ByteSource.Util.bytes(salt),getName()); 
			return simpleAuthenticationInfo;
		}
		
		return null;
	}

	
	//用户授权
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principles) {
		/*String userName = (String)principle.getPrimaryPrincipal();*/
		@SuppressWarnings("unused")
		Principle principle = (Principle)principles.getPrimaryPrincipal();
		
		/*//模拟根据的到的user对象的userName或者userId去数据库查询这个用户存在哪些资源操作权限
		List<String> permissions = new ArrayList<String>();
		permissions.add("user:add");
		permissions.add("user:delete");
		permissions.add("user:update");
		permissions.add("dict:query");*/
		/*List<Menu> menuList = menuService.getMenuListByUserId(principle.getUserId());
		List<String> permissions = new ArrayList<String>();
		if(menuList!=null&&menuList.size()>0){
			for(Menu menu:menuList){
				if(StringUtils.isNotEmpty(menu.getPermission())){
					permissions.add(menu.getPermission());
				}
			}
		}*/
 
		//将得到的权限信息放入simpleAuthorizationInfo对象保存
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		/*simpleAuthorizationInfo.addStringPermissions(permissions);*/
		
		return simpleAuthorizationInfo;
	}

	
	
}
