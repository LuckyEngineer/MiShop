package com.mishop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.mishop.entity.Admin;
import com.mishop.entity.Count;
import com.mishop.utils.DBConnector;
import com.mishop.utils.DataSourceUtils;

/**
 * 懒汉式编写Dao层
 * 
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
	 * 获取管理员列表
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
				// admin.setCreateTime(new java.util.Date(rs.getDate("create_time").getTime()));
				admin.setUpdateTime(new java.util.Date(rs.getTimestamp("update_time").getTime()));
				// admin.setUpdateTime(new java.util.Date(rs.getDate("update_time").getTime()));
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
	 * 分页查询 关键变量 
	 * 1、每一页的记录条数：pageSize ——> 从view层获得 
	 * 2、当前页数：pageNow ——> 从view层获得 
	 * 3、总记录条数：rowCount ——> 通过sql查询得到 
	 * 4、总页数：pageCount ——> 根据总记录条数计算得到 
	 */
	public List<Admin> queryAdminsByPage(int pageNow, int pageSize, String key) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		// sql1:查询总的记录条数
		String sql1 = "select count(admin_id) as num from tb_admin where admin_account like '%"+key+"%'";
		// sql2:分页查询
		String sql2 = "select admin_id as adminId,admin_account as adminAccount,admin_password as adminPassword,role,status,create_time as createTime,update_time as updateTime from tb_admin where admin_account like '%"+key+"%' limit ?,?";
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
			Object[] params = { minRow, pageSize };
			List<Admin> adminList = runner.query(sql2, new BeanListHandler<Admin>(Admin.class), params);
			return adminList;
		} catch (SQLException e) {
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
				// admin.setCreateTime(new java.util.Date(rs.getDate("create_time").getTime()));
				admin.setUpdateTime(new java.util.Date(rs.getTimestamp("update_time").getTime()));
				// admin.setUpdateTime(new java.util.Date(rs.getDate("update_time").getTime()));
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
	
	/**
	 * 根据用户的ID，删除管理员
	 * @param adminId
	 * @return
	 */
	public boolean deleteById(int adminId) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "delete from tb_admin where admin_id = ?";
		int count = 0;
		Object[] params = {adminId};
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
	 * 添加管理员
	 * @param admin
	 * @return
	 */
	public int insertAdmin(Admin admin) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into tb_admin(admin_account,admin_password,role,status,create_time,update_time) "
				+ " values(?,?,?,?,now(),now())";
		int count = 0;
		Object[] params = {
			admin.getAdminAccount(),
			admin.getAdminPassword(),
			admin.getRole(),
			admin.getStatus()
		};
		// 执行插入操作
		try {
			count = runner.update(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	public static void main(String[] args) {
		
	}

}
