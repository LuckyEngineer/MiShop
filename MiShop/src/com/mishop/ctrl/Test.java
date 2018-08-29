package com.mishop.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mishop.entity.Admin;
import com.mishop.utils.DBConnector;

/**
 * Servlet implementation class Test
 */
@WebServlet("/Test")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Admin admin = new Admin();
		PrintWriter out = response.getWriter();
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
				out.print(admin.toString());
//				System.out.println(admin.toString());
			} else {
				// 查询结果为空
				out.print(admin.toString());
//				System.out.println("结果为空");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		out.print("运行完毕");
		
	}

}
