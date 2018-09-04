package com.mishop.service.impl;

import com.mishop.dao.impl.ProductDaoImpl;
import com.mishop.entity.Product;

public class ProductServiceImpl {
	
	private static ProductServiceImpl productServiceImpl;
	
	private ProductServiceImpl() {
		
	}
	
	public static ProductServiceImpl getInstance() {
		if(productServiceImpl == null) {
			synchronized (ProductServiceImpl.class) {
				if(productServiceImpl == null) {
					productServiceImpl = new ProductServiceImpl();
				}
			}
		}
		return productServiceImpl;
	}
	
	/**
	 * 根据商品名称查询商品
	 * @param productName
	 * @return
	 */
	public Product queryProductByName(String productName) {
		return ProductDaoImpl.getInstance().queryProductByName(productName);
	}
	
	/**
	 * 添加商品
	 */
	public int insertProduct(Product product) {
		return ProductDaoImpl.getInstance().insertProduct(product);
	}
}
