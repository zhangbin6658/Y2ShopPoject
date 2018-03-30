package com.mast.shop.service.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mast.shop.bean.admin.DictionaryType;
import com.mast.shop.dao.admin.DictionaryTypeDao;

/**
 * 数据库字典
 * 
 * @author Administrator
 * @version 1.0
 */

public interface DictionaryTypeService {
	
	List<DictionaryType> findProductCategroy(DictionaryType dictionaryType);
	
	List<DictionaryType> getDataDictionaryList(String typeCodeId)throws Exception;
}
