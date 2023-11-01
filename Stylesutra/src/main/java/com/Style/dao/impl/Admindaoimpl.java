package com.Style.dao.impl;

import java.io.File;
import java.util.List;

import jakarta.*;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Style.dao.Admindao;
import com.Style.model.Categories;
import com.Style.model.Products;
import com.Style.utils.Message;




@Repository
public class Admindaoimpl implements Admindao {

	@Autowired
	private SessionFactory sessionFactory;

	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Categories> getAllCategories() {
		List<Categories> categories = null;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			categories = (List<Categories>) session.createQuery("from Categories").list();
			System.out.println(categories);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return categories;
	}

	@Override
	public Categories getCategoryByid(int cid) {
		Categories categories = null;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			categories = session.get(Categories.class, cid);
			System.out.println(categories);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return categories;

	}

	@Override
	public String saveCategory(Categories categories) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(categories);
			transaction.commit();
			System.out.println("saved");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return "adminViewCaregories";
	}

	@Override
	public void editSaveCategory(Categories categories) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query query =  session.createQuery(
					"update Categories set category_name=:n ,category_description=:d where category_id=:i");
			query.setParameter("n", categories.getCategory_name());
			query.setParameter("d", categories.getCategory_description());
			query.setParameter("i", categories.getCategory_id());
			int res = query.executeUpdate();
			transaction.commit();

			System.out.println(res);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	@Override
	public void deleteCategory(Categories categories) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query query = (Query) session.createQuery("delete from Categories where category_id=:i");
			query.setParameter("i", categories.getCategory_id());
			int res = query.executeUpdate();
			transaction.commit();
			System.out.println(res);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	@Override
	@Transactional
	public String saveProduct(Products products, String fk_category_id) {
		System.out.println(products);
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			int productid = (int) session.save(products);
			transaction.commit();
			
			Transaction transaction2=session.beginTransaction();
			Query query = session.createNativeQuery(
					"update t_stylesutra_products set fk_category_id=:cid  where product_id=:pid", Products.class);
			query.setParameter("cid", Integer.parseInt(fk_category_id));
			query.setParameter("pid", productid);
			int res = query.executeUpdate();
			transaction2.commit();
			System.out.println("saved =");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return "adminViewProducts";
	}

	@Override
	public List<Products> getAllProducts() {
		List<Products> products = null;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			products = (List<Products>) ((Query) session.createQuery("from Products")).getResultList();
			System.out.println(products);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return products;
	}

	@Override
	public Products getProductByid(int pid) {
		Products products = null;
		Session session = null;
		try {
			session = sessionFactory.openSession();
			products = session.get(Products.class, pid);
			System.out.println("PRODUCTS="+products);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return products;

	}

	@Override
	public void deleteProduct(Products products) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Query query = (Query) session.createQuery("delete from Products where product_id=:i");
			query.setParameter("i", products.getProduct_id());
			int res = query.executeUpdate();
			transaction.commit();
			
		String []image=products.getProduct_imagepath().split(",");
		
		for(String img:image)
		{
			
			File imageFile = new File(Message.getMessage("image.url") +"/"+ img);
		    if (imageFile.exists()) {
		        imageFile.delete();
		    }
		}
			
			System.out.println(res);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

}
