package com.niit.project1_backend.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.project1_backend.model.Product;


@Repository("productDAO")
public class ProductDAO {
	@Autowired
	SessionFactory sessionFactory;

	public ProductDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insertUpdateProduct(Product product) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(product);
	}

	public Product getProduct(int ProdId) {
		Session session = sessionFactory.openSession();
		Product product = (Product) session.get(Product.class, ProdId);
		session.close();
		return product;
	}

	@Transactional
	public void deleteProduct(Product product) {
		sessionFactory.getCurrentSession().delete(product);
	}

	public List<Product> getProductDetails() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Product");
		List<Product> list = query.list();
		session.close();
		return list;
	}

}
