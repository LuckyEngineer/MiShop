package com.mishop.entity;

import java.util.Date;

/**
 * 管理员实体类
 * 
 * @author LY
 *
 */
public class Admin {
	// 管理员Id
	private int adminId;
	// 管理员登录账号
	private String adminAccount;
	// 密码
	private String adminPassword;
	// 角色:1表示普通管理员，2表示超级管理员
	private int role;
	// 状态，0表示未审核，1表示正常
	private int status;
	// 创建时间
	private Date createTime;
	// 最近一次的编辑时间
	private Date updateTime;

	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Admin(int adminId, String adminAccount, String adminPassword, int role, int status, Date createTime,
			Date updateTime) {
		super();
		this.adminId = adminId;
		this.adminAccount = adminAccount;
		this.adminPassword = adminPassword;
		this.role = role;
		this.status = status;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	public String getAdminAccount() {
		return adminAccount;
	}

	public void setAdminAccount(String adminAccount) {
		this.adminAccount = adminAccount;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", adminAccount=" + adminAccount + ", adminPassword=" + adminPassword
				+ ", role=" + role + ", status=" + status + ", createTime=" + createTime + ", updateTime=" + updateTime
				+ "]";
	}
	
	

}
