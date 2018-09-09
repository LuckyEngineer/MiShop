package com.mishop.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mishop.dao.impl.OrderAddrDaoImpl;
import com.mishop.entity.Address;
import com.mishop.entity.Order;
import com.mishop.entity.OrderAddr;
import com.mishop.entity.OrderDetail;
import com.mishop.entity.OrderItem;
import com.mishop.service.impl.AddressService;
import com.mishop.service.impl.OrderServiceImpl;
import com.mishop.utils.OrderNumber;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * Servlet implementation class OrderCtrl
 */
@WebServlet("/OrderCtrl")
public class OrderCtrl extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if (method.equals("queryByPage")) {
			this.queryByPage(request, response);
		} else if (method.equals("analyze")) {
			this.analyze(request, response);
		} else if (method.equals("addOrder")) {
			this.addOrder(request, response);
		} else if (method.equals("getDetail")) {
			this.getDetail(request, response);
		} else if(method.equals("address")) {
			this.queryAddress(request, response);
		} else if(method == null) {
			this.createOrder(request, response);
		}
		
	}

	/**
	 * 解析JSON
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void analyze(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String data = request.getParameter("jsonArray");
		// 将得到json数据转换为一个json数组
		JSONArray jsonArray = JSONArray.fromObject(data);
		// 定义OrderItem集合用于存放购物车提交过来的数据
		List<OrderItem> items = new ArrayList<OrderItem>();
		items = (List<OrderItem>) JSONArray.toCollection(jsonArray, OrderItem.class);// 转换成列表

		HttpSession session = request.getSession();
		session.setAttribute("itemlist", items);
		PrintWriter out = response.getWriter();

		out.print("success");
	}

	/**
	 * 添加订单
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void addOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 获取前台传来的json数据
		int addrId = Integer.parseInt(request.getParameter("addr"));
		// 获取总价
		Double priceAll = Double.parseDouble(request.getParameter("priceAll"));
		// 获取session中的USER_ID
		HttpSession session = request.getSession();
		int userId =(int)session.getAttribute("USER_ID");
		// 生成订单编号
		long orderNumber = OrderNumber.getOrderNumber();
		// 定义Order，用于存放订单主表的基本信息
		Order order = new Order();
		order.setUserId(userId);
		order.setOrderNumber(orderNumber);
//		 order.setAddressId(addrId);
		order.setPayment(priceAll);
		// 将数据插入到订单主表当中
		OrderServiceImpl.getInstance().addOrder(order);
				
		String data = request.getParameter("jsonArray");
		// 将json数据转换为json数组
		JSONArray jsonArray = JSONArray.fromObject(data);
		// 定义OrderItem集合用于存放购物车提交过来的数据
		List<OrderItem> items = new ArrayList<OrderItem>();
		items = (List<OrderItem>) JSONArray.toCollection(jsonArray, OrderItem.class);//转换成列表
		for(OrderItem item : items) {
			item.setUserId(userId);
			item.setOrderNumber(orderNumber);
			OrderServiceImpl.getInstance().addOrderItem(item);
		}
		PrintWriter out = response.getWriter();
		out.print("success");
	}

	private void queryByPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 接收前端传来的数据
		int pageNow = Integer.parseInt(request.getParameter("page"));// 当前页面
		int pageSize = Integer.parseInt(request.getParameter("limit"));// 每一页显示的记录条数

		// 从数据库中类别表中的所有数据
		List<OrderAddr> orderAddrList = OrderServiceImpl.getInstance().queryOrderAddrByPage(pageNow, pageSize);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 状态码
		resultMap.put("code", 0);
		// 返回的信息
		resultMap.put("msg", "");
		// 总记录条数
		resultMap.put("count", OrderAddrDaoImpl.getInstance().rowCount);
		// 返回的数据(集合)
		resultMap.put("data", orderAddrList);

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
	 * 获取订单详情
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void getDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获取订单ID
		int id = Integer.parseInt(request.getParameter("orderId"));
		// 获取订单主表中的信息
		OrderDetail detail = OrderServiceImpl.getInstance().queryOrderDetail(id);
		// 获取订单子表中的信息
		List<OrderItem> items = OrderServiceImpl.getInstance().getOrderItems(detail.getOrderNo());
		for(OrderItem item: items) {
			System.out.println(item.getConfig());
		}
		request.setAttribute("detail", detail);
		request.setAttribute("items", items);
		
		request.getRequestDispatcher("admin-order-detail.jsp").forward(request, response);
	}
	
	/**
	 * @author zxp
	 * 创建订单
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void createOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		JSONArray orderJson=(JSONArray) request.getAttribute("order");
		String infoJson= (String)request.getAttribute("info");
		int payment=(Integer) request.getAttribute("money");
		
		//将json集合转换为list集合
		List<OrderItem> orderItems=(List<OrderItem>) orderJson.toCollection(orderJson, OrderItem.class);
		//将json字符串转换java对象
		JSONObject info=new JSONObject().fromObject(infoJson);
		//获取用户id
		int userId=(Integer) request.getSession().getAttribute("userId");
		//生成订单编号
		long orderNumber=OrderNumber.getOrderNumber();
		//获取总金额
		
		//创建订单对象
		Order order=new Order();
		order.setOrderNumber(orderNumber);
		order.setUserId(userId);
		
		for(OrderItem oi:orderItems) {
			oi.setUserId(userId);
		}
		//将list集合发送到service层
		OrderServiceImpl.getInstance().addOrderItems(orderItems);
		//将订单存入数据库
		OrderServiceImpl.getInstance().addOrder(order);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @author zxp
	 * 查询地址
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void queryAddress(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession();
		//获取用户ID
		int userId = (int)hs.getAttribute("USER_ID");
		// int userId = Integer.parseInt(hs.getAttribute("USER_ID"));
		//模拟用户ID
		List<Address> addresses=AddressService.getAddressService().queryAddresses(userId);
		
		// 转换的配置信息(实现JsonValueProcessor中的方法)
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		JSONArray jsonArray=JSONArray.fromObject(addresses,jsonConfig);
		PrintWriter out=response.getWriter();
		out.print(jsonArray);
	}

}
