package com.mast.shop.service.impl.business;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mast.shop.bean.business.Product;
import com.mast.shop.dao.business.ProductDao;
import com.mast.shop.service.business.ProductService;

/**
 * 商品业务逻辑层
 * 
 * @author Administrator
 * @version 1.0
 */
@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDao productDao;

	@Override
	public List<Product> findByDate() {
		return productDao.findByDate();
	}

	@Override
	public Product find(Product product) {
		return productDao.find(product);
	}

	@Override
	public List<Product> findBySail() {
		return productDao.findBySail();
	}

	@Override
	public List<Product> findByCategroy(String productName,
			String queryCategoryLevel1, String queryCategoryLevel2,
			String queryCategoryLevel3, Integer pageIndex, Integer pageSize) {
		pageIndex=(pageIndex-1)*pageSize;
		return productDao.findByCategroy(productName, queryCategoryLevel1, queryCategoryLevel2, queryCategoryLevel3, pageIndex, pageSize);
	}

	@Override
	public int findByCount(String productName, String queryCategoryLevel1,
			String queryCategoryLevel2, String queryCategoryLevel3) {
		return productDao.findByCount(productName, queryCategoryLevel1, queryCategoryLevel2, queryCategoryLevel3);
	}

	@Override
	public Product findById(Integer id) {
		
		return productDao.findById(id);
	}

	@Override
	public int update(Product product) {
		return productDao.update(product);
	}

	

	@Override
	public int save(Product product) {
		return productDao.save(product);
	}

	@Override
	public int updateStatus(Product product) {
		return productDao.updateStatus(product);
	}

	@Override
	public int delete(Integer id) {
		return productDao.delete(id);
	}

	@Override
	public int updateCount(Product product) {
		return productDao.updateCount(product);
	}
}
