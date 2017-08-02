package com.niit.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;

import com.niit.model.Category;
import com.niit.model.Product;

@Repository
public class ProductDaoImpl implements ProductDao{
	
	public ProductDaoImpl(){
		System.out.println("ProductDaoImpl object is created");
	}
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void saveProduct(Product product){
		Session session=sessionFactory.getCurrentSession();
		session.save(product);
	}
	@Override
	public List<Product> getAllProducts() {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Product");
		List<Product> products = query.list();
		return products;
	}
	@Override
	public Product getProductById(int id) {
		Session session=sessionFactory.getCurrentSession();
		Product product=(Product)session.get(Product.class, id);
		return product;
	}
	@Override
	public void deleteProduct(Product product) {
		Session session=sessionFactory.getCurrentSession();
		session.delete(product);
		
	}
	@Override
	public void editProduct(Product product) {
		Session session=sessionFactory.getCurrentSession();
		session.update(product);//update product set productname

	}
	@Override
	public List<Category> getAllCategories() {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Category");
		List<Category> categories = query.list();
		System.out.println(categories);
		return categories;
	}
}
