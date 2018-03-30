package com.mast.shop.dao.customer;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mast.shop.bean.admin.SendType;
import com.mast.shop.bean.business.Order;
import com.mast.shop.bean.business.OrderItem;
import com.mast.shop.bean.customer.Cart;
import com.mast.shop.bean.customer.Commentary;
/**
 * 订单管理
 * @author ZhangBin
 *
 */
public interface OrderDao {
	/**
	 * 根据用户Id查询出所有订单编号
	 * @param customerId
	 * @return
	 * @throws Exception
	 */
	
	int count(@Param("customerId")Integer customerId,@Param("typeName")String typeName);
	List<String> findOrderByCustomerIdAndTypeName(@Param("customerId")Integer customerId,@Param("typeName")String typeName,
												  @Param("pageIndex")Integer pageIndex,@Param("pageSize")Integer pageSize)throws Exception;
	/**
	 * 根据订单编号查寻下单日期，成交日期和订单总价
	 * @param orderCode
	 * @return
	 * @throws Exception
	 */
	OrderItem findOrderDateAndPriceByOrderCode(@Param("orderCode")String orderCode)throws Exception;
	/**
	 * 查询订单下的所有商品
	 * @return
	 * @throws Exception
	 */
	List<Order> findOrderByOrderCode(@Param("orderCode")String orderCodez)throws Exception;
	/**
	 * 根据状态名称查询id
	 * @param typeName
	 * @return
	 * @throws Exception
	 */
	int findDictionarytypeByTypeName(@Param("typeName")String typeName)throws Exception;
	
	/**
	 * 更具订单编号修改订单信息
	 * @param orderCode 编号
	 * @param orderCLook 可见状态
	 * @return
	 * @throws Exception
	 */
		int updateOrderByOrderCode(Order order)throws Exception;
		//生成订单	
		int save(Order order);
		//删除订单
		int delete(@Param("orderId") Integer orderId);
		//根据orderid查询订单
		Order find (Integer id);
		
		//根据customerid查询所有订单
		List<Order> findOrderByCustomerId(@Param("customerId")Integer customerId);
		List<Order> orderList(@Param("pageIndex") Integer pageIndex,@Param("pageSize") Integer pageSize);
		int orderCount();
		/**
		 * 保存评论
		 * @param commentaryList
		 * @return
		 * @throws Exception
		 */
		int saveCommentary(Commentary commentary) throws Exception;
		/**
		 * 查询订单快递单号与快递编码
		 * @param orderCode
		 * @return
		 * @throws Exception
		 */
		List<SendType> findSendTypeByOrderCode(@Param("orderCode")String orderCode)throws Exception;
		
		int updateOrderState(Order order);
}
