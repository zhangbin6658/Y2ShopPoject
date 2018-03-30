package com.mast.shop.dao.business;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mast.shop.bean.business.Product;

/**
 * 商品数据库访问层
 * 
 * @author Administrator
 * @version 1.0 
 */

public interface ProductDao {
	//1.分页查询商品列表    2.浏览网站信息  3.搜索商品（模糊查询按销量排序）	 	

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
	List<Product>findByCategroy(@Param(value="productName")String productName,
			@Param(value="categoryLevel1")String queryCategoryLevel1,
			@Param(value="categoryLevel2")String queryCategoryLevel2,
			@Param(value="categoryLevel3")String queryCategoryLevel3,
			@Param(value="pageIndex")Integer pageIndex,
			@Param(value="pageSize")Integer pageSize);


	public int findByCount(@Param(value="productName")String productName,
			@Param(value="categoryLevel1")String queryCategoryLevel1,
			@Param(value="categoryLevel2")String queryCategoryLevel2,
			@Param(value="categoryLevel3")String queryCategoryLevel3);
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
