package com.mast.shop.service.impl.business;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mast.shop.dao.business.BusinessDao;
import com.mast.shop.service.business.BusinessService;

/**
 * 商家业务逻辑层
 * 
 * @author Administrator
 * @version 1.0 
 */
@Service
public class BusinessServiceImpl implements BusinessService{
@Resource
BusinessDao businessDao;

public BusinessDao getBusinessDao() {
	return businessDao;
}

public void setBusinessDao(BusinessDao businessDao) {
	this.businessDao = businessDao;
}
}
