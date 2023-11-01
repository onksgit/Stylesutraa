package com.Style.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Style.dao.Admindao;
import com.Style.model.Categories;
import com.Style.model.Products;
import com.Style.service.Adminservice;

@Service
public class Adminserviceimpl implements Adminservice {

	@Autowired
	private Admindao Admindao;

	public void setAdmindao(Admindao admindao) {
		Admindao = admindao;
	}

	public List<Categories> getallCategories() {
		return Admindao.getAllCategories();
	}

	@Override
	public Categories getCategoryByid(int cid) {

		return Admindao.getCategoryByid(cid);
	}

	@Override
	public String saveCategory(Categories categories) {
		return Admindao.saveCategory(categories);
	}

	@Override
	public void editSaveCategory(Categories categories) {
		Admindao.editSaveCategory(categories);
	}

	@Override
	public void deleteCategory(Categories categories) {
		Admindao.deleteCategory(categories);	
	}

	@Override
	public String saveProduct(Products products,String fk_category_id) {
		return Admindao.saveProduct(products,fk_category_id);
	}

	@Override
	public List<Products> getallProducts() {
		return Admindao.getAllProducts();
	}

	@Override
	public Products getProductByid(int pid) {
	return Admindao.getProductByid(pid);
	}

	@Override
	public void deleteProduct(Products products) {
		Admindao.deleteProduct(products);		
	}

}
