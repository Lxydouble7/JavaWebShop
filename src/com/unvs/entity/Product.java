package com.unvs.entity;

import java.util.Date;
import java.util.List;

/**
 * 商品类
 */
public class Product {

	private Integer pid;
	private String pname;         //商品名称
	private Double price;  //参考价格
	private String image;
	private String image1;
	private String image2;
	private String type;
	private String intro;
	private int stock;
	private String description;
	private String merchant;

	public String getMerchant() { return merchant; }
	public void setMerchant(String merchant) { this.merchant = merchant; }

	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getType() {
		return type;
	}
	public void setType(int String) {
		this.type = type;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getDescription() {return description; }
	public void setDescription(String description) { this.description = description; }
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(Integer pid, String pname, Double price, String image, String image1, String image2, String type, String intro, int stock, String description, String merchant) {
		this.pid = pid;
		this.pname = pname;
		this.price = price;
		this.image = image;
		this.image1 = image1;
		this.image2 = image2;
		this.type = type;
		this.intro = intro;
		this.stock = stock;
		this.description = description;
		this.merchant = merchant;
	}
}
