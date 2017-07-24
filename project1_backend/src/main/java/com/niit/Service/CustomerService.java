package com.niit.Service;

import com.niit.model.Customer;
import com.niit.model.User;

public interface CustomerService {
	
	void registerCustomer(Customer customer);
	User ValidUsername(String username);
	Customer ValidateEmail(String email);


}
