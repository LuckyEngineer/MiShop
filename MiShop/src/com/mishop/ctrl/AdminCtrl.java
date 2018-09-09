package com.mishop.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mishop.dao.impl.AdminDaoImpl;
import com.mishop.entity.Admin;
import com.mishop.service.impl.AdminServiceImpl;
import com.mishop.utils.MD5Util;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * Servlet implementation class UserCtrl
 */
@WebServlet("/AdminCtrl")
public class AdminCtrl extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if(method.equals("queryByPage")) {
			// 分页查询
			this.queryByPage(request, response);
		} else if(method.equals("deleteAdmin")) {
			// 删除管理员
			this.deleteAdmin(request, response);
		} else if(method.equals("insertAdmin")) {
			// 添加管理员
			this.insertAdmin(request, response);
		} else if(method.equals("exit")) {
			this.exitSystem(request, response);
		}
	}
	
	/**
	 * 添加管理员
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void insertAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		// 获取用户名，密码和角色
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		// 将password加密
		password = MD5Util.crypt(password);
		int role = Integer.parseInt(request.getParameter("role"));
		// 打包到Admin当中
		Admin admin = new Admin();
		admin.setAdminAccount(username);
		admin.setAdminPassword(password);
		admin.setRole(role);
		admin.setStatus(1);
		int res = AdminServiceImpl.getInstance().insertAdmin(admin);
		if(res != 0) {
			out.print("success");
		} else {
			out.print("failed");
		}
	}
	/**
	 * 删除用户
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void deleteAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		int adminId = Integer.parseInt(request.getParameter("adminId"));
		boolean res = AdminServiceImpl.getInstance().deleteAdminById(adminId);
		if(res) {
			out.print("success");
		} else {
			out.print("failed");
		}
	}

	private void queryByPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 接收前台传来的关键字
		String key = request.getParameter("key");
		if (key == null) {
			key = "";
		}
		// 接收前端传来的数据
		int pageNow = Integer.parseInt(request.getParameter("page"));// 当前页面
		int pageSize = Integer.parseInt(request.getParameter("limit"));// 每一页显示的记录条数

		// 从数据库中读取所有管理员
		List<Admin> adminList = AdminServiceImpl.getInstance().queryAdminByPage(pageNow, pageSize, key);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 状态码
		resultMap.put("code", 0);
		// 返回的信息
		resultMap.put("msg", "");
		// 总记录条数
		resultMap.put("count", AdminDaoImpl.getInstance().rowCount);
		// 返回的数据(集合)
		resultMap.put("data", adminList);

		// 转换的配置信息(实现JsonValueProcessor中的方法)
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());

		// 将map按照指定的转换格式转换成json
		JSONObject jsArr = JSONObject.fromObject(resultMap, jsonConfig);

		// 将集合按照指定的转换格式转换成json
		PrintWriter out = response.getWriter();
		out.print(jsArr.toString());
	}
	
	/**
	 * 退出系统
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void exitSystem(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 清除session
		request.getSession().removeAttribute("admin");
		request.getSession().removeAttribute("adminId");
		request.getSession().removeAttribute("role");
		response.sendRedirect("admin-login.jsp");
	}
}
