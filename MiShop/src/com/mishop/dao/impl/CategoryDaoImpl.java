package com.mishop.dao.impl;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.mishop.entity.Category;
import com.mishop.entity.Count;
import com.mishop.utils.DataSourceUtils;

public class CategoryDaoImpl {
	
	private static CategoryDaoImpl categoryDaoImpl;
	
	public int rowCount;
	public int pageCount;
	
	private CategoryDaoImpl() {
		
	}

	public static CategoryDaoImpl getInstance() {
		if(categoryDaoImpl == null) {
			synchronized (CategoryDaoImpl.class) {
				if(categoryDaoImpl == null) {
					categoryDaoImpl = new CategoryDaoImpl();
				}
			}
		}
		return categoryDaoImpl;
	}

	/**
	 * 分页查询商品类别
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public List<Category> queryCategoryByPage(int pageNow, int pageSize){
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		// sql1:查询总记录条数
		String sql1 = "select count(product_category_id) as num from tb_category";
		// sql2:分页查询
		String sql2 = "select product_category_id as categoryId,name from tb_category limit ?,?";
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
			List<Category> categoryList = runner.query(sql2, new BeanListHandler<Category>(Category.class), params);
			return categoryList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询所有的商品类别
	 * @return
	 */
	public List<Category> queryCategory(){
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from tb_category";
		
		Category category = null;
		
		List<Category> categoryList = null;
		
		try {
			categoryList = runner.query(sql, new BeanListHandler<Category>(Category.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return categoryList;
	}
	
	/**
	 * 添加类别
	 */
	public boolean insertCategory(Category cate) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into tb_category(name) values(?)";
		int count = 0;
		Object[] params = {cate.getName()};
		// 执行插入操作
		try {
			count = runner.update(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 返回布尔类型的数据
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	/**
	 * 查找表中是否存在商品的类别
	 * @return
	 */
	public Category queryCategoryByName(String categoryName) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from tb_category where name = ?";
		Object[] params = {categoryName};
		Category cate = null;
		try {
			cate = runner.query(sql, new BeanHandler<Category>(Category.class),params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cate;
	}
	
	
	
	
	/**
	 * 根据商品类别id删除商品（如果删除的类别中）
	 * @param id
	 * @return
	 */
	public boolean deleteCategory(int id) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "delete from tb_category where product_category_id = ?";
		Object[] params = {id};
		int count = 0;
		int count2 = 0;
		try {
			count = runner.update(sql,params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(count == 0) {
			return false;
		} else {
			// 如果改商品类别删除成功，还需要将含有的该类别的商品的类别id置位0，表示为其他类别
			String sql2 = "update tb_product set category_id = ? where category_id = ?";
			Object[] params2 = {id,id};
			try {
				count2 = runner.update(sql,params2);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		}
		
	}
}
