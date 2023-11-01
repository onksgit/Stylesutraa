package com.Style.dao;

import java.util.List;

import com.Style.model.Categories;
import com.Style.model.Products;
import com.Style.model.User;

public interface Admindao {
	
	public List<Categories> getAllCategories();

	public Categories getCategoryByid(int cid);

	public String saveCategory(Categories categories);

	public void editSaveCategory(Categories categories);

	public void deleteCategory(Categories categories);

	public String saveProduct(Products products, String fk_category_id);

	public List<Products> getAllProducts();

	public Products getProductByid(int pid);

	public void deleteProduct(Products products);

}
