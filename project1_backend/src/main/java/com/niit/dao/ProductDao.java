package com.niit.dao;

import com.niit.model.Category;
import com.niit.model.Product;
import java.util.List;


public interface ProductDao {
	void saveProduct(Product product);
	List<Product> getAllProducts();
	Product getProductById(int id);
	void deleteProduct(Product product);
	void editProduct(Product product);
	List<Category> getAllCategories();
}
