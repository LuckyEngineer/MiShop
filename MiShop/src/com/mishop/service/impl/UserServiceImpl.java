package com.mishop.service.impl;

import java.util.List;

import com.mishop.dao.impl.UserDaoImpl;
import com.mishop.entity.User;

public class UserServiceImpl{
	private static UserServiceImpl LoginService;
	
	private UserServiceImpl() {
		
	}
	public static UserServiceImpl getUserService() {
		if(LoginService==null) {
			LoginService = new UserServiceImpl();
		}
		return LoginService;
	}
	
	/**
	 * 根据用户名查询用户信息
	 * @param username
	 * @return
	 */
	public User queryUserByName(String username) {
		return UserDaoImpl.getUserDaoImpl().queryUserByName(username);
	}
	
	//从数据库中拿结果
	public List<User> getUser() {
		List<User>	userList= UserDaoImpl.getUserDaoImpl().queryUser();
		return userList;
	}
	
	//注册，调用方法，信息传送
	public void Register(User user) {
		UserDaoImpl.getUserDaoImpl().insertIntoUser(user);
	}
	
	//---------------------------------个人中心------------------------------------//
	//个人中心，修改密码，需要从数据库读取原来的密码，判断和用户输入的密码是否一致，如果不相同，就不能进行修改
	//通过用户名读取密码
	public User checkPassword(String userName) {
		User userPassword = UserDaoImpl.getUserDaoImpl().getUserPassword(userName);
		return userPassword;
	}
	
	//个人中心，修改密码，用户输入的新密码放进来，放进数据库里里面
	public void updatePassword(String userName,String userPassword) {
		UserDaoImpl.getUserDaoImpl().updatePassword(userPassword, userName);
	}
	
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	public boolean updateInformation(User user) {
		
		boolean judge=UserDaoImpl.getUserDaoImpl().updateInformation(user);
		return judge;
	}
	
//	//个人中心，将个人信息显示出来,通过用户姓名，查询出来
//	public User getInformation(String userName){
//		User user = UserDaoImpl.getUserDaoImpl().getUserInformation(userName);
//		return user;
//	}
	public User getUser(String userName, String userPassword) {
		User user = UserDaoImpl.getUserDaoImpl().queryUser(userName,userPassword);
		return user;
	}
}