package com.niit.backend;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;


public class CustomerTestCase {

	public static void main(String[] args)
	{
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.niit.backend");
		context.refresh();
	}

}