package com.mishop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mishop.entity.Admin;
import com.mishop.utils.DBConnector;

/**
 * 懒汉式编写Dao层
 * @author LY
 *
 */
public class AdminDaoImpl {

	private static AdminDaoImpl adminDaoImpl = null;
	
	public int rowCount;
	public int pageCount;

	private AdminDaoImpl() {

	}

	public static AdminDaoImpl getInstance() {
		if (adminDaoImpl == null) {
			synchronized (AdminDaoImpl.class) {
				if (adminDaoImpl == null) {
					adminDaoImpl = new AdminDaoImpl();
				}
			}
		}
		return adminDaoImpl;
	}

	/**
	 *  获取管理员列表
	 * 
	 * @return
	 */
	public List<Admin> queryAdmins() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Admin> adminList = new ArrayList<Admin>();
		try {
			// 1、通过DBUtil2工具类创建连接Connection
			conn = DBConnector.getConnection();
			// 2、创建预处理对象PreparedStatement
			pstmt = conn.prepareStatement("select * from tb_admin");
			// 3、执行查询操作,获得结果集
			rs = pstmt.executeQuery();
			// 4、遍历结果集，将结果保存在集合当中
			while (rs.next()) {
				Admin admin = new Admin();
				admin.setAdminId(rs.getInt("admin_id"));
				admin.setAdminAccount(rs.getString("admin_account"));
				admin.setAdminPassword(rs.getString("admin_password"));
				admin.setRole(rs.getInt("role"));
				admin.setStatus(rs.getInt("status"));
				admin.setCreateTime(new java.util.Date(rs.getTimestamp("create_time").getTime()));
//				admin.setCreateTime(new java.util.Date(rs.getDate("create_time").getTime()));
				admin.setUpdateTime(new java.util.Date(rs.getTimestamp("update_time").getTime()));
//				admin.setUpdateTime(new java.util.Date(rs.getDate("update_time").getTime()));
				adminList.add(admin);
			}
			return adminList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 分页查询
	 * 关键变量
	 * 1、每一页的记录条数：pageSize  ——>  从view层获得
	 * 2、当前页数：pageNow	 ——>  从view层获得
	 * 3、总记录条数：rowCount  ——>  通过sql查询得到
	 * 4、总页数：pageCount  ——>  根据总记录条数计算得到
	 */
	public List<Admin> queryAdminsByPage(int pageNow,int pageSize){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Admin> list = new ArrayList<Admin>();
		try {
			conn = DBConnector.getConnection();
			pstmt = conn.prepareStatement("select count(admin_id) from tb_admin");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rowCount = rs.getInt(1);
				if(rowCount % pageSize == 0) {
					pageCount = rowCount / pageSize;
				} else {
					pageCount = rowCount / pageSize + 1;
				}
			}
			// 分页语句中"?,?",第一个"?"表示从第几条记录开始查询，第二个"?"表示查询多少条记录
			pstmt = conn.prepareStatement("select * from tb_admin limit ?,?");
			// 1、计算读取数据的范围
			int minRow = pageSize * (pageNow-1);
//			int maxRow = pageSize * pageNow;
//			System.out.println("minRow = " + minRow);
//			System.out.println("maxRow = " + maxRow);
			pstmt.setInt(1, minRow);
//			pstmt.setInt(2, maxRow);
			pstmt.setInt(2, pageSize);
			// 2、执行sql查询
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Admin admin = new Admin();
				admin.setAdminId(rs.getInt("admin_id"));
				admin.setAdminAccount(rs.getString("admin_account"));
				admin.setAdminPassword(rs.getString("admin_password"));
				admin.setRole(rs.getInt("role"));
				admin.setStatus(rs.getInt("status"));
				admin.setCreateTime(new java.util.Date(rs.getTimestamp("create_time").getTime()));
//				admin.setCreateTime(new java.util.Date(rs.getDate("create_time").getTime()));
				admin.setUpdateTime(new java.util.Date(rs.getTimestamp("update_time").getTime()));
//				admin.setUpdateTime(new java.util.Date(rs.getDate("update_time").getTime()));
				list.add(admin);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 根据用户名查询用户
	 * @param adminName
	 * @return
	 */
	public Admin queryAdminByName(String adminName) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Admin admin = new Admin();
		try {
			// 1、创建连接
			conn = DBConnector.getConnection();
			// 2、创建预处理对象
			pstmt = conn.prepareStatement("select * from tb_admin where admin_account = ?");
			pstmt.setString(1, adminName);
			// 3、执行sql语句
			rs = pstmt.executeQuery();
			// 4、从结果集中获取数据，并打包成对象返回给后台表示层
			if (rs.next()) {
				admin.setAdminId(rs.getInt("admin_id"));
				admin.setAdminAccount(rs.getString("admin_account"));
				admin.setAdminPassword(rs.getString("admin_password"));
				admin.setRole(rs.getInt("role"));
				admin.setStatus(rs.getInt("status"));
				admin.setCreateTime(new java.util.Date(rs.getTimestamp("create_time").getTime()));
//				admin.setCreateTime(new java.util.Date(rs.getDate("create_time").getTime()));
				admin.setUpdateTime(new java.util.Date(rs.getTimestamp("update_time").getTime()));
//				admin.setUpdateTime(new java.util.Date(rs.getDate("update_time").getTime()));
				return admin;
			} else {
				// 查询结果为空
				return null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
//		AdminDaoImpl adi = new AdminDaoImpl();
//		List<Admin> adminList = adi.queryAdmins();
//		for (Admin a : adminList) {
//			System.out.println(a.getAdminAccount());
//		}
//		Admin admin = adi.queryAdminByName("admin");
//		System.out.println(admin.getAdminAccount());
		
		// 指定pageSize（每一页显示多少行）
		AdminDaoImpl adi = AdminDaoImpl.getInstance();
		List<Admin> adminList = adi.queryAdminsByPage(1, 5);
		
		for(Admin a: adminList) {
			System.out.println(a.getAdminAccount());
		}
		
		/*
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("total", AdminDaoImpl.getInstance().rowCount);
		resultMap.put("rows",adminList);
		
		// 转换的配置信息(实现JsonValueProcessor中的方法)
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		// 将map按照指定的转换格式转换成json
		JSONObject jsonObject = JSONObject.fromObject(resultMap,jsonConfig);
		System.out.println(jsonObject.toString());
//		JSONArray jsArr = JSONArray.fromObject(resultMap,jsonConfig);
//		System.out.println(jsArr.toString());
		 
		*/
		
		
		
	}

}
