package com.mishop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.mishop.entity.Admin;
import com.mishop.entity.Product;
import com.mishop.entity.User;
import com.mishop.utils.DBConnector;
import com.mishop.utils.DataSourceUtils;

public class UserDaoImpl {
	private static UserDaoImpl userDaoImpl;
	private static Connection conn = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	private UserDaoImpl() {
		
	}
	public static UserDaoImpl getUserDaoImpl() {
		if(userDaoImpl==null) {
			userDaoImpl = new UserDaoImpl();
		}
		return userDaoImpl;
	}
	//查询数据库里面的所有用户，返回一个用户的集合
	public List<User> queryUser() {
		//创建连接
		conn = DBConnector.getConnection();
		List<User> userList = new ArrayList<User>();//建立集合list
		//预处理
		try {
			pstmt = conn.prepareStatement("select user_id,user_name,user_password,email,tel,status from tb_user");
			rs = pstmt.executeQuery();//将结果放入结果集rs中
			while(rs.next()) {
				User user = new User();
				user.setUserId(rs.getInt("user_id"));//用户Id
				user.setUserName(rs.getString("user_name"));//用户名
				user.setUserPassword(rs.getString("user_password"));//用户密码
				user.setEmail(rs.getString("email"));//邮箱
				user.setTel(rs.getString("tel"));//电话
				user.setStatus(rs.getInt("status"));//用户的状态
				userList.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userList;
	}
	
	/**
	 * 根据用户名查询用户
	 * @param adminName
	 * @return
	 */
	public User queryUserByName(String username) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select user_id as userId,user_name as userName,realname as userRealName,sex,"
				+ "user_password as userPassword,email,tel,status,birthday,create_time as createTime,"
				+ "update_time as updateTime from tb_user where user_name = ?";
		Object[] params = {username};
		User user = null;
		try {
			user = runner.query(sql, new BeanHandler<User>(User.class),params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	
	/**
	 * 用户注册：
	 * 将传送进来的数据，放入数据库里面
	 * user_name
	 * user_password
	 * email
	 * tel  
	 * status  ：默认为0
	 * create_time ：创建的时间
	 * update_time ：更新的时间
	 */
	public void insertIntoUser(User user) {
		//创建连接
		conn = DBConnector.getConnection();
		try {
			pstmt=conn.prepareStatement("insert into tb_user(user_name,user_password,email,tel,status,create_time,update_time) values(?,?,?,?,?,?,?)");
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getTel());
			pstmt.setInt(5, user.getStatus());
			pstmt.setDate(6, new java.sql.Date(new Date().getTime()));
			pstmt.setDate(7, new java.sql.Date(new Date().getTime()));	
			pstmt.executeUpdate();//更新
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 得到密码，将原始密码获取出来，进行判断
	 */
	public User getUserPassword(String name) {
		conn = DBConnector.getConnection();
		User psw = new User();
		try {
			pstmt = conn.prepareStatement("select user_password from tb_user where user_name=?");
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				psw.setUserPassword(rs.getString("user_password"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return psw;
	}
	/**
	 * 修改密码，通过用户名字进行更新密码
	 */
	public void updatePassword(String password,String name) {
		//创建连接
		conn = DBConnector.getConnection();
		try {
			pstmt = conn.prepareStatement("update tb_user set user_password=? where user_name=?");
			pstmt.setString(1, password);
			pstmt.setString(2, name);
			pstmt.executeUpdate();//更新
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 修改个人信息，通过用户名进行修改
	 */
	public boolean updateInformation(User user) {
		int judge = 0;
		conn = DBConnector.getConnection();
		try {
			pstmt = conn.prepareStatement("update tb_user set realname=?,sex=?,birthday=? where user_id=?");
			pstmt.setString(1, user.getUserRealName());
			pstmt.setString(2, user.getSex());
			pstmt.setString(3, user.getBirthday());
			pstmt.setInt(4, user.getUserId());
			judge=pstmt.executeUpdate();//更新
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(judge==0) {
			return false;
		}else {
			return true;
		}
	}
	
	public static void main(String[] args) {
		User user=new User();
		user.setUserId(1);
		user.setUserRealName("zzzz");
		user.setSex("女");
		user.setBirthday("1996/02/25");
		boolean judge=UserDaoImpl.getUserDaoImpl().updateInformation(user);
	}
	
	/**
	 * 查询用户是否存在
	 * @param userName
	 * @param userPassword
	 * @return
	 */
	public User queryUser(String userName, String userPassword) {
		User user=null;
		conn = DBConnector.getConnection();
		User psw = new User();
		try {
			pstmt = conn.prepareStatement("select * from tb_user where user_name=? and user_password=?");
			pstmt.setString(1, userName);
			pstmt.setString(2, userPassword);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				user=new User();
				user.setUserId(rs.getInt("user_id"));
				user.setUserName(rs.getString("user_name"));
				user.setUserPassword(rs.getString("user_password"));
				user.setEmail(rs.getString("email"));
				user.setTel(rs.getString("tel"));
				user.setStatus(rs.getInt("status"));
				user.setUserRealName(rs.getString("realname"));
				user.setBirthday(rs.getString("birthday"));
				user.setSex(rs.getString("sex"));		
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
}