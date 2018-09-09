package com.mishop.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.mishop.entity.Address;
import com.mishop.entity.Order;
import com.mishop.entity.OrderDetail;
import com.mishop.entity.OrderItem;
import com.mishop.entity.Page;
import com.mishop.utils.DBConnector;
import com.mishop.utils.DataSourceUtils;

public class OrderDaoImpl {
	private static OrderDaoImpl ps;;
	
	private int pageCount;
	
	private OrderDaoImpl() {
		
	}
	
	public static OrderDaoImpl getProductDaoImpl() {
		if(ps==null) {
			synchronized (OrderDaoImpl.class) {
				if(ps==null) {
					ps=new OrderDaoImpl();
				}
			}
		}
		return ps;
	}
	
	/**
	 * 查询订单
	 * @param orderId
	 * @return
	 */
	public OrderDetail queryOrderDetail(int orderId) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select order_id as orderId,order_no as orderNo,create_time as createTime,"
				+ "receiver,province,city,addr,tel,payment from order_detail_view where order_id = ?";
		Object[] params = {orderId};
		OrderDetail detail = null;
		try {
			detail = runner.query(sql, new BeanHandler<OrderDetail>(OrderDetail.class),params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return detail;
	}
	
	/**
	 * 增加订单
	 * @return
	 * @throws SQLException
	 */
	public int addOrder(Order order){
		int res = 0;
		PreparedStatement ps;
		try {
			ps = DBConnector.getConnection().prepareStatement("insert into tb_order(order_no,user_id,payment,addr_id,payment_time,create_time,update_time)"
					+ " values(?,?,?,?,now(),now(),now())");
			ps.setLong(1, order.getOrderNumber());
			ps.setInt(2,order.getUserId());
			ps.setDouble(3,order.getPayment());
			ps.setInt(4, order.getAddressId());
			res = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 增加子订单
	 * @param oi
	 */
	public int addOrderItem(OrderItem oi) {
		int res = 0;
		PreparedStatement ps;
		try {
			ps = DBConnector.getConnection().prepareStatement("insert into tb_order_item(user_id,order_no,product_id,"
					+ "color,product_name,product_image,unit_price,quantity,total_price,create_time,update_time,config)"
					+ " values(?,?,?,?,?,?,?,?,?,now(),now(),?)");
			ps.setInt(1, oi.getUserId());
			ps.setLong(2,oi.getOrderNumber());
			ps.setInt(3,oi.getProductId());
			ps.setString(4, oi.getColor());
			ps.setString(5, oi.getProductName());
			ps.setString(6, oi.getProductImage());
			ps.setDouble(7, oi.getUnitPrice());
			ps.setInt(8,oi.getQuantity());
			ps.setDouble(9, oi.getTotalPrice());
			ps.setString(10, oi.getConfig());
//			ps.setTimestamp(10, new Timestamp(new java.util.Date().getTime()));
//			ps.setTimestamp(11, new Timestamp(new java.util.Date().getTime()));
			res = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("子订单生成失败");
		}
		return res;
	}
	/**
	 * 分页查询订单
	 * @param page
	 * @return
	 */
	public void queryOrder(int userId,Page<Order> page){
		List<Order> list=new ArrayList<Order>();
		//计算总共有多少条数据
		int totalCount=this.getTotalCount(userId);
		page.setTotalCount(totalCount);
		//判断当前页面的状态
		if(page.getCurrentPage()<=0) {
			page.setCurrentPage(1);
		}else if(page.getCurrentPage()>page.getTotalPage()) {
			page.setCurrentPage(page.getTotalPage());
		}
		
		//获取当前页:计算查询的起始行、返回的行数
		int currentPage=page.getCurrentPage();
		int index=(currentPage-1)*page.getPageCount();
		int count=page.getPageCount();
		
		//查询数据
		try {
			PreparedStatement pm = DBConnector.getConnection().prepareStatement("select * from tb_order where user_id=? limit ?,?");
			pm.setInt(1, userId);
			pm.setInt(2, index);
			pm.setInt(3,count);
			ResultSet rs=pm.executeQuery();
			while(rs.next()) {
				Order order=new Order();
				order.setOrderId(rs.getInt("order_id"));
				order.setOrderNumber(rs.getLong("order_no"));
				order.setUserId(rs.getInt("user_id"));
				int addressId=rs.getInt("addr_id");
				Address add=this.getUserName(addressId);
				order.setReceiver(add.getReceiver());
				order.setTel(add.getTel());
				order.setAddress(add.getAddress());
				order.setStatus(rs.getInt("status"));
				order.setPayment(rs.getDouble("payment"));
				//由于从数据库中取出的date数据的类型时java.sql.date，所以必须将它转换成util中的date类型
				order.setPaymentTime(new java.util.Date(rs.getDate("payment_time").getTime()));
				order.setCreateTime(new java.util.Date(rs.getDate("create_time").getTime()));
				order.setUpdateTime(new java.util.Date(rs.getDate("update_time").getTime()));
				list.add(order);
			}
			page.setPageData(list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	/**
	 * 根据地址Id查询收件信息
	 * @param addId
	 * @return
	 */
	public Address getUserName(int addId) {
		String userName=null;
		Address add=null;
		try {
			PreparedStatement pm = DBConnector.getConnection().prepareStatement("select * from tb_addr where addr_id=?");
			pm.setInt(1, addId);
			ResultSet rs=pm.executeQuery();
			if(rs.next()) {
				add=new Address();
				add.setAddressId(rs.getInt("addr_id"));
				add.setUserId(rs.getInt("user_id"));
				add.setProvince(rs.getString("province"));
				add.setAddress(rs.getString("addr"));
				add.setTel(rs.getString("tel"));
				add.setPostalCode(rs.getString("postal_code"));
				add.setCreateTime(new java.util.Date(rs.getDate("create_time").getTime()));
				add.setReceiver(rs.getString("receiver"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return add;
	}
	/**
	 * 查询总的数据数量
	 * @return
	 */
	public int getTotalCount(int userId) {
		int rowNumber = 0;
		PreparedStatement ps;
		try {
			ps = DBConnector.getConnection().prepareStatement("select count(order_id) from tb_order where user_id=?");
			ps.setInt(1, userId);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				rowNumber=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rowNumber;
	}
	
	/**
	 * 根据订单编号查询子订单
	 * @param orderNumber
	 * @return
	 */
	public List<OrderItem> getOrderItems(Long orderNumber){
		List<OrderItem> list=new ArrayList<OrderItem>();
		try {
			PreparedStatement ps=DBConnector.getConnection().prepareStatement("select * from tb_order_item where order_no=?");
			ps.setLong(1, orderNumber);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				OrderItem oi=new OrderItem();
				oi.setOrderItemId(rs.getInt("id"));
				oi.setUserId(rs.getInt("user_id"));
				oi.setOrderNumber(rs.getLong("order_no"));
				oi.setProductId(rs.getInt("product_id"));
				oi.setColor(rs.getString("color"));
				oi.setConfig(rs.getString("config"));
				oi.setProductName(rs.getString("product_name"));
				oi.setProductImage(rs.getString("product_image"));
				oi.setUnitPrice(rs.getDouble("unit_price"));
				oi.setQuantity(rs.getInt("quantity"));
				oi.setTotalPrice(rs.getDouble("total_price"));
				oi.setCreateTime(rs.getDate("create_time"));
				oi.setUpdateTime(rs.getDate("update_time"));
				list.add(oi);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static void main(String[] args) throws SQLException {
		Page page=new Page();
		//计算总共有多少条数据
//		int totalCount=OrderDaoImpl.getProductDaoImpl().getTotalCount();
//		page.setTotalCount(totalCount);
//		
//		int currentPage=page.getCurrentPage();
//		int index=(currentPage-1)*page.getPageCount();
//		int count=page.getPageCount();
//		OrderDaoImpl.getProductDaoImpl().queryOrder(1,page);
//		System.out.println(page.getPageData());
		System.out.println(OrderDaoImpl.getProductDaoImpl().getTotalCount(1));
	}
}
