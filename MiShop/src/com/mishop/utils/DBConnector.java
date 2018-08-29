package com.mishop.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import com.mchange.v2.c3p0.ComboPooledDataSource;
 
public class DBConnector {
 
	
	//数据库连接
	private static ComboPooledDataSource dataSource = null;
	
	//静态块加载
	static{
		try
		{
			dataSource = new ComboPooledDataSource("mysql");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	//获取数据库连接
	public static Connection getConnection(){
		Connection conn = null;
		try {
			conn = dataSource.getConnection();
			System.out.println("获取数据库连接："+conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	//关闭数据库连接
	public static void release(Connection conn,PreparedStatement pstmt,ResultSet rs)
	{
		try{
			if(conn != null)
			{
				conn.close();
				conn = null;
			}
			if(pstmt != null)
			{
				pstmt.close();
				pstmt = null;
			}
			if(rs != null)
			{
				rs.close();
				rs = null;
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		Connection conn = DBConnector.getConnection();
		
	}
 
}
