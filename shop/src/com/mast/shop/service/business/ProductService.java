package com.mast.shop.service.business;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mast.shop.bean.business.Product;

/**
 * 商品业务逻辑层接口
 * 
 * @author Administrator
 * @version 1.0 
 */
public interface ProductService {
	/**
	 * 最新商品
	 * @return
	 */
	List<Product>findByDate();
	
	/**
	 * 最热商品
	 * @return
	 */
	List<Product>findBySail();
	/**
	 * 1.查询商品详细信息  
	 * @param product
	 * @return
	 */
	Product find(Product product);
	
	Product findById(Integer id);
	/**
	 * 修改商品
	 * @param product
	 * @return
	 */
	int update(Product  product);
	/**
	 * 下架商品
	 * @param product
	 * @return
	 */
	int updateStatus(Product product);
	/**
	 * 保存商品
	 * @param product
	 * @return
	 */
	int save(Product product);
	/**
	 * 分类查询商品列表
	 * @param productName
	 * @param queryCategoryLevel1
	 * @param queryCategoryLevel2
	 * @param queryCategoryLevel3
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	List<Product>findByCategroy(String productName,
			String queryCategoryLevel1,
			String queryCategoryLevel2,
			String queryCategoryLevel3,
			Integer pageIndex,
			Integer pageSize);


	public int findByCount(String productName,
			String queryCategoryLevel1,
			String queryCategoryLevel2,
			String queryCategoryLevel3);
	/**
	 * 删除商品
	 * @param id
	 * @return
	 */
	int delete (Integer id);
	/**
	 * 更新商品库存
	 * @param product
	 * @return
	 */
	int updateCount(Product product);

}
