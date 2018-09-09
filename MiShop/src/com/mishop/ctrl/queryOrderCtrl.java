package com.mishop.ctrl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mishop.entity.Order;
import com.mishop.entity.OrderItem;
import com.mishop.entity.Page;
import com.mishop.service.impl.OrderServiceImpl;

/**
 * Servlet implementation class queryOrderCtrl
 */
@WebServlet("/queryOrderCtrl")
public class queryOrderCtrl extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if(method == null) {
			this.queryOrder(request, response);
		} else if(method.equals("order")) {
			this.queryOrderItem(request, response);
		}
	}

	protected void queryOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession();
		//获取登录的用户Id
//		int userId=(Integer) hs.getAttribute("userId");
		//1获取当前页参数
		String currPage=request.getParameter("currentPage");
		//由于第一次访问时当前页为null,所以需要将其默认为第一页
		if(currPage==null||("".equals(currPage.trim()))){
			currPage="1";
		}
		//将字符串转换为int类型
		int currentPage=Integer.parseInt(currPage);
		
		//2.设置Page对象，传入当前页参数
		Page<Order> page=new Page<Order>();
		page.setPageCount(2);
		page.setCurrentPage(currentPage);
		hs.setAttribute("page", page);
		
		//3.调用service层方法
		int userId=1;
		OrderServiceImpl.getInstance().getOrder(userId,page);
		
		//获取page中的order集合的订单编号
		//存储订单
		List<Order> orders=page.getPageData();
		//存储订单编号
		Set<Long> num=new HashSet<Long>();
		//存储子订单
		List<OrderItem> orderItems=new ArrayList<OrderItem>();
		for(Order order:orders) {
			num.add(order.getOrderNumber());
		}
		//将查询出来子订单放入集合中
		for(Long orderNumber:num) {
			List<OrderItem> list=OrderServiceImpl.getInstance().getOrderItems(orderNumber);
			for(OrderItem oi:list) {
				orderItems.add(oi);
			}
		}
		//4.保存到request中
		hs.setAttribute("page", page);
		hs.setAttribute("orderItems", orderItems);
		request.getRequestDispatcher("/order-list.jsp").forward(request, response);
	}

	protected void queryOrderItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int orderId=Integer.parseInt(request.getParameter("orderId"));
		request.setAttribute("orderId", orderId);
		request.getRequestDispatcher("order-detail.jsp").forward(request, response);
	}

	
}
