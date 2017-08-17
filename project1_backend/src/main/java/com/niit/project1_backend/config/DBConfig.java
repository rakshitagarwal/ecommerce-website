package com.niit.project1_backend.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.niit.project1_backend.dao.CartDAO;
import com.niit.project1_backend.dao.CategoryDAO;
import com.niit.project1_backend.dao.ProductDAO;
import com.niit.project1_backend.dao.SupplierDAO;
import com.niit.project1_backend.dao.UserDAO;
import com.niit.project1_backend.model.Cart;
import com.niit.project1_backend.model.Category;
import com.niit.project1_backend.model.Product;
import com.niit.project1_backend.model.Supplier;
import com.niit.project1_backend.model.UserRegister;

@Configuration
@ComponentScan("com.niit")
@EnableTransactionManagement
public class DBConfig{
	@Bean(name = "dataSource")
	public DataSource getH2Datasource() {
		System.out.println("Starting of the method getH2datasource");
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUrl("jdbc:h2:tcp://localhost/~/ecommerce9");
		dataSource.setUsername("sa");
		dataSource.setPassword("12345");
		System.out.println("Data source Creation");
		return dataSource;
	}

	@Autowired
	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource) {
		System.out.println("Hibernate properties");
		Properties prop = new Properties();
		prop.setProperty("hibernate.hbm2ddl.auto", "update");
		prop.put("hibernate.show_sql", "true");// optional
		prop.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		System.out.println("Hibernate properties created");

		System.out.println("Local session factory object creation");
		LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(getH2Datasource());
		sessionBuilder.addProperties(prop);
		System.out.println("Factory builder object created");

		sessionBuilder.addAnnotatedClass(Category.class);
		sessionBuilder.addAnnotatedClass(Supplier.class);
		sessionBuilder.addAnnotatedClass(Product.class);
		sessionBuilder.addAnnotatedClass(UserRegister.class);
		sessionBuilder.addAnnotatedClass(Cart.class);
		System.out.println("Session factory object creation");
		SessionFactory sessionFactory = sessionBuilder.buildSessionFactory();
		System.out.println("Session factory object created");
		return sessionFactory;
	}

	@Autowired
	@Bean(name = "transactionManager")
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
		System.out.println("Transaction manager object creation");
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
		System.out.println("Transaction manager object created");
		return transactionManager;
	}

	@Autowired
	@Bean("name=CategoryDAO")
	public CategoryDAO getCategoryDAO(SessionFactory sessionFactory)

	{
		System.out.println("categoryDAO object creation");
		return new CategoryDAO(sessionFactory);

	}

	@Autowired
	@Bean("name=SupplierDAO")
	public SupplierDAO getSupplierDAO(SessionFactory sessionFactory) {
		System.out.println("supplierDAO object creation");
		return new SupplierDAO(sessionFactory);
	}

	@Autowired
	@Bean("name=ProductDAO")
	public ProductDAO getProductDAO(SessionFactory sessionFactory) {
		System.out.println("ProductDAO object creation");
		return new ProductDAO(sessionFactory);
	}

	@Autowired
	@Bean(name="UserDAO")
	public UserDAO getUserDAO(SessionFactory sessionFactory) {
		System.out.println("-- UserDAO Object Creation--");
		return new UserDAO(sessionFactory);
	}

	@Bean("name=CartDAO")
	public CartDAO getCartDAO(SessionFactory sessionFactory) {
		System.out.println("CartDAO object creation");
		return new CartDAO(sessionFactory);
	}

}
