package com.niit.dao;

import com.niit.model.Customer;
import com.niit.model.User;

public interface CustomerDao {
	
	void registerCustomer(Customer customer);
	User ValidUsername(String username);
	Customer ValidateEmail(String email);

}
