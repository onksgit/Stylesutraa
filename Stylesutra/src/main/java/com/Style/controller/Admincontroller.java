package com.Style.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.codec.multipart.Part;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Style.model.Categories;
import com.Style.model.Products;
import com.Style.model.User;
import com.Style.service.Adminservice;
import com.Style.utils.Message;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Admincontroller {

	@Autowired
	private Adminservice Adminservice;

	public void setAdminservice(Adminservice Adminservice) {
		this.Adminservice = Adminservice;
	}

	@RequestMapping("/dashbord")
	public String admin(HttpSession httpsession,RedirectAttributes rd) {
		User admin= (User) httpsession.getAttribute("userobj");
		System.out.println("Adminlogin="+admin);
		if(admin!=null)
		{
		return "admin/admin";
		}
		rd.addFlashAttribute("usermsg", Message.getMessage("user.pagecantaccess.msg"));
		return "redirect:login";
	}
	
	@RequestMapping("/adminLogout")
	public String adminLogout(HttpSession httpsession,RedirectAttributes rd) {
		User admin= (User) httpsession.getAttribute("userobj");
		System.out.println("AdminLogout="+admin);
		httpsession.removeAttribute("userobj");
		rd.addFlashAttribute("usermsg", Message.getMessage("user.logoutsuccess.msg"));
		return "redirect:login";
	}

	@RequestMapping("/adminViewCategories")
	public String adminViewCaregories(Model model, RedirectAttributes rd) {
		List<Categories> categories = Adminservice.getallCategories();
		if (categories != null)
			model.addAttribute("categories", categories);
		else
			rd.addFlashAttribute("categories", "No categories Found");
		return "admin/categories/adminViewCategories";
	}

	@RequestMapping("/adminSaveCategory")
	public String adminSaveCategory(@ModelAttribute Categories categories, RedirectAttributes rd) {
		try {
			if (categories.getCategory_name() == null
					|| categories.getCategory_name().toString().trim().equalsIgnoreCase("")
					|| categories.getCategory_description() == null
					|| categories.getCategory_description().toString().trim().equalsIgnoreCase("")) {
				rd.addFlashAttribute("Categorysavedmsg", "Something Went Wrong!Please Try Again.....");
				return "redirect:adminViewCategories";
			} else {
				System.out.println("a" + categories.toString().trim() + "b");
				Adminservice.saveCategory(categories);
				rd.addFlashAttribute("Categorysavedmsg", "Category Saved Successfully....");
				return "redirect:adminViewCategories";
			}
		} catch (Exception e) {
			rd.addFlashAttribute("Categorysavedmsg", "Category Saved Successfully....");
			return "redirect:adminViewCategories";
		}
	}

	@RequestMapping("/adminEditViewCategories")
	public String adminEditViewCategories(@RequestParam("category_id") int cid, RedirectAttributes rd, Model model) {
		try {
			Categories categories = Adminservice.getCategoryByid(cid);
			System.out.println("Categories   " + categories);
			if (categories != null) {
				model.addAttribute("categories", categories);
				return "admin/categories/adminEditViewCategories";
			} else
				rd.addFlashAttribute("categories", "No categories Found");
		} catch (Exception e) {
			rd.addFlashAttribute("categories", "No categories Found");
		}
		return "admin/categories/adminEditViewCategories";
	}

	@RequestMapping("/adminEditSaveCategory")
	public String adminEditSaveCategory(@ModelAttribute Categories categories, RedirectAttributes rd) {
		if (categories.getCategory_name() == null
				|| categories.getCategory_name().toString().trim().equalsIgnoreCase("")
				|| categories.getCategory_description() == null
				|| categories.getCategory_description().toString().trim().equalsIgnoreCase("")) {
			rd.addFlashAttribute("Categorysavedmsg", "Something Went Wrong!Please Try Again.....");
			return "redirect:adminViewCategories";
		} else {
			Adminservice.editSaveCategory(categories);
			rd.addFlashAttribute("Categorysavedmsg", "Category Updated Successfully....");
			return "redirect:adminViewCategories";
		}
	}

	@RequestMapping("/adminDeleteCategories")
	public String adminDeleteCategories(@RequestParam("category_id") int cid, RedirectAttributes rd) {
		try {
			Categories categories = Adminservice.getCategoryByid(cid);
			System.out.println("Categories" + categories);
			if (categories != null) {
				Adminservice.deleteCategory(categories);
				rd.addFlashAttribute("Categorysavedmsg", "Category Deleted Successfully");
				return "redirect:adminViewCategories";
			} else
				rd.addFlashAttribute("Categorysavedmsg", "No categories Found");
		} catch (Exception e) {
			rd.addFlashAttribute("Categorysavedmsg", "No categories Found");
		}
		return "redirect:adminViewCategories";
	}

	// Products
	@RequestMapping("/adminViewProducts")
	public ModelAndView adminViewProducts(Model model, RedirectAttributes rd) {
		List<Products> products = Adminservice.getallProducts();
		List<Categories> categories = Adminservice.getallCategories();
		if (categories != null)
			model.addAttribute("categories", categories);
		ModelAndView mav = new ModelAndView("admin/products/adminViewProducts");
		if (products != null)
			mav.addObject("products", products);
		else
			mav.addObject("products", "No Product Found");
		return mav;
	}

	@RequestMapping("/adminSaveProduct")
	public String adminSaveProduct(@ModelAttribute Products products,
			@RequestParam("category_id") String fk_category_id,
			@RequestPart("product_image") List<MultipartFile> product_images, RedirectAttributes rd,
			HttpServletRequest request) {
		String img_path = "";
		try {
			if (products.getProduct_name() == null || products.getProduct_name().toString().trim().equalsIgnoreCase("")
					|| products.getProduct_description() == null
					|| products.getProduct_description().toString().trim().equalsIgnoreCase("")) {
				rd.addFlashAttribute("Productsavedmsg", "Something Went Wrong!Please Try Again.....");
				return "redirect:adminViewProducts";
			} else {
				System.out.println("a" + products.toString().trim() + "b ");
				for (MultipartFile images : product_images) {
					if (!img_path.equalsIgnoreCase("")) {
						img_path = img_path + "," + images.getOriginalFilename();
					}
					if (img_path.equalsIgnoreCase("")) {
						img_path = images.getOriginalFilename();
					}
					products.setProduct_imagepath(img_path);
				}
				Adminservice.saveProduct(products, fk_category_id);

//Uploading Image

				List<MultipartFile> part = product_images;
				File product_img_folder = new File(Message.getMessage("image.url"));

				if (!product_img_folder.exists()) {
					product_img_folder.mkdir();
				}
				if (!product_images.isEmpty()) {
					for (MultipartFile img : part) {
						String product_img_path = product_img_folder + File.separator + img.getOriginalFilename();
						System.out.println("product_img_path" + product_img_path);
						img.transferTo(new File(product_img_path));
					}
				}

				rd.addFlashAttribute("Productsavedmsg", "Product Saved Successfully....");
				return "redirect:adminViewProducts";
			}
		} catch (Exception e) {
			e.printStackTrace();
			rd.addFlashAttribute("Productsavedmsg", "Something Went Wrong!Please Try Again.....");
			return "redirect:adminViewProducts";
		}
	}

	@RequestMapping("/adminEditViewProducts")
	public String adminEditViewproducts(@RequestParam("product_id") int pid, RedirectAttributes rd, Model model) {
		try {
			Products products = Adminservice.getProductByid(pid);
			System.out.println("products   " + products);
			if (products != null) {
				model.addAttribute("products", products);
				return "admin/products/adminEditViewProducts";
			} else
				rd.addFlashAttribute("products", "No products Found");
		} catch (Exception e) {
			rd.addFlashAttribute("products", "No products Found");
		}
		return "admin/products/adminEditViewProducts";
	}

	@RequestMapping("/adminDeleteProducts")
	public String adminDeleteProducts(@RequestParam("product_id") int pid, RedirectAttributes rd) {
		try {
			Products products = Adminservice.getProductByid(pid);
			System.out.println("Categories" + products);
			if (products != null) {
				Adminservice.deleteProduct(products);
				rd.addFlashAttribute("Productsavedmsg", "Product Deleted Successfully");
				return "redirect:adminViewProducts";
			} else
				rd.addFlashAttribute("Productsavedmsg", "No Product Found");
		} catch (Exception e) {
			rd.addFlashAttribute("Productsavedmsg", "No Product Found");
		}
		return "redirect:adminViewProducts";
	}

}
