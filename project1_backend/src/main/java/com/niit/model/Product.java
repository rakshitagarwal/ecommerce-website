package com.niit.model;
import javax.persistence.*;
import javax.validation.constraints.*;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;



@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
     private int id;
	@NotEmpty(message="Product Name can't be blank")
     private String productName;
	@Min(value=50)
     private double price;
     private int quantity;
     @NotEmpty(message="Product Name can't be blank")
     private String description;
     @ManyToOne(cascade=CascadeType.ALL)
     @JoinColumn(name="cid")
     private Category category;
     
     private MultipartFile image;
     
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
     
}
