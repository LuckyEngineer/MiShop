package com.mishop.service.impl;

import java.util.List;

import com.mishop.dao.impl.ProductCategoryDaoImpl;
import com.mishop.dao.impl.ProductDaoImpl;
import com.mishop.entity.Adver;
import com.mishop.entity.Product;
import com.mishop.entity.ProductCategory;

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
	 * @author LY
	 * 根据商品名称查询商品
	 * @param productName
	 * @return
	 */
	public Product queryProductByName(String productName) {
		return ProductDaoImpl.getInstance().queryProductByName(productName);
	}
	
	/**
	 * @author LY
	 * 添加商品
	 */
	public int insertProduct(Product product) {
		return ProductDaoImpl.getInstance().insertProduct(product);
	}
	
	/**
	 * @author LY
	 * 分页查询
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public List<ProductCategory> queryProductCategoryListByPage(int pageNow,int pageSize){
		return ProductCategoryDaoImpl.getInstance().queryProductCategoryList(pageNow, pageSize);
	}
	
	/**
	 * @author zxp
	 * 获取所有商品
	 * @return
	 */
	public List<Product> queryProduct() {
		ProductDaoImpl pd=ProductDaoImpl.getInstance();
		List<Product> list=pd.queryProducts();
		return list;
		
	}
	
	/**
	 * @author zxp
	 * 直接查询，大广播图
	 * @return
	 */
	public List<Adver> queryAdver(){
		List<Adver> list = ProductDaoImpl.getInstance().queryAdver();
		return list;
	}
	
	/**
	 * @author zxp
	 * 直接查询，小广播图
	 * @return
	 */
	public List<Adver> querySmallAdver(){
		List<Adver> list = ProductDaoImpl.getInstance().querySmallAdver();
		return list;
	}
	
	
}
