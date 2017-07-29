package com.niit.dao;

import org.hibernate.Query;
import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.model.Authorities;
import com.niit.model.Cart;
import com.niit.model.Customer;
import com.niit.model.User;

@Repository
public class CustomerDaoImpl implements CustomerDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void registerCustomer(Customer customer) {
		
		User user = customer.getUser();
		System.out.println(user);
		user.setEnabled(true);
		String  username = user.getUsername();
		
		Authorities authorities = new Authorities();
		authorities.setRole("ROLE_USER");
        authorities.setUsername(username);//transcient
		
        Session session = sessionFactory.getCurrentSession();
		session.save(authorities);//1 insert query //persistent
		
		Cart cart = new Cart();
		//to set the value for customer_id in cart table
		cart.setCustomer(customer);
		//to set value for cart_id in customer table
		customer.setCart(cart);  //transient all 5 objects
		
		session.save(customer);  //5 insert queries [persistent]
		
	}

	@Override
	public User ValidUsername(String username) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User where username = ?");
		query.setString(0, username);
		User user = (User)query.uniqueResult();
		//if query.uniqueResult returns a single object (1 row) ,then username is duplicate
		//if query.uniqueResult returns null value(no row) ,then username is unique
		return user;
	}

	@Override
	public Customer ValidateEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Customer where email = ?");
		query.setString(0, email);
		Customer customer = (Customer)query.uniqueResult();
        return customer;
	}

	@Override
	public Customer getCustomerByUsername(String username) {
		Session session = sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Customer where user.username=?");
		query.setString(0, username);
		Customer customer = (Customer)query.uniqueResult();
		return customer;
	}
	
	

}
