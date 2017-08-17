package com.niit.project1_backend;

import java.util.List;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.project1_backend.dao.CartDAO;
import com.niit.project1_backend.model.Cart;


public class CartTestCase 
{
public static void main(String[] args)
{
	AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
	context.scan("com.fantezy.FantezyBackendProject");
	context.refresh();
	CartDAO cartDAO=(CartDAO)context.getBean("cartDAO");
			Cart cart=new Cart();
	cart.setCartid(1001);
	cart.setProdid(3);
	cart.setProdname("Leggin");
	cart.setPrice(12000);
	cart.setQuantity(6);
	cart.setStatus("N");
	cart.setUsername("Harini");
	cartDAO.addToCart(cart);
	System.out.println("Added To Cart");
	List<Cart> list=cartDAO.getCartItems("Harini");
	
	for(Cart cart2:list)
	{
		System.out.println(cart2.getCartid()+";;;");
		System.out.println(cart2.getProdid()+";;;");
		System.out.println(cart2.getProdname()+";;;");
		System.out.println(cart2.getPrice()+";;;");
		System.out.println(cart2.getQuantity()+";;;");
		
	}
			
	
}
}
