package com.mishop.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mishop.entity.Address;
import com.mishop.entity.Product;
import com.mishop.utils.DBConnector;

public class AddressDaoImpl {
	private static AddressDaoImpl ps;;
	
	private int pageCount;
	private AddressDaoImpl() {
		
	}
	
	public static AddressDaoImpl getAddressDaoImpl() {
		if(ps==null) {
			synchronized (AddressDaoImpl.class) {
				if(ps==null) {
					ps=new AddressDaoImpl();
				}
			}
		}
		return ps;
	}
	public static void main(String[] args) {
		List<Address> list=AddressDaoImpl.getAddressDaoImpl().queryAddresses(1);
		for(Address a:list) {
			System.out.println(a.getReceiver());
		}
	}
	public List<Address> queryAddresses(int userId) {
		PreparedStatement ps;
		List<Address> addresses=new ArrayList<Address>();
		try {
			ps = DBConnector.getConnection().prepareStatement("select * from tb_addr where user_id=?");
			ps.setInt(1, userId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Address add=new Address();
				add.setAddressId(rs.getInt("addr_id"));
				add.setUserId(rs.getInt("user_id"));
				add.setProvince(rs.getString("province"));
				add.setCity(rs.getString("city"));
				add.setAddress("addr");
				add.setTel(rs.getString("tel"));
				add.setPostalCode(rs.getString("postal_code"));
				add.setCreateTime(new java.util.Date(rs.getDate("create_time").getTime()));
				add.setReceiver(rs.getString("receiver"));
				addresses.add(add);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 	addresses;
	}
	
	
}