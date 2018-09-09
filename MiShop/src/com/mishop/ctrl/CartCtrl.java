package com.mishop.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mishop.entity.Cart;
import com.mishop.entity.User;
import com.mishop.service.impl.CartServiceImpl;


/**
 * Servlet implementation class CartCtrl
 */
@WebServlet("/CartCtrl")
public class CartCtrl extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if(method == null) {
			this.queryCart(request, response);
		} else if(method.equals("delete")) {
			this.deleteCart(request, response);
		}else if(method.equals("add")) {
			this.addProduct(request, response);
		}else if(method.equals("sub")) {
			this.subCart(request, response);
		}else if(method.equals("addCart")) {
			this.addCart(request, response);
		}else if(method.equals("success")) {
			this.jumpSuccess(request, response);
		}
		
	}
	/**
	 * 查询购物车
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void queryCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//使用request对象的getSession()获取session，如果session不存在则创建一个
		HttpSession session = request.getSession(true);
		//得到标志user，里面存放user登录用户的信息
		User user = (User) session.getAttribute("USER");
//		int userId=user.getUserId();
		int userId=2;
		List<Cart> cart_list = CartServiceImpl.getCartService().queryCart(userId);//登录购物车，自动将信息读取出来
		if(cart_list==null) {
			//如果集合为空，就是购物车为空,跳转到
			System.out.println("购物车为空！！");
			//跳转
		}else {
			request.setAttribute("cart_list", cart_list);//将得到的数据，放入标志里面
			request.getRequestDispatcher("cart.jsp").forward(request, response);//内容跳转
		}
	}
	
	/**
	 * 删除购物车
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void deleteCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cartId = Integer.parseInt(request.getParameter("cId").trim());
		CartServiceImpl.getCartService().deleteCart(cartId);
		request.getRequestDispatcher("/CartCtrl").forward(request, response);
		
	}
	
	/**
	 * 增加商品数量
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//将需要的信息拿出来
		int cartId = Integer.parseInt(request.getParameter("addcId").trim());//购物车id
		int quantity = Integer.parseInt(request.getParameter("quanty").trim());//商品数量
		quantity = quantity+1;
		CartServiceImpl.getCartService().updateCart(quantity, cartId);
		request.getRequestDispatcher("/CartCtrl").forward(request, response);
		
	}
	/**
	 * 减少购物车
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void subCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//将需要的信息拿出来
		int cartid = Integer.parseInt(request.getParameter("deletecId").trim());//购物车id
		int quantity = Integer.parseInt(request.getParameter("quanty").trim());//商品数量
		if(quantity==1) {
			request.getRequestDispatcher("/CartCtrl").forward(request, response);
		}else {
			quantity = quantity-1;
			CartServiceImpl.getCartService().updateCart(quantity, cartid);
			request.getRequestDispatcher("/CartCtrl").forward(request, response);
		}
		
	}
	
	/**
	 * 新增购物车
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void addCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//将需要的信息拿出来
		HttpSession hs=request.getSession();
		int userId = (Integer) hs.getAttribute("USRER_ID");
		int productId = Integer.parseInt(request.getParameter("productId").trim());//购物车id
		int defalutQuantity = Integer.parseInt(request.getParameter("defalutQuantity").trim());//商品数量
		String color = request.getParameter("color").trim();//商品数量
		Cart cart=new Cart();
		cart.setUserId(userId);
		cart.setProductId(productId);
		cart.setQuantity(defalutQuantity);
		cart.setColor(color);
		boolean judge=CartServiceImpl.getCartService().addCart(cart);
		//将结果发送回页面
		PrintWriter out=response.getWriter();
		out.print(judge);
	}
	
	/**
	 * 返回上一级
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void jumpSuccess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	String productId = request.getParameter("productId").trim();
	request.setAttribute("productId", productId);
	request.getRequestDispatcher("add-cart-success.jsp").forward(request, response);
		
	}
}