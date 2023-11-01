package com.Style.model;

import jakarta.persistence.*;

@Entity
@Table(name="t_stylesutra_categories")
public class Categories {
	
	@Id
	@SequenceGenerator(name = "t_stylesutra_categories_seq", sequenceName = "t_stylesutra_categories_pkid_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "t_stylesutra_categories_seq")
	@Column(name ="category_id")
	private int category_id;
	
	@Column(name ="category_name")
	private String category_name;
	
	@Column(name ="category_description")
	private String category_description;
	
//	@OneToMany
//	@JoinColumn(name = "fk_product_id")
//	private Products product;
	
	
	public Categories() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Categories(int category_id, String category_name, String category_type, String category_description) {
		super();
		this.category_id = category_id;
		this.category_name = category_name;
		this.category_description = category_description;
	}



	public int getCategory_id() {
		return category_id;
	}



	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}



	public String getCategory_name() {
		return category_name;
	}



	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}


	public String getCategory_description() {
		return category_description;
	}



	public void setCategory_description(String category_description) {
		this.category_description = category_description;
	}



	@Override
	public String toString() {
		return "Categories [category_id=" + category_id + ", category_name=" + category_name +
			", category_description=" + category_description + "]";
	}
	
	
	
}
