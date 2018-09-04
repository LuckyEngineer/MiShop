package com.mishop.dao.impl;

import java.math.BigInteger;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.mishop.entity.Product;
import com.mishop.utils.DataSourceUtils;

public class ProductDaoImpl {
	private static ProductDaoImpl productDaoImpl;
	
	private ProductDaoImpl() {
		
	}
	
	public static ProductDaoImpl getInstance() {
		if(productDaoImpl == null) {
			synchronized (ProductDaoImpl.class) {
				if(productDaoImpl == null) {
					productDaoImpl = new ProductDaoImpl();
				}
			}
		}
		return productDaoImpl;
	}
	
	/**
	 * 添加商品，返回最新加入商品的id
	 * @param product
	 * @return
	 */
	public int insertProduct(Product product) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		// 增加sql语句
		String insertSql = "insert into tb_product(category_id,name,description,"
				+ "detail,price,discount_price,config,stock,status,main_image,"
				+ "sub_images,create_time,update_time)"
				+ " values(?,?,?,?,?,?,?,?,?,?,?,now(),now())";
		String sql="select @@identity";
		// SQL语句的置换参数
		Object[] params = {
				product.getCategoryId(),product.getName(),
				product.getDescription(),product.getDetail(),
				product.getPrice(),product.getDiscountPrice(),
				product.getConfig(),product.getStock(),
				product.getStatus(),product.getMainImage(),
				product.getSubImage()
		};
		BigInteger num = null;
		try {
			// 增删改的通用方法update()
			int count = runner.update(insertSql,params);
			num= (BigInteger) runner.query(sql,new ScalarHandler(1));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return (int)num.longValue();
	}

	/**
	 * 根据商品名称查询商品
	 * @param productName
	 * @return
	 */
	public Product queryProductByName(String productName) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from tb_product where name = ?";
		System.out.println(productName);
		Object[] params = {productName};
		Product product = null;
		try {
			product = runner.query(sql, new BeanHandler<Product>(Product.class),params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return product;
	}
	
	public static void main(String[] args) {
		Product p = new ProductDaoImpl().queryProductByName("小米8");
		System.out.println(p.getDescription());
	}
}
