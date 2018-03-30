package com.mast.shop.dao.customer;

import java.util.List;

import com.mast.shop.bean.customer.Cart;

/**
 * 购物车接口
 * 
 * @author Administrator
 * 
 */

/**
 * @author asus
 *
 */
public interface CartDao {
	/**
	 *  加入购物车
	 * @param cart
	 * @return
	 */
	int save(Cart cart);
	/**
	 * 查看购物车
	 * @param id
	 * @return
	 */
	List<Cart> listCart(Integer id);
	/**
	 * 修改购物车商品数量
	 * @param cart
	 * @return
	 */
	int updateCart(Cart cart);
	/**
	 * 根据条件
	 * @param cart
	 * @return
	 */
	Cart findById(Integer pid);
	/**
	 * 删除商品
	 * @param id
	 * @return
	 */
	int deleteCart(Integer cid);
	
	
	/**批量修改
	 * @param carts
	 * @return
	 */
	int updateBatch(List<Cart>carts);
	
	/**
	 * 删除购物车
	 * @param attribute
	 */
	int deleteCartByCid(Integer customerId);
}
