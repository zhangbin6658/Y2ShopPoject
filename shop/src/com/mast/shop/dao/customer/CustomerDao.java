package com.mast.shop.dao.customer;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mast.shop.bean.admin.Address;
import com.mast.shop.bean.admin.DictionaryType;
import com.mast.shop.bean.customer.Customer;
/**
 * 客户接口类
 * @author Administrator
 *
 */
/**
 * @author asus
 *
 */
public interface CustomerDao {
	/**
	 * 登录
	 * @param customer
	 * @return
	 */
	Customer login(String customerName);
	/**
	 * 注册
	 * @param customer
	 * @return
	 */
	int save(Customer customer);
	/**
	 * 修改
	 * @param customer
	 * @return
	 */
	int update(Customer customer);
	/**
	 * 条件查找用户信息
	 * @param customer
	 * @return
	 */
	Customer findCusAll(Customer customer);
	/**
	 * 分页显示用户信息
	 */
	List<Customer> customers(@Param("nickName")String nickName,@Param("phone")String phone,@Param("name")String name,@Param("pageIndex") Integer pageIndex,@Param("pageSize") Integer pageSize);
	/**
	 * 获取总记录数
	 * @return
	 */
	int count();
	
	int delete(Integer id);
	
	Customer find(Integer id);
	
	/**
	 * 判断nickName是否为空
	 * @param nickName
	 * @return
	 */
	Customer findByNickName(String nickName);
	
	/**
	 * 钱包支付
	 * @param customer
	 * @return
	 */
	int updateWallet(Customer customer);
	
	
	
	/**
	 * 根据customerId查询自己所有收货地址
	 * @param customerId
	 * @return
	 * @throws Exception
	 */
	List<Address> findAddressByCustomerId(@Param("customerId")Integer customerId)throws Exception;
	/**
	 * 更具addressId查询地址信息
	 * @param addressId
	 * @return
	 * @throws Exception
	 */
	Address findAddressByAddressId(@Param("addressId")Integer addressId)throws Exception;
	/**
	 * 添加收货地址
	 * @param address
	 * @return
	 * @throws Exception
	 */
	int saveAddress(Address address)throws Exception;
	/**
	 * 修改收货地址
	 * @param addressId
	 * @return
	 * @throws Exception
	 */
	int updateAddressByAddressId(Address address)throws Exception;
	
	/**
	 * 取消默认收货地址
	 * @param customerId
	 * @return
	 */
	int updateDefaultByCustomerId(@Param("customerId")Integer customerId);
	
	/**
	 * 删除收货地址
	 * @param addressId
	 * @return
	 * @throws Exception
	 */
	int deleteAddressByAddressId(@Param("addressId")Integer addressId)throws Exception;
	
	
	
}
