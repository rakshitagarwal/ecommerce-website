package com.niit.dao;

import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.model.Authorities;
import com.niit.model.Cart;
import com.niit.model.Customer;

@Repository
public class CustomerDaoImpl implements CustomerDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void registerCustomer(Customer customer) {
		Authorities authorities = new Authorities();
		authorities.setRole("ROLE_USER");
		String username = customer.getUser().getUsername();
		authorities.setUsername(username);
		Session session = sessionFactory.getCurrentSession();
		session.save(authorities);
		
		Cart cart = new Cart();
		cart.setCustomer(customer);
		customer.setCart(cart);
		
		session.save(customer);
		
	}
	
	

}
