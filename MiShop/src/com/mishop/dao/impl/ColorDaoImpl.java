package com.mishop.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import com.mishop.entity.Color;
import com.mishop.utils.DataSourceUtils;

public class ColorDaoImpl {
	
	private static ColorDaoImpl colorDaoImpl;
	
	private ColorDaoImpl() {
		
	}
	
	public static ColorDaoImpl getInstance() {
		if(colorDaoImpl == null) {
			synchronized (ColorDaoImpl.class) {
				if(colorDaoImpl == null) {
					colorDaoImpl = new ColorDaoImpl();
				}
			}
		}
		return colorDaoImpl;
	}

	/**
	 * 插入颜色
	 */
	public int insertColoe(int productId,String color) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		// 增加的sql语句
		String insertSql = "insert into tb_color(product_id,color) values(?,?)";
		Object[] params = {productId,color};
		int count = 0;
		try {
			count = runner.update(insertSql,params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
}
