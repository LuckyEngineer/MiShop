package com.mishop.service.impl;

import java.util.List;

import com.mishop.dao.impl.AddressDaoImpl;
import com.mishop.dao.impl.OrderDaoImpl;
import com.mishop.dao.impl.ProductDaoImpl;
import com.mishop.entity.Address;
import com.mishop.entity.Order;
import com.mishop.entity.OrderItem;
import com.mishop.entity.Page;
import com.mishop.entity.Product;

public class AddressService {
	private static AddressService ps;
	
	private AddressService() {
		
	}
	
	public static AddressService getAddressService() {
		if(ps==null) {
			synchronized (AddressService.class) {
				if(ps==null) {
					ps=new AddressService();
				}
			}
		}
		return ps;
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
//	public static void main(String[] args) {
//		OrderItem oi1=new OrderItem();
//		OrderItem oi2=new OrderItem();
//		List<OrderItem> list=new ArrayList<OrderItem>();
//		for(OrderItem oi:list) {
//			oi.setOrderNumber(OrderNumber.getOrderNumber());
//			oi.setUserId(1);
//			oi.setProductId(1);
//			oi.setColorId(1);
//			oi.setProductName("李小龙");
//			oi.setUnitPrice(1000);
//			oi.setProductImage("abc");
//			oi.setQuantity(10);
//			oi.setTotalPrice(oi.getUnitPrice()*oi.getQuantity());
//		}
//		list.add(oi1);
//		list.add(oi2);
//		OrderService.getProductService().addOrderItem(list);
//		System.out.println("执行成功");
//	}
	/**
	 * 增加子订单
	 * @param orderItems
	 */
	public void addOrderItem(List<OrderItem> orderItems) {
		for(OrderItem oi:orderItems) {
			OrderDaoImpl.getProductDaoImpl().addOrderItem(oi);
		}
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

	public List<Address> queryAddresses(int userId) {
		List<Address> addresses=AddressDaoImpl.getAddressDaoImpl().queryAddresses(userId);
		return addresses;
	}
}
