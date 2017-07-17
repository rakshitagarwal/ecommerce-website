package com.niit.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	HomeController(){
		System.out.println("Creating instance of HomeController");
	}
	@RequestMapping("/home")
	public String homePage(){
		return "home";
	}
	@RequestMapping("/aboutus")
	public String aboutUs(){
		return "aboutus";
	}
}
