package com.mishop.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mishop.entity.Adver;
import com.mishop.entity.Product;
import com.mishop.service.ProductService;
import com.mishop.service.impl.ProductServiceImpl;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class queryCtrl
 */
@WebServlet("/queryCtrl")
public class queryCtrl extends HttpServlet {
  
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if(method == null) {
			this.queryAll(request, response);
		} else if(method.equals("queryProduct")) {
			this.queryProduct(request, response);
		}
	}
	
	/**
	 * 首页
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void queryAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取从service层中查询出的集合
		ProductServiceImpl ps=ProductServiceImpl.getInstance();
		List<Product> productList = ps.queryProduct();
		
		request.setAttribute("product_list",productList);
		

		//最上面的广告
		//获取从service层中查询出来的集合
		List<Adver> li= ProductServiceImpl.getInstance().queryAdver();
		request.setAttribute("adver_list", li);//请求，将得到的信息设置为adver_list
		
		//最下面的广告
		//获取从service层中查询出来的集合
		List<Adver> li2= ProductServiceImpl.getInstance().querySmallAdver();
		request.setAttribute("adver_list2", li2);//设置一个特殊字段，给特殊字段添加内容
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}
	
	/**
	 * 头部查询商品
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void queryProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//获取从service层中查询出的集合
		ProductServiceImpl ps=ProductServiceImpl.getInstance();
		List<Product> productList=ps.queryProduct();
		
		JSONArray jsonArray=JSONArray.fromObject(productList);
		PrintWriter out=response.getWriter();
		out.print(jsonArray);
	}

}
