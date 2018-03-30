package com.mast.shop.service.customer;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mast.shop.bean.admin.SendType;
import com.mast.shop.bean.business.Order;
import com.mast.shop.bean.business.OrderItem;
import com.mast.shop.bean.customer.Cart;
import com.mast.shop.bean.customer.Commentary;
/**
 * 订单接口访问
 * @author Administrator
 *
 */
public interface OrderService {
	int count(@Param("customerId")Integer customerId,@Param("typeName")String typeName);
	List<String> findOrderByCustomerIdAndTypeName(@Param("customerId")Integer customerId,@Param("typeName")String typeName,
												  @Param("pageIndex")Integer pageIndex,@Param("pageIndex")Integer pageSize)throws Exception;
	OrderItem findOrderDateAndPriceByOrderCode(@Param("orderCode")String orderCode)throws Exception;
	List<Order> findOrderByOrderCode(@Param("orderCode")String orderCode)throws Exception;
	int findDictionarytypeByTypeName(@Param("typeName")String typeName)throws Exception;
	int updateOrderByOrderCode(Order order)throws Exception;
	
	int orderCount();
	//生成订单	
	int save(Order order);
	//删除订单
	int delete(Integer id);
	//修改订单状态
	//根据orderid查询订单
	Order find (Integer id);
	//查询所有订单
	List<Order> orderList(Integer pageIndex, Integer pageSize);
	//根据id查询所有订单
	List<Order> findOrderByCustomerId(@Param("customerId")Integer customerId);
	
	int saveCommentary(Commentary commentary) throws Exception;
	List<SendType> findSendTypeByOrderCode(@Param("orderCode")String orderCode)throws Exception;
	
	int updateOrderState(Order order);

}
