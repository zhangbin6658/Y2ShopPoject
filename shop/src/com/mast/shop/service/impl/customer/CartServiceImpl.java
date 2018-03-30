package com.mast.shop.service.impl.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mast.shop.bean.customer.Cart;
import com.mast.shop.dao.customer.CartDao;
import com.mast.shop.service.customer.CartService;

@Service("cartService")
public class CartServiceImpl implements CartService{
	@Autowired
	CartDao cartDao;
	@Override
	public int save(Cart cart) {
		return cartDao.save(cart);
	}
	@Override
	public List<Cart> listCart(Integer customerid) {
		return cartDao.listCart(customerid);
	}
	@Override
	public int updateCart(Cart cart) {
		
		return cartDao.updateCart(cart);
	}
	@Override
	public Cart findById(Integer pid) {
		return cartDao.findById(pid);
	}
	@Override
	public int deleteCart(Integer cid) {
		return cartDao.deleteCart(cid);
	}
	@Override
	public int updateBatch(List<Cart> carts) {
		return cartDao.updateBatch(carts);
	}
	@Override
	public int deleteCartByCid(Integer id) {
		return cartDao.deleteCartByCid(id);
		
	}
	
}
