package com.niit.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.model.Cart;
import com.niit.model.Customer;
import com.niit.model.CustomerOrder;
import com.niit.model.ShippingAddress;
import com.niit.service.CartItemService;
import com.niit.service.CustomerOrderService;
import com.niit.service.CustomerService;
import com.niit.service.ProductService;


@Controller
public class CustomerOrderController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private CustomerOrderService customerOrderService;
	@Autowired
	private CartItemService cartItemService;
	@Autowired
	private CustomerService customerService;

	@RequestMapping("/cart/shippingaddressform/{cartId}")
	public String getShippingAddress(@PathVariable int cartId, Model model) {
		
		System.out.println(SecurityContextHolder.getContext().getAuthentication().getPrincipal());
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();		
		String username=user.getUsername();
		Customer customer=customerService.getCustomerByUsername(username);
		Cart cart=customer.getCart();
		model.addAttribute("shippingAddress", customer.getShippingAddress());
		model.addAttribute("cartid", cartId);
		return "shippingaddressform";
	}

	@RequestMapping("/cart/order/{cartId}")
	public String createOrder(@PathVariable int cartId, @ModelAttribute ShippingAddress shippingAddress, Model model) {
		Cart cart = cartItemService.getCart(cartId);
		Customer customer = cart.getCustomer();
		customer.setShippingAddress(shippingAddress);
		cart.setCustomer(customer);
		CustomerOrder customerOrder = customerOrderService.createOrder(cart);
		model.addAttribute("order", customerOrder);
		model.addAttribute("cartid", cartId);
		return "orderdetails";
	}

	@RequestMapping("/cart/confirm/{id}")
	public String confirm(@ModelAttribute CustomerOrder order, @PathVariable int id) {
		cartItemService.removeAllCartItems(id);
		return "thanks";
	}
	@RequestMapping("/cart/confirm/home")
	public String confirmhome(HttpSession session) {
		session.setAttribute("categories",productService.getAllCategories());
		return "redirect:/home";
	}
}