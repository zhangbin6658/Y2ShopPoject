package com.mast.shop.service.impl.business;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mast.shop.bean.admin.SendType;
import com.mast.shop.bean.business.Order;
import com.mast.shop.bean.business.OrderItem;
import com.mast.shop.bean.customer.Cart;
import com.mast.shop.bean.customer.Commentary;
import com.mast.shop.dao.customer.OrderDao;
import com.mast.shop.service.customer.OrderService;
@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	OrderDao orderDao;

	@Override
	public int save(Order order) {
		return orderDao.save(order);
	}
	@Override
	public OrderItem findOrderDateAndPriceByOrderCode(String orderCode)
			throws Exception {
		return orderDao.findOrderDateAndPriceByOrderCode(orderCode);
	}

	@Override
	public List<Order> findOrderByOrderCode(String orderCode) throws Exception {
		return orderDao.findOrderByOrderCode(orderCode);
	}

	@Override
	public int findDictionarytypeByTypeName(String typeName) throws Exception {
		return orderDao.findDictionarytypeByTypeName(typeName);
	}

	@Override
	public int updateOrderByOrderCode(Order order) throws Exception {
		return orderDao.updateOrderByOrderCode(order);
	}

	@Override
	public List<Order> findOrderByCustomerId(Integer customerId) {
		return orderDao.findOrderByCustomerId(customerId);
	}
	@Override
	public int saveCommentary(Commentary commentary) throws Exception {
		
		return orderDao.saveCommentary(commentary);
	}

	@Override
	public List<SendType> findSendTypeByOrderCode(String orderCode)
			throws Exception {
		
		return orderDao.findSendTypeByOrderCode(orderCode);
	}

	@Override
	public Order find(Integer id) {
		
		return orderDao.find(id);
	}

	@Override
	public int count(Integer customerId, String typeName) {
		return orderDao.count(customerId, typeName);
	}

	@Override
	public List<String> findOrderByCustomerIdAndTypeName(Integer customerId,
			String typeName, Integer pageIndex, Integer pageSize)
			throws Exception {
		pageIndex=(pageIndex-1)*pageSize;
		return orderDao.findOrderByCustomerIdAndTypeName(customerId, typeName, pageIndex, pageSize);
	}

	@Override
	public List<Order> orderList( Integer pageIndex, Integer pageSize) {
		pageIndex=(pageIndex-1)*pageSize;
		return orderDao.orderList( pageIndex, pageSize);
	}

	@Override
	public int delete(Integer id) {
		return orderDao.delete(id);
	}

	@Override
	public int orderCount() {
		return orderDao.orderCount();
	}
	@Override
	public int updateOrderState(Order order) {
		return orderDao.updateOrderState(order);
	}
	
}
