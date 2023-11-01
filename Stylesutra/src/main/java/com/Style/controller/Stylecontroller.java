package com.Style.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Style.model.Categories;
import com.Style.model.Products;
import com.Style.service.Adminservice;


@Controller
public class Stylecontroller {
	
	@Autowired
	private Adminservice Adminservice;
	
	public void setAdminservice(Adminservice adminservice) {
		Adminservice = adminservice;
	}

	@RequestMapping("/")
	public ModelAndView index(Model model)
	{
		List<Products> products = Adminservice.getallProducts();
		List<Categories> categories = Adminservice.getallCategories();
		if (categories != null)
			model.addAttribute("categories", categories);
		ModelAndView mav = new ModelAndView("index");
		if (products != null)
			mav.addObject("products", products);
		
		return mav;
		
	
	}

	@RequestMapping("/tshirts")
	public String tshirts()
	{
		return "tshirts";
	}
	

	
	
}
