package com.mishop.entity;

import java.util.Date;

public class ProductCategory {
	private int categoryId;
	private String categoryName;
	private int productId;
	private String name;
	private String description;
	private String detail;
	private Double price;
	private Double discountPrice;
	private String config;
	private int stock;
	private int status;
	private String mainImage;
	private String subImage;
	private Date createTime;
	private Date updateTime;
	public ProductCategory() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductCategory(int categoryId, String categoryName, int productId, String name, String description,
			String detail, Double price, Double discountPrice, String config, int stock, int status, String mainImage,
			String subImage, Date createTime, Date updateTime) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.productId = productId;
		this.name = name;
		this.description = description;
		this.detail = detail;
		this.price = price;
		this.discountPrice = discountPrice;
		this.config = config;
		this.stock = stock;
		this.status = status;
		this.mainImage = mainImage;
		this.subImage = subImage;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(Double discountPrice) {
		this.discountPrice = discountPrice;
	}

	public String getConfig() {
		return config;
	}

	public void setConfig(String config) {
		this.config = config;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMainImage() {
		return mainImage;
	}

	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}

	public String getSubImage() {
		return subImage;
	}

	public void setSubImage(String subImage) {
		this.subImage = subImage;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
}
