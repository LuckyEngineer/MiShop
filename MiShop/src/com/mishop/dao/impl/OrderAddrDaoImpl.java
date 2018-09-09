package com.mishop.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.mishop.entity.Count;
import com.mishop.entity.OrderAddr;
import com.mishop.entity.ProductCategory;
import com.mishop.utils.DataSourceUtils;

/**
 * @author LY
 */
public class OrderAddrDaoImpl {
	
	private static OrderAddrDaoImpl orderAddrDaoImpl;
	
	public int rowCount;
	public int pageCount;
	
	private OrderAddrDaoImpl() {
		
	}
	
	public static OrderAddrDaoImpl getInstance() {
		if(orderAddrDaoImpl == null) {
			synchronized (OrderAddrDaoImpl.class) {
				if(orderAddrDaoImpl == null) {
					orderAddrDaoImpl = new OrderAddrDaoImpl();
				}
			}
		}
		return orderAddrDaoImpl;
	}
	
	public List<OrderAddr> queryOrderAddrList(int pageNow, int pageSize) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		// sql1:查询总记录条数
		String sql1 = "select count(order_id) as num from order_addr_view";
		// sql2:分页查询
		String sql2 = "select order_id as orderId,order_no as orderNo,receiver,status,payment,create_time as createTime from order_addr_view limit ?,?";
		Object[] obj = null;
		try {
			// 获取总的记录条数
			// 获取总的记录条数
			Count count = runner.query(sql1, new BeanHandler<Count>(Count.class));
			rowCount = count.getNum();
			// 获取总页数
			if (rowCount % pageSize == 0) {
				pageCount = rowCount / pageSize;
			} else {
				pageCount = rowCount / pageSize + 1;
			}
			int minRow = pageSize * (pageNow - 1);
			Object[] params = {minRow,pageSize};
			List<OrderAddr> orderAddrList = runner.query(sql2, new BeanListHandler<OrderAddr>(OrderAddr.class), params);
			return orderAddrList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
}
