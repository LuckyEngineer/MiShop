package com.mishop.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.mishop.entity.Count;
import com.mishop.entity.ProductCategory;
import com.mishop.utils.DataSourceUtils;

public class ProductCategoryDaoImpl {
	
	private static ProductCategoryDaoImpl productCategoryDaoImpl;
	
	public int rowCount;
	public int pageCount;
	
	private ProductCategoryDaoImpl() {
		
	}
	
	public static ProductCategoryDaoImpl getInstance() {
		if(productCategoryDaoImpl == null) {
			synchronized (ProductCategoryDaoImpl.class) {
				if(productCategoryDaoImpl == null) {
					productCategoryDaoImpl = new ProductCategoryDaoImpl();
				}
			}
		}
		return productCategoryDaoImpl;
	}
	
	/**
	 * 连接查询商品表和商品类别表（分页）
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public List<ProductCategory> queryProductCategoryList(int pageNow, int pageSize) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		// sql1:查询总记录条数
		String sql1 = "select count(product_id) as num from category_product_view";
		// sql2:分页查询
		String sql2 = "select category_id as categoryId,category as categoryName,"
				+ "product_id as productId,name,description,detail,price,discount_price as discountPrice,"
				+ "main_image as mainImage,sub_images as subImage,status,stock,config,create_time as createTime,"
				+ "update_time as updateTime from category_product_view limit ?,?";
		Object[] obj = null;
		try {
			// 获取总的记录条数
			Count count = runner.query(sql1, new BeanHandler<Count>(Count.class));
			rowCount = count.getNum();
			// 获取总页数
			if (rowCount % pageSize == 0) {
				pageCount = rowCount / pageSize;
			} else {
				pageCount = rowCount / pageSize + 1;
			}
			int minRow = pageSize * (pageNow - 1);
			Object[] params = {minRow,pageSize};
			List<ProductCategory> productCategoryList = runner.query(sql2, new BeanListHandler<ProductCategory>(ProductCategory.class), params);
			return productCategoryList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
