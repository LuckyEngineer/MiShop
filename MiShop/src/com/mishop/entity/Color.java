package com.mishop.entity;

public class Color {
	private int colorId;
	private int productId;
	private String color;

	public Color() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Color(int colorId, int productId, String color) {
		super();
		this.colorId = colorId;
		this.productId = productId;
		this.color = color;
	}

	public int getColorId() {
		return colorId;
	}

	public void setColorId(int colorId) {
		this.colorId = colorId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

}
