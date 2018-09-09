package com.mishop.service.impl;

import java.util.List;

import com.mishop.dao.impl.CategoryDaoImpl;
import com.mishop.entity.Category;

public class CategoryServiceImpl {
	// 使用单例模式
	private static CategoryServiceImpl categoryServiceImpl = null;
	
	// 私有化构造方法
	private CategoryServiceImpl() {
		
	}
	
	public static CategoryServiceImpl getInstance() {
		if(categoryServiceImpl == null) {
			synchronized (CategoryServiceImpl.class) {
				if(categoryServiceImpl == null) {
					categoryServiceImpl = new CategoryServiceImpl();
				}
			}
		}
		return categoryServiceImpl;
	}
	
	/**
	 * 分页查询
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public List<Category> queryCategoryByPage(int pageNow, int pageSize){
		return CategoryDaoImpl.getInstance().queryCategoryByPage(pageNow, pageSize);
	}
	
	/**
	 * 根据类别名称，查询该类别是否存在
	 * @param categoryName
	 * @return
	 */
	public Category queryCategoryByName(String categoryName) {
		return CategoryDaoImpl.getInstance().queryCategoryByName(categoryName);
	}
	
	/**
	 * 添加商品类别
	 * @param cate
	 * @return
	 */
	public boolean insertCategory(Category cate) {
		return CategoryDaoImpl.getInstance().insertCategory(cate);
	}
	
	/**
	 * 添加商品
	 * @param id
	 * @return
	 */
	public boolean deleteCategory(int id) {
		return CategoryDaoImpl.getInstance().deleteCategory(id);
	}
	
}
	
	
	
