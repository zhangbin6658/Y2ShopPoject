
package com.mast.shop.service.customer;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mast.shop.bean.admin.Address;
import com.mast.shop.bean.admin.DictionaryType;
import com.mast.shop.bean.customer.Customer;
/**
 * 
 * @author Administrator
 *
 */
public interface CustomerService {
	Customer login(String customer);
	int save(Customer customer);
	int update(Customer customer);
	Customer findCusAll(Customer customer);
	List<Address> findAddressByCustomerId(@Param("customerId")Integer customerId)throws Exception;
	Address findAddressByAddressId(@Param("addressId")Integer addressId)throws Exception;
	int saveAddress(Address address)throws Exception;
	int updateAddressByAddressId(Address address)throws Exception;
	int updateDefaultByCustomerId(@Param("customerId")Integer customerId);
	int deleteAddressByAddressId(@Param("addressId")Integer addressId)throws Exception;
	/**
	 * 判断nickName是否为空
	 * @param nickName
	 * @return
	 */
	Customer findByNickName(String nickName);
	/**
	 * 分页显示用户信息
	 */
	List<Customer> customers(String nickName,String phone,String name,Integer pageIndex, Integer pageSize);
	int count();
	int delete(Integer id);
	Customer find(Integer id);
	/**
	 * 钱包支付
	 * @param customer
	 * @return
	 */
	int updateWallet(Customer customer);
	


}
