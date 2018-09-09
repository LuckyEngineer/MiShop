package com.mishop.dao.impl;

import java.math.BigInteger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.mishop.entity.Adver;
import com.mishop.entity.Product;
import com.mishop.utils.DBConnector;
import com.mishop.utils.DataSourceUtils;

public class ProductDaoImpl {
	private static ProductDaoImpl productDaoImpl;
	
	public int rowCount;
	public int pageCount;
	
	private ProductDaoImpl() {
		
	}
	
	public static ProductDaoImpl getInstance() {
		if(productDaoImpl == null) {
			synchronized (ProductDaoImpl.class) {
				if(productDaoImpl == null) {
					productDaoImpl = new ProductDaoImpl();
				}
			}
		}
		return productDaoImpl;
	}
	
	/**
	 * @author LY
	 * 添加商品，返回最新加入商品的id
	 * @param product
	 * @return
	 */
	public int insertProduct(Product product) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		// 增加SQL语句
		String insertSql = "insert into tb_product(category_id,name,description,"
				+ "detail,price,discount_price,config,stock,status,main_image,"
				+ "sub_images,create_time,update_time)"
				+ " values(?,?,?,?,?,?,?,?,?,?,?,now(),now())";
		String sql="select @@identity";
		// SQL语句的置换参数
		Object[] params = {
				product.getCategoryId(),product.getProductName(),
				product.getDescription(),product.getDetail(),
				product.getPrice(),product.getDiscountPrice(),
				product.getConfig(),product.getStock(),
				product.getStatus(),product.getMainImage(),
				product.getSubImages()
		};
		BigInteger num = null;
		try {
			// 增删改的通用方法update()
			int count = runner.update(insertSql,params);
			num= (BigInteger) runner.query(sql,new ScalarHandler(1));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return (int)num.longValue();
	}

	/**
	 * @author LY
	 * 根据商品名称查询商品
	 * @param productName
	 * @return
	 */
	public Product queryProductByName(String productName) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from tb_product where name = ?";
		Object[] params = {productName};
		Product product = null;
		try {
			product = runner.query(sql, new BeanHandler<Product>(Product.class),params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return product;
	}
	
	/**
	 * @author LY
	 * 分页查询商品信息
	 * @param pageNow
	 * @param pageSize
	 * @return
	 */
	public List<Product> queryProductsByPage(int pageNow, int pageSize){
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		// sql1:查询总记录条数
		String sql1 = "select count(product_id) from tb_product";
		// sql2:分页查询
		String sql2 = "select * from tb_product limit ?,?";
		Object[] obj = null;
		try {
			// 获取总的记录条数
			obj = runner.query(sql1, new ArrayHandler());
			rowCount = (int)obj[0];
			// 获取总页数
			if (rowCount % pageSize == 0) {
				pageCount = rowCount / pageSize;
			} else {
				pageCount = rowCount / pageSize + 1;
			}
			Object[] params = {pageNow,pageSize};
			List<Product> productList = runner.query(sql2, new BeanListHandler<Product>(Product.class), params);
			return productList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * @author zxp
	 * 查询所有商品
	 * @return
	 * @throws SQLException
	 */
	public static List<Product> queryProducts(){
		PreparedStatement ps;
		List<Product> products=new ArrayList<Product>();
		try {
			ps = DBConnector.getConnection().prepareStatement("select * from tb_product");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Product product=new Product();
				product.setProductId(rs.getInt("product_id"));
				product.setCategoryId(rs.getInt("category_id"));
				product.setProductName(rs.getString("name"));
				product.setDescription(rs.getString("description"));
				product.setMainImage(rs.getString("main_image"));
				product.setSubImages(rs.getString("sub_images"));
				product.setDetail(rs.getString("detail"));
				product.setPrice(rs.getDouble("price"));
				product.setDiscountPrice(rs.getDouble("discount_price"));
				product.setStatus(rs.getInt("status"));
				product.setStock(rs.getInt("stock"));
				product.setConfig(rs.getString("config"));
				products.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
	}
	
	/**
	 * @author zxp
	 * 查询大型广告图
	 * @return
	 */
	public List<Adver> queryAdver(){
		
		List<Adver> list = new ArrayList<Adver>();
		//创建预处理对象
		try {
			PreparedStatement pstmt = DBConnector.getConnection().prepareStatement("select adver_id, adver_type,href from tb_adver where adver_type=0");
			//放入结果集里面
			ResultSet rs = pstmt.executeQuery();
			//读取 出来
			while(rs.next()) {
				Adver adver = new Adver();
				adver.setAdverId(rs.getInt("adver_id"));
				adver.setAdverType(rs.getInt("adver_type"));
				adver.setAdverHref(rs.getString("href"));
				list.add(adver);///放入集合里面
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 查询大广告图
	 * @return
	 */
	public List<Adver> querySmallAdver(){
		
		List<Adver> list = new ArrayList<Adver>();
		//创建预处理对象
		try {
			PreparedStatement pstmt = DBConnector.getConnection().prepareStatement("select adver_id, adver_type,href from tb_adver where adver_type=1");
			//放入结果集里面
			ResultSet rs = pstmt.executeQuery();
			//读取 出来
			while(rs.next()) {
				Adver adver = new Adver();
				adver.setAdverId(rs.getInt("adver_id"));
				adver.setAdverType(rs.getInt("adver_type"));
				adver.setAdverHref(rs.getString("href"));
				list.add(adver);//放入集合里面
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
}
