 package com.niit.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.Service.CustomerService;
import com.niit.model.Customer;
import com.niit.model.User;

@Controller
public class CustomerController {
	@Autowired
	private CustomerService customerService;

	@RequestMapping("/all/registrationform")
	public String getRegistrationform(Model model) {
		model.addAttribute("customer", new Customer());
		return "registrationform";
	}

	@RequestMapping("/all/savecustomer")
	public String registerCustomer(@Valid @ModelAttribute Customer customer, 
			BindingResult result , Model model) 
	//Notempty , size , wellformed email , address , @Valid
	{

		if (result.hasErrors()) {
			return "registrationform";
		}
		User user = customerService.ValidUsername(customer.getUser().getUsername());
		if(user!=null) //duplicate username
		{
			model.addAttribute("duplicateUsername","Username already exists");
			return "registrationform";
		}
		Customer duplicateCustomer = customerService.ValidateEmail(customer.getEmail());
		if(duplicateCustomer!=null)
		{
			model.addAttribute("duplicateEmail","Email address already exists");
			return "registrationform";	
			
		}
		customerService.registerCustomer(customer);
		return "home";
		
	}

}
