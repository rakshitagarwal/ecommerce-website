package com.niit.Service;

import com.niit.model.Customer;
import com.niit.model.User;

public interface CustomerService {
	
	void registerCustomer(Customer customer);
	User validateUsername(String username);
	Customer validateEmail(String email);
    Customer getCustomerByUsername(String username);

}
