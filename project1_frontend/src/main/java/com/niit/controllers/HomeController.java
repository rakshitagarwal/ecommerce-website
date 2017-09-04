package com.niit.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.service.ProductService;

@Controller
public class HomeController
{
	
	@Autowired
	private ProductService productService;
	
	HomeController()
	{
		System.out.println("Creating Instance of HomeController");
	}
	
	@RequestMapping("/home")
	public String homepage(HttpSession session)
	{
		session.setAttribute("categories",productService.getAllCategories());
		return "home";
	}

	@RequestMapping("/aboutus")
	public String aboutus()
	{
		return "aboutus";
	}
	
	@RequestMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error, 
			@RequestParam(value = "logout", required = false) String logout, Model model)
	{
		if(error != null) {
			model.addAttribute("error", "Username or Password Incorrect");
			}
		
		if(logout != null) {
			model.addAttribute("logout", "Logged out Successfully");
			}
		return "login";
	}
	
	
}
