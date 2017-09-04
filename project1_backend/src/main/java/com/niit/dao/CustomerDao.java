package com.niit.dao;

import com.niit.model.Customer;
import com.niit.model.User;

public interface CustomerDao {
	void registerCustomer(Customer customer);
	User validateUsername(String username);
	Customer validateEmail(String eamil);
	Customer getCustomerByUsername(String username);
}
