package com.niit.project1_backend;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.Service.ProductService;
import com.niit.Service.ProductServiceImpl;
import com.niit.configuration.DBConfiguration;
import com.niit.dao.ProductDaoImpl;
import com.niit.model.Product;

public class App 
{
    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );
        ApplicationContext context=
        		new AnnotationConfigApplicationContext(DBConfiguration.class,ProductDaoImpl.class,ProductServiceImpl.class);
        ProductService productService=(ProductService)context.getBean("productServiceImpl");
        
        Product product=new Product();
        product.setId(1);
        product.setProductName("Pen");
        product.setPrice(100);  
        product.setQuantity(10);
        product.setDescription("some description");
        
        productService.saveProduct(product);
        
        
    }
}
