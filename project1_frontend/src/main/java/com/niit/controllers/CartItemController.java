package com.niit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.Service.CartItemService;
import com.niit.Service.CustomerService;
import com.niit.Service.ProductService;
import com.niit.model.Cart;
import com.niit.model.CartItem;
import com.niit.model.Customer;
import com.niit.model.Product;
@Controller
public class CartItemController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private CartItemService cartItemService;
	
	@RequestMapping("/cart/addtocart/{id}")
	public String addCartItem(@PathVariable int id, @RequestParam int units ,Model model){
		Product product=productService.getProductById(id);
		//To get the user details , get the Principal object from securitycontextholder
		System.out.println(SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();		
		String username=user.getUsername();
		Customer customer=customerService.getCustomerByUsername(username);
		Cart cart = customer.getCart();
		List<CartItem> cartItems=cart.getCartItems();
		System.out.println(cart.getCartItems().size());
		//check if purchased product is already existing in the cartitem table
		for(CartItem cartItem:cartItems){
		//product id in table (productid in database) == id(input)
		System.out.println(cartItem.getProduct().getId());
		System.out.println(id);
		
		if(cartItem.getProduct().getId()==id){
			cartItem.setQuantity(units);
			cartItem.setTotalPrice(product.getPrice() * units);
			cartItemService.addCartItem(cartItem);//update cartitem units & totalPrice
			model.addAttribute("cart",cart);
			return "redirect:/cart/getcart";
			}
		}
		CartItem cartItem= new CartItem();
		cartItem.setQuantity(units);
		cartItem.setTotalPrice(product.getPrice() * units);
		cartItem.setProduct(product);//product_id column in cartItem table
		cartItem.setCart(cart);//cart_id column in cartItem table
		cartItemService.addCartItem(cartItem);//insert
			
		return "redirect:/cart/getcart";
		
	}
	@RequestMapping("/cart/getcart")
	public String getCart(Model model){
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = user.getUsername();
		Customer customer = customerService.getCustomerByUsername(username);
		Cart cart = customer.getCart();
		model.addAttribute("cart",cart);
		return "cart";
	}
	@RequestMapping("/cart/removecartitem/{cartItemId}")
	public String removeCartItem(@PathVariable int cartItemId){
		cartItemService.removeCartItem(cartItemId);
		return "redirect:/cart/getcart";
	}
	@RequestMapping("/cart/clearcart/${cart.id}")
	public String removeAllCartItems(int cartId){
		cartItemService.removeAllCartItems(cartId);
		return "redirect:/cart/getcart";
	}

}
