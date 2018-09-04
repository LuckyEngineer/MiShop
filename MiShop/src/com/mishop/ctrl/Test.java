package com.mishop.ctrl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.mishop.entity.Admin;
import com.mishop.utils.DataSourceUtils;

public class Test {
	
	public static void main(String[] args) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from tb_admin where admin_id = 20";
		Admin admin = null;
		try {
			admin = runner.query(sql,new BeanHandler<Admin>(Admin.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
