package com.niit.project1_backend;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.project1_backend.dao.UserDAO;
import com.niit.project1_backend.model.UserRegister;


public class UserTestCase {
	public static void main(String[] args) {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.fantezy.FantezyBackendProject");
		context.refresh();

		UserDAO userDAO = (UserDAO) context.getBean("UserDAO");

		UserRegister user = new UserRegister();

		user.setAddress("Noida");
		user.setPassword("123");
		user.setCustomername("rakshit");

		user.setEmail("rakshit@gmail.com");
		user.setRole("ROLE_ADMIN");
		user.setMobile(123456);
        user.setUsername("rakshit17"); 
		userDAO.insertUpdateUser(user);
		System.out.println("User Inserted");


	}
}
