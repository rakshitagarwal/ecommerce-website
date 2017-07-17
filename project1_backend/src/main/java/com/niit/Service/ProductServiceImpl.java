package com.niit.Service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.niit.dao.ProductDao;
import com.niit.model.Category;
import com.niit.model.Product;

@Service
@Transactional
public class ProductServiceImpl implements ProductService{
	public ProductServiceImpl(SessionFactory sessionFactory){
		System.out.println("ProductServiceImpl object is created");
	}

	@Autowired
	private ProductDao productDao;
	public void saveProduct(Product product){
		productDao.saveProduct(product);
	}
	@Override
	public List<Product> getAllProducts() {
		return productDao.getAllProducts();
	}
	@Override
	public Product getProductById(int id) {
		return productDao.getProductById(id);
	}
	@Override
	public void deleteProduct(int id) {

		Product product = getProductById(id);
		productDao.deleteProduct(product);
	}
	@Override
	public void updateProduct(Product product) {

		productDao.editProduct(product);
	}
	@Override
	public List<Category> getAllCategories() {
		return productDao.getAllCategories();
	}
}
