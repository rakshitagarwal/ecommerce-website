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
	public String registerCustomer(@Valid @ModelAttribute Customer customer, BindingResult result) {

		if (result.hasErrors()) {
			return "registrationform";
		}
		customerService.registerCustomer(customer);
		return "home";
	}

}
