package com.mishop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mishop.entity.Admin;
import com.mishop.utils.DBConnector;

public class AdminDaoImpl {
	public static void main(String[] args) {
		
//		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
//		String sql = "select * from tb_admin where admin_account = admin";
//		Admin admin = null;
//		try {
//			admin = runner.query(sql,new BeanHandler<Admin>(Admin.class));
//		} catch(SQLException e) {
//			e.printStackTrace();
//		}
//		admin.toString();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Admin admin = new Admin();
		try {
			// 1、创建连接
			conn = DBConnector.getConnection();
			// 2、创建预处理对象
			pstmt = conn.prepareStatement("select * from tb_admin");

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
				System.out.println(admin.toString());
			} else {
				// 查询结果为空
				System.out.println("结果为空");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		System.out.println("执行完毕");
	}
}
