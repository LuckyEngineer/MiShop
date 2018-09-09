package com.mishop.service.impl;

import java.util.List;

import com.mishop.dao.impl.OrderAddrDaoImpl;
import com.mishop.dao.impl.OrderDaoImpl;
import com.mishop.dao.impl.ProductDaoImpl;
import com.mishop.entity.Order;
import com.mishop.entity.OrderAddr;
import com.mishop.entity.OrderDetail;
import com.mishop.entity.OrderItem;
import com.mishop.entity.Page;
import com.mishop.entity.Product;

public class OrderServiceImpl {
	private static OrderServiceImpl orderServiceImpl;
	
	private OrderServiceImpl() {
		
	}

	public static OrderServiceImpl getInstance() {
		if(orderServiceImpl == null) {
			synchronized (OrderServiceImpl.class) {
				if(orderServiceImpl == null) {
					orderServiceImpl = new OrderServiceImpl();
				}
			}
		}
		return orderServiceImpl;
	}
	
	/**
	 * @author LY
	 * 分页获取订单的相关数据
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public List<OrderAddr> queryOrderAddrByPage(int pageNow,int pageSize) {
		return OrderAddrDaoImpl.getInstance().queryOrderAddrList(pageNow, pageSize);
	}
	
	/**
	 * 增加订单
	 * @return
	 */
	public List<Product> addOrder(Order order) {
		ProductDaoImpl pd=ProductDaoImpl.getInstance();
		List<Product> list=pd.queryProducts();
		return list;
	}
	
	/**
	 * 增加子订单
	 * @param orderItems
	 */
	public void addOrderItems(List<OrderItem> orderItems) {
		for(OrderItem oi:orderItems) {
			OrderDaoImpl.getProductDaoImpl().addOrderItem(oi);
		}
	}
	
	/**
	 * 添加单个子订单
	 * @param oi
	 */
	public void addOrderItem(OrderItem oi) {
		OrderDaoImpl.getProductDaoImpl().addOrderItem(oi);
	}
	
	//分页查询订单
	public void getOrder(int userId,Page<Order> page){
		OrderDaoImpl.getProductDaoImpl().queryOrder(userId,page);
	}
	
	/**
	 * 查询子订单
	 * @param orderNumber
	 * @return 
	 */
	public List<OrderItem> getOrderItems(Long orderNumber) {
		return OrderDaoImpl.getProductDaoImpl().getOrderItems(orderNumber);
	}
	
	/**
	 * 查询订单信息(订单和地址)
	 * @return
	 */
	public OrderDetail queryOrderDetail(int orderId) {
		return OrderDaoImpl.getProductDaoImpl().queryOrderDetail(orderId);
	}

	
}
