package com.mast.shop.dao.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mast.shop.bean.admin.DictionaryType;


/**
 * 数据库字典
 * 
 * @author Administrator
 * @version 1.0
 */
public interface DictionaryTypeDao {
	//查询数据库字典表(三级分类)
	List<DictionaryType> findProductCategroy(DictionaryType dictionaryType);
	
	List<DictionaryType> getDataDictionaryList(@Param("typeCode")String typeCode)throws Exception;
	
}
