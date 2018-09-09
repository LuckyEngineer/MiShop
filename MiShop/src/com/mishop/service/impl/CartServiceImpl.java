package com.mishop.service.impl;

import java.util.List;

import com.mishop.dao.impl.CartDaoImpl;
import com.mishop.entity.Cart;
import com.mishop.entity.User;

public class CartServiceImpl {
	private static CartServiceImpl cartService;
	private CartServiceImpl() {
		
	}
	public static CartServiceImpl getCartService() {
		if(cartService==null) {
			cartService = new CartServiceImpl();
		}
		return cartService;
	}
	
	//账户登录进来，就要查询购物车，
	public List<Cart> queryCart(int userId) {
		List<Cart> list = CartDaoImpl.getCartDaoImpl().queryCart(userId);
		return list;
	}
	
	//修改购物车中商品的数量
	public void updateCart(int quantity,int cartId) {
		CartDaoImpl.getCartDaoImpl().upateCart(quantity, cartId);
	}
	//删除购物车中的商品
	public void deleteCart(int cartId) {
		CartDaoImpl.getCartDaoImpl().deleteCart(cartId);
	}
	
	/**
	 * 增加购物车数量
	 * @param cart
	 * @return
	 */
	public boolean addCart(Cart cart) {
		boolean judge=CartDaoImpl.getCartDaoImpl().addCart(cart);
		return judge;
	}
	
}