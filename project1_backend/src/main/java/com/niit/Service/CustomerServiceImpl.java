package com.niit.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.CustomerDao;
import com.niit.model.Customer;
import com.niit.model.User;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerDao customerDao;

	@Override
	public void registerCustomer(Customer customer) {
		customerDao.registerCustomer(customer);

	}

	@Override
	public User ValidUsername(String username) {
		return customerDao.ValidUsername(username);
	}

	@Override
	public Customer ValidateEmail(String email) {
		return customerDao.ValidateEmail(email);
	}

	@Override
	public Customer getCustomerByUsername(String username) {
		return customerDao.getCustomerByUsername(username);
	}

}
