package com.niit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.niit.Service.CustomerService;
import com.niit.model.Customer;

@Controller
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	
	
	public String getRegistrationform(Model model){
		model.addAttribute("customer", new Customer());
		return "registrationform";
		}
	
	public String registerCustomer(@ModelAttribute Customer customer){
		
		customerService.registerCustomer(customer);
		return "home";
	}

}
