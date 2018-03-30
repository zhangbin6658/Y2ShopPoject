package com.mast.shop.service.impl.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mast.shop.bean.admin.DictionaryType;
import com.mast.shop.dao.admin.DictionaryTypeDao;
import com.mast.shop.service.admin.DictionaryTypeService;

/**
 * 管理员业务逻辑层
 * 
 * @author Administrator
 * @version 1.0 
 */
@Service
public class DictionaryTypeServiceImpl implements DictionaryTypeService {
	@Autowired
	DictionaryTypeDao dictionaryTypeDao;

	@Override
	public List<DictionaryType> getDataDictionaryList(String typeCode)
			throws Exception {
		return dictionaryTypeDao.getDataDictionaryList(typeCode);
	}

	@Override
	public List<DictionaryType> findProductCategroy(
			DictionaryType dictionaryType) {
		return dictionaryTypeDao.findProductCategroy(dictionaryType);
	}

	
}
