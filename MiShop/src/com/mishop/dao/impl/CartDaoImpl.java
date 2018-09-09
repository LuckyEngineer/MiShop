package com.mishop.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mishop.entity.Cart;
import com.mishop.entity.User;
import com.mishop.utils.DBConnector;

//dao层的实现类

public class CartDaoImpl {
	private static CartDaoImpl cartDaoImpl;
	private static Connection conn = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	
	private CartDaoImpl() {
		
	}
	public static CartDaoImpl getCartDaoImpl() {
		if(cartDaoImpl==null) {
			cartDaoImpl = new CartDaoImpl();
		}
		return cartDaoImpl;
	}
	//将网页的信息显示出来
	//1、读取数据库内的信息
	//2、打包，通过结果集的方式，将信息放入bean类里面
	public List<Cart> queryCart(int userId) {
		//创建连接
		conn = DBConnector.getConnection();
		List<Cart> lists=new ArrayList<Cart>();
		try {
			//创建预处理对象
			pstmt = conn.prepareStatement("select * from cart_user_product_view where user_id=?");
			pstmt.setInt(1, userId);
			//执行sql语句，放到结果集里面
			rs = pstmt.executeQuery();
			//获取结果集中的数据，并打包成对象返回给后台表示层
			while(rs.next()) {
				Cart cart = new Cart();
				cart.setUserId(rs.getInt("user_id"));//用户Id
				cart.setCartId(rs.getInt("cart_id"));//购物车ID
				cart.setProductId(rs.getInt("product_id"));
				cart.setMainImage(rs.getString("main_image"));//商品图片
				cart.setName(rs.getString("name"));//商品名称
				cart.setConfig(rs.getString("config"));//商品描述
				cart.setColor(rs.getString("color"));//商品颜色
				cart.setPrice(rs.getDouble("price"));//商品单价
				cart.setQuantity(rs.getInt("quantity"));//一件商品的数量
				cart.setSubtotal(rs.getDouble("subtotal"));
				lists.add(cart);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lists;
	}
	
	//删除操作,通过id进行删除操作
	public void deleteCart(int cartId) {
		//创建连接
		conn=null;
		conn = DBConnector.getConnection();
		try {
			//创建预处理对象
			pstmt = null;
			pstmt = conn.prepareStatement("delete from tb_cart where cart_id=?");
			pstmt.setInt(1, cartId);//输入购物车id
			pstmt.executeUpdate();//执行更新操作
			System.out.println("删除成功");
		} catch (SQLException e) {
			System.out.println("删除失败");
		}
	}
	//修改数据，修改商品的数量
	public void upateCart(int quantity,int cartId) {
		//创建连接
		conn = null;
		conn = DBConnector.getConnection();
		pstmt = null;
		try {
			pstmt = conn.prepareStatement("update tb_cart set quantity=? where cart_id=?");
			pstmt.setInt(1, quantity);
			pstmt.setInt(2, cartId);
			pstmt.executeUpdate();
			System.out.println("修改成功");
		} catch (SQLException e) {
			System.out.println("更新失败");
		}
	}
	public boolean addCart(Cart cart) {
		conn = null;
		conn = DBConnector.getConnection();
		int judge=0;
		pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into tb_cart(user_id,product_id,quantity,color,now(),now())"
					+ " values(?,?,?,?)");
			pstmt.setInt(1, cart.getUserId());
			pstmt.setInt(2, cart.getProductId());
			pstmt.setInt(3, cart.getQuantity());
			pstmt.setString(4, cart.getColor());
			judge=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(judge==1) {
			return true;
		}else {
			return false;
		}
	}
}