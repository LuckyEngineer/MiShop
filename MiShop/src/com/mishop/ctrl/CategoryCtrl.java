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

import com.mishop.dao.impl.CategoryDaoImpl;
import com.mishop.entity.Category;
import com.mishop.service.impl.AdminServiceImpl;
import com.mishop.service.impl.CategoryServiceImpl;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * Servlet implementation class CategoryCtrl
 */
@WebServlet("/CategoryCtrl")
public class CategoryCtrl extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if("queryByPage".equals(method)){
			this.queryCategoryByPage(request, response);
		} else if("addCategory".equals(method)) {
			this.insertCategory(request,response);
		} else if("deleteCategory".equals(method)) {
			this.deleteCategory(request, response);
		}
	}
	
	/**
	 * 分页查询商品类别
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void queryCategoryByPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 接收前端传来的数据
		int pageNow = Integer.parseInt(request.getParameter("page"));// 当前页面
		int pageSize = Integer.parseInt(request.getParameter("limit"));// 每一页显示的记录条数
		
		// 从数据库中类别表中的所有数据
		List<Category> categoryList = CategoryServiceImpl.getInstance().queryCategoryByPage(pageNow, pageSize);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 状态码
		resultMap.put("code", 0);
		// 返回的信息
		resultMap.put("msg", "");
		// 总记录条数
		resultMap.put("count", CategoryDaoImpl.getInstance().rowCount);
		// 返回的数据(集合)
		resultMap.put("data", categoryList);
		
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
	 * 添加商品类别
	 * @throws IOException 
	 */
	public void insertCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		
		// 获取前台上传的商品类别
		String categoryName = request.getParameter("category");
		Category cate = CategoryServiceImpl.getInstance().queryCategoryByName(categoryName);
		
		if(cate == null) {
			Category c = new Category();
			c.setName(categoryName);
			// 如果返回为空，说明该商品类别已存在，可以添加
			boolean res = CategoryServiceImpl.getInstance().insertCategory(c);
			if(res) {
				out.print("success");
			} else {
				out.print("failed");
			}
		} else {
			// 该商品类别已存在
			out.print("exist");
		}
	}
	
	/**
	 * 删除类别
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	public void deleteCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		System.out.println("id为" + categoryId);
		boolean res = CategoryServiceImpl.getInstance().deleteCategory(categoryId);
		if(res) {
			out.print("success");
		} else {
			out.print("failed");
		}
	}
}
