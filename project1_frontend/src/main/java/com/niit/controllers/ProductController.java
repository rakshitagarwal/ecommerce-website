package com.niit.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	
	public ProductController() {
		System.out.println("ProductController instantiated");
	}

	// http://localhost:8080/project1_frontend/getprodutform
	@RequestMapping("/admin/product/getproductform")
	public String getProductForm(Model model)
	{
		List<Category> categories=productService.getAllCategories();
		model.addAttribute("categories",categories);
		model.addAttribute("product", new Product());
		System.out.println(categories);
		return "productform";
	}

	@RequestMapping("/admin/product/saveproduct")
	public String saveProduct(@Valid @ModelAttribute(name="product") Product product,BindingResult result,Model model)
	{
		if(result.hasErrors())
		{
			List<Category> categories=productService.getAllCategories();
			System.out.println(categories);
			model.addAttribute("categories",categories);
			return "productform";
		}
		productService.saveProduct(product);
		MultipartFile image=product.getImage();
		Path path=Paths.get("C:\\Users\\Rakshit\\workspace\\project1_frontend\\src\\main\\webapp\\WEB-INF\\resources\\images\\"+product.getId()+".jpg");
		try{
			image.transferTo(new File(path.toString()));
		}
		catch(IllegalStateException e)
		{
			e.printStackTrace();
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		return "redirect:/all/product/getallproducts";
	}

	@RequestMapping("/all/product/getallproducts")
	public String getAllProducts(Model model)
	{
		List<Product> products=productService.getAllProducts();
		model.addAttribute("products",products);
		return "productlist";
	}

	@RequestMapping("/all/product/viewproduct/{id}")
	public String getProductById(@PathVariable int id,Model model) 
	{
		Product product=productService.getProductById(id);
		model.addAttribute("product",product);
		return "viewproduct";
	}

	@RequestMapping("/admin/product/deleteproduct/{id}")
	public String deleteProductById(@PathVariable int id){
		
		productService.deleteProduct(id);
		Path path=Paths.get("C:\\Users\\Rakshit\\workspace\\project1_frontend\\src\\main\\webapp\\WEB-INF\\resources\\images\\"+id+".jpg");
		
		if(Files.exists(path)){
			try {
				Files.delete(path);
			} catch (IOException e){
				e.printStackTrace();
			}
		}
		return "redirect:/all/product/getallproducts";
	}

	@RequestMapping("/admin/product/geteditform/{id}")
	public String getEditForm(@PathVariable int id,Model model)
	{
		List<Category> categories=productService.getAllCategories();
		model.addAttribute("categories",categories);
		//select * from product where id = ?
		Product product=productService.getProductById(id);
		System.out.println(product);
		System.out.println(categories.size());
		//ProductObj -> product exists in table
		model.addAttribute("productObj", product);
		return "editform";
	}

	@RequestMapping("/admin/product/editproduct")
	public String editProduct(@ModelAttribute(name="productObj")Product product,BindingResult result,Model model)
	{
		if(result.hasErrors())
		{
			List<Category> categories=productService.getAllCategories();
			model.addAttribute("categories",categories);
			return "editform";
		}

		productService.updateProduct(product);
		MultipartFile image=product.getImage();
		Path path=Paths.get("C:/Users/Rakshit/workspace/project1_frontend/src/main/webapp/WEB-INF/resources/images/"+product.getId()+".jpg");

		try{
			image.transferTo(new File(path.toString()));
		}
		catch(IllegalStateException e)
		{
			e.printStackTrace();
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}

		return "redirect:/all/product/getallproducts";
	}
	@RequestMapping("/all/product/searchbycategory")
	public String selectByCatagory(@RequestParam String searchCondition,Model model)
	{
		model.addAttribute("products" , productService.getAllProducts());
		if(searchCondition.equals("All"))
			model.addAttribute("searchCondition","");
		else
			model.addAttribute("searchCondition",searchCondition);
		return "productlist";
	}

}
