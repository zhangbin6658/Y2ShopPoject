package com.mast.shop.service.impl.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mast.shop.bean.admin.Address;
import com.mast.shop.bean.customer.Customer;
import com.mast.shop.dao.customer.CustomerDao;
import com.mast.shop.service.customer.CustomerService;
/**
 * Customer接口实现类
 * @author Administrator
 *
 */
@Service
public class CustomerServiceImpl implements CustomerService{
	@Autowired
	private CustomerDao customerMapper;
	
	@Override
	public Customer login(String customer) {
		return customerMapper.login(customer);
	}

	@Override
	public int save(Customer customer) {
		return customerMapper.save(customer);
	}

	@Override
	public int update(Customer customer) {
		
		return customerMapper.update(customer);
	}

	@Override
	public Customer findCusAll(Customer customer) {
		
		return customerMapper.findCusAll(customer);
	}

	@Override
	public List<Customer> customers(String nickName,String phone,String name,Integer pageIndex, Integer pageSize) {
		pageIndex=(pageIndex-1)*pageSize;
		return customerMapper.customers(nickName,phone,name,pageIndex, pageSize);
	}

	@Override
	public int count() {
		
		return customerMapper.count();
	}
	
	@Override
	public int delete(Integer id) {
		
		return customerMapper.delete(id);
	}

	@Override
	public Customer find(Integer id) {
		return customerMapper.find(id);
	}
	
	@Override
	public List<Address> findAddressByCustomerId(
			Integer customerId) throws Exception {
		
		return customerMapper.findAddressByCustomerId(customerId);
	}
	
	@Override
	public Address findAddressByAddressId(Integer addressId) throws Exception {
		
		return customerMapper.findAddressByAddressId(addressId);
	}
	
	@Override
	public int deleteAddressByAddressId(Integer addressId) throws Exception {
		
		return customerMapper.deleteAddressByAddressId(addressId);
	}

	@Override
	public int updateAddressByAddressId(Address address) throws Exception {
		
		return customerMapper.updateAddressByAddressId(address);
	}

	@Override
	public int updateDefaultByCustomerId(Integer customerId) {
		
		return customerMapper.updateDefaultByCustomerId(customerId);
	}

	@Override
	public int saveAddress(Address address) throws Exception {
		
		return customerMapper.saveAddress(address);
	}

	@Override
	public Customer findByNickName(String nickName) {
		return customerMapper.findByNickName(nickName);
	}

	@Override
	public int updateWallet(Customer customer) {
		return customerMapper.updateWallet(customer);
	}

	

	
	
}
