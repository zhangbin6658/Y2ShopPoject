package com.mast.shop.controller.business;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.mast.shop.bean.business.Product;
import com.mast.shop.dao.business.ProductDao;
import com.mast.shop.service.business.BusinessService;
import com.mast.shop.service.business.ProductService;

/**
 * 商家请求类
 * 
 * @author Administrator
 * @version 1.0 
 */
@Controller
public class BusinessController {
	@Resource
	BusinessService businessService;
	
	@Resource
	ProductService productService;
	
	public	BusinessService getBusinessService() {
		return businessService;
	}

	public	void setBusinessService(BusinessService businessService) {
		this.businessService = businessService;
	}
	
		
	}
