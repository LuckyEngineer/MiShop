package com.mishop.service.impl;

import java.util.List;

import com.mishop.dao.impl.AdminDaoImpl;
import com.mishop.entity.Admin;


public class AdminServiceImpl {
	
	/**
	 * 根据用户名查询某一用户
	 */
	public Admin queryUserByName(String adminName) {
		return AdminDaoImpl.getInstance().queryAdminByName(adminName);
	}
	
	/**
	 * 分页获取数据
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public List<Admin> queryAdminByPage(int pageNow,int pageSize){
		return AdminDaoImpl.getInstance().queryAdminsByPage(pageNow, pageSize);
	}
	
	public List<Admin> queryAdmins(){
		return AdminDaoImpl.getInstance().queryAdmins();
	}
	
	
}
