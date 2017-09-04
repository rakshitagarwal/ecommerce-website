package com.niit.service;

import com.niit.model.Category;
import com.niit.model.Product;
import java.util.List;

public interface ProductService {
	void saveProduct(Product product);

	List<Product> getAllProducts();

	Product getProductById(int id);

	void deleteProduct(int id);

	void updateProduct(Product product);

	List<Category> getAllCategories();
}
