package com.niit.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.Service.CustomerService;
import com.niit.Service.ProductService;
import com.niit.model.Cart;
import com.niit.model.CartItem;
import com.niit.model.Customer;
import com.niit.model.Product;

public class CartItemController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("/cart/addtocart/{id}/{units}")
	public String addCartItem(@PathVariable int id, @PathVariable int units){
		Product product=productService.getProductById(id);
		//To get the user details , get the Principal object from securitycontextholder
		Principal principal=(Principal)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		String username=principal.getName();
		Customer customer=customerService.getCustomerByUsername(username);
		Cart cart = customer.getCart();
		List<CartItem> cartItems=cart.getCartItems();
		//check if purchased product is already existing in the cartitem table
		for(CartItem cartItem:cartItems)
		//product id in table (productid in database) == id(input)
		{
			if(cartItem.getProduct().getId()==id){
				cartItem.setQuantity(units);
				cartItem.setTotalPrice(cartItem.getProduct().getPrice() * units);
				cartItemService.addCartItem(cartItem);
				return "cart";
			}
		}
			CartItem cartItem= new CartItem();
			cartItem.setQuantity(units);
			cartItem.setTotalPrice(product.getPrice() * units);
			cartItem.setProduct(product);//product_id column in cartItem table
			cartItem.setCart(cart);//cart_id column in cartItem table
			cartItemService.addCartItem(cartItem);//insert
			
			return "cart";
		
	}

}
