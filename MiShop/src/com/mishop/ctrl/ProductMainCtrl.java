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

import com.mishop.dao.impl.ProductCategoryDaoImpl;
import com.mishop.entity.Product;
import com.mishop.entity.ProductCategory;
import com.mishop.service.impl.ProductServiceImpl;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * Servlet implementation class ProductCheckCtrl
 */
@WebServlet("/ProductMainCtrl")
public class ProductMainCtrl extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if (method.equals("checkName")) {
			this.checkName(request, response);
		} else if (method.equals("queryByPage")) {
			this.queryByPage(request, response);
		}
	}

	/**
	 * 主要用于验证商品名称是否已存在
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void checkName(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String productName = request.getParameter("productName");
		Product pro = ProductServiceImpl.getInstance().queryProductByName(productName);
		PrintWriter out = response.getWriter();
		if (pro == null) {
			// 该商品名称尚不存在
			out.print("invalid product");
		} else {
			// 该商品名称已存在
			out.print("exist product");
		}
	}

	/**
	 * 分页查询
	 * @throws IOException 
	 */
	public void queryByPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 接收前端传来的数据
		int pageNow = Integer.parseInt(request.getParameter("page"));// 当前页面
		int pageSize = Integer.parseInt(request.getParameter("limit"));// 每一页显示的记录条数

		List<ProductCategory> list = ProductServiceImpl.getInstance().queryProductCategoryListByPage(pageNow, pageSize);

		Map<String, Object> resultMap = new HashMap<String, Object>();

		// 状态码
		resultMap.put("code", 0);
		// 返回的信息
		resultMap.put("msg", "");
		// 总记录条数
		resultMap.put("count", ProductCategoryDaoImpl.getInstance().rowCount);
		// 返回的数据(集合)
		resultMap.put("data", list);

		// 转换的配置信息(实现JsonValueProcessor中的方法)
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());

		// 将map按照指定的转换格式转换成json
		JSONObject jsArr = JSONObject.fromObject(resultMap, jsonConfig);

		// 将集合按照指定的转换格式转换成json
		PrintWriter out = response.getWriter();
		out.print(jsArr.toString());
	}

}
