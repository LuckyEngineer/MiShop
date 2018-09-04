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

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * Servlet implementation class UserCtrl
 */
@WebServlet("/AdminCtrl")
public class AdminCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		// 接收前端传来的数据
		int pageNow = Integer.parseInt(request.getParameter("page"));// 当前页面
		int pageSize = Integer.parseInt(request.getParameter("limit"));// 每一页显示的记录条数

		// 从数据库中读取所有管理员
		List<Admin> adminList = new AdminServiceImpl().queryAdminByPage(pageNow,pageSize);
		
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
		JSONObject jsArr = JSONObject.fromObject(resultMap,jsonConfig);
		
		// 将集合按照指定的转换格式转换成json
	 	PrintWriter out = response.getWriter();
	 	out.print(jsArr.toString());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
