package com.mishop.service.impl;

import java.util.List;

import com.mishop.dao.impl.AdminDaoImpl;
import com.mishop.entity.Admin;


public class AdminServiceImpl {
	
	private static AdminServiceImpl adminServiceImpl;
	
	private AdminServiceImpl() {
		
	}
	
	public static AdminServiceImpl getInstance() {
		if(adminServiceImpl == null) {
			synchronized(AdminServiceImpl.class) {
				if(adminServiceImpl == null) {
					adminServiceImpl = new AdminServiceImpl();
				}
			}
		}
		return adminServiceImpl;
	}
	
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
	public List<Admin> queryAdminByPage(int pageNow,int pageSize,String key){
		return AdminDaoImpl.getInstance().queryAdminsByPage(pageNow, pageSize,key);
	}
	
	/**
	 * 查询所有的管理员
	 * @return
	 */
	public List<Admin> queryAdmins(){
		return AdminDaoImpl.getInstance().queryAdmins();
	}
	
	/**
	 * 根据id删除管理员的信息
	 * @param adminId
	 * @return
	 */
	public boolean deleteAdminById(int adminId) {
		return AdminDaoImpl.getInstance().deleteById(adminId);
	}
	
	/**
	 * 添加管理员
	 * @param admin
	 * @return
	 */
	public int insertAdmin(Admin admin) {
		return AdminDaoImpl.getInstance().insertAdmin(admin);
	}
	
	
	
}
