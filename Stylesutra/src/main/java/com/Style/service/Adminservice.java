package com.Style.service;

import java.util.List;

import com.Style.model.Categories;
import com.Style.model.Products;

public interface Adminservice {
	
	public List<Categories>  getallCategories();

	public Categories getCategoryByid(int cid);

	public String saveCategory(Categories categories);

	public void editSaveCategory(Categories categories);

	public void deleteCategory(Categories categories);

	public String saveProduct(Products products, String fk_category_id);

	public List<Products> getallProducts();

	public Products getProductByid(int pid);

	public void deleteProduct(Products products);
}
