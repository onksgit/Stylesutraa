package com.Style.model;

import jakarta.persistence.*;

@Entity
@Table(name = "t_stylesutra_products")
public class Products {

	@Id
	@SequenceGenerator(name = "t_stylesutra_products_seq", sequenceName = "t_stylesutra_products_pkid_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "t_stylesutra_products_seq")
	@Column(name = "product_id")
	private int product_id;

	@Column(name = "product_name")
	private String product_name;

	@Column(name = "product_type")
	private String product_type;

	@Column(name = "product_info")
	private String product_info;

	@Column(name = "product_description")
	private String product_description;

	@Column(name = "product_imagepath")
	private String product_imagepath;

	@Column(name = "product_price")
	private double product_price;

	@Column(name = "product_discount_in_percentage")
	private double product_discount_in_percentage;

	@Column(name = "product_quantity")
	private double product_quantity;

	@ManyToOne
	@JoinColumn(name = "fk_category_id")
	private Categories fk_category_id;

	public Products() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public Products(int product_id, String product_name, String product_type, String product_info,
			String product_description, String product_imagepath, double product_price,
			double product_discount_in_percentage, double product_quantity, Categories fk_category_id) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_type = product_type;
		this.product_info = product_info;
		this.product_description = product_description;
		this.product_imagepath = product_imagepath;
		this.product_price = product_price;
		this.product_discount_in_percentage = product_discount_in_percentage;
		this.product_quantity = product_quantity;
		this.fk_category_id = fk_category_id;
	}


	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_type() {
		return product_type;
	}

	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}

	public String getProduct_info() {
		return product_info;
	}

	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}

	public String getProduct_description() {
		return product_description;
	}

	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}

	public String getProduct_imagepath() {
		return product_imagepath;
	}

	public void setProduct_imagepath(String product_imagepath) {
		this.product_imagepath = product_imagepath;
	}

	public double getProduct_price() {
		return product_price;
	}

	public void setProduct_price(double product_price) {
		this.product_price = product_price;
	}

	public double getProduct_discount_in_percentage() {
		return product_discount_in_percentage;
	}

	public void setProduct_discount_in_percentage(double product_discount_in_percentage) {
		this.product_discount_in_percentage = product_discount_in_percentage;
	}

	public double getProduct_quantity() {
		return product_quantity;
	}

	public void setProduct_quantity(double product_quantity) {
		this.product_quantity = product_quantity;
	}



	public Categories getFk_category_id() {
		return fk_category_id;
	}


	public void setFk_category_id(Categories fk_category_id) {
		this.fk_category_id = fk_category_id;
	}


	@Override
	public String toString() {
		return "Products [product_id=" + product_id + ", product_name=" + product_name + ", product_type="
				+ product_type + ", product_info=" + product_info + ", product_description=" + product_description
				+ ", product_imagepath=" + product_imagepath + ", product_price=" + product_price
				+ ", product_discount_in_percentage=" + product_discount_in_percentage + ", categories=" + fk_category_id
				+ "]";
	}
	
	
	
	
	
	public int getproductPriceInInteger()
	{
		return (int)this.getProduct_price();
	}
	
	
	
	public int getDiscountedPrice()
	{
		int dis= (int) ((this.getProduct_discount_in_percentage()/100.0)*this.getProduct_price());
		return (int) (this.getProduct_price()-dis);
		
	}
	
	
	
	
	
	

}
