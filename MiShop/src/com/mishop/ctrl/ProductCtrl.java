package com.mishop.ctrl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.mishop.entity.Product;
import com.mishop.service.impl.ColorServiceImpl;
import com.mishop.service.impl.ProductServiceImpl;
import com.mishop.utils.UploadUtils;

/**
 * Servlet implementation class ProductCtrl
 */
@WebServlet("/ProductCtrl")
public class ProductCtrl extends HttpServlet {
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		this.doPost(request, response);
	}

	/**
	 * @throws IOException
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		
		String mainImage = "";
		String subImages = "";
		String fieldName = "";

		// 产品名称
		String productName = null;
		// 产品类别
		int category = -1;
		// 产品描述
		String description = null;
		// 产品配置
		String config = null;
		// 产品颜色,将字符串拆分
		String color = null;
		// 产品价格
		Double price = -1.0;
		// 折扣金额
		Double discount = -1.0;
		// 库存
		int stock = -1;
		// 商品摘要
		String detail = null;

		// 首先，获得保存上传文件的目录的路径以及缓存文件的目录
		// String savePath = this.getServletContext().getRealPath("/upload");
		// String savePath = "D:\\apache-tomcat-8.5.32\\upload";
		String savePath = new File(request.getServletContext().getRealPath("/")).getParent() + "/upload";
		// 1、创建一个DiskFileItemFactory工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 2、创建一个文件上传解析器
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 3、解决上传文件名的中文乱码
		upload.setHeaderEncoding("UTF-8");
		// 4、判断上传上来的数据是否是表单上传的数据，如果不是，直接返回
		if (!ServletFileUpload.isMultipartContent(request)) {
			return;
		}
		// 5、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个表单的输入项
		try {
			List<FileItem> list = upload.parseRequest(request);
			// 6、使用增强for循环获取所有的输入项，使用ServletFileUpload解析得到的是
			for (FileItem item : list) {
				// 如果FileItem中封装的是文件上传，执行文件上传的相关操作
				if (item.isFormField()) {
					fieldName = item.getFieldName();
					if(fieldName.equals("pname")) {
						productName = item.getString("utf-8");
						// 验证产品名称是否已存在
						if (ProductServiceImpl.getInstance().queryProductByName(productName) != null) {
							out.print("该商品名称已存在");
							return;
						}
					} else if(fieldName.equals("category")) {
						category = Integer.parseInt(item.getString("utf-8"));
					} else if(fieldName.equals("description")) {
						description = item.getString("utf-8");
					} else if(fieldName.equals("config")) {
						config = item.getString("utf-8");
					} else if(fieldName.equals("color")) {
						color = item.getString("utf-8");
					} else if(fieldName.equals("price")) {
						price = Double.parseDouble(item.getString("utf-8"));
					} else if(fieldName.equals("discount")) {
						discount = Double.parseDouble(item.getString("utf-8"));
					} else if(fieldName.equals("stock")) {
						stock = Integer.parseInt(item.getString("utf-8"));
					} else if(fieldName.equals("detail")) {
						detail = item.getString("utf-8");
					}
				} else {
					if ("main_image".equals(item.getFieldName())) {
						mainImage = UploadUtils.saveFile(item, savePath);
					} else {
						String tempImage = UploadUtils.saveFile(item, savePath);
						subImages = subImages + "," + tempImage;
					}
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		Product product = new Product();
		product.setCategoryId(category);
		product.setProductName(productName);
		product.setDescription(description);
		product.setDetail(detail);
		product.setPrice(price);
		product.setDiscountPrice(discount);
		product.setConfig(config);
		product.setStock(stock);
		product.setStatus(1);
		product.setMainImage(mainImage);
		product.setSubImages(subImages);
		//Product product = new Product(0, category, productName, description, detail, price, discount, config, stock, 1,
				//mainImage, subImages, null, null);
		int productId = ProductServiceImpl.getInstance().insertProduct(product);
		String[] colorArr = color.split("/");
		// 将颜色添加到表当中
		for (String colorStr : colorArr) {
			ColorServiceImpl.getInstance().insertColor(productId, colorStr);
		}
		out.print("上传成功");
	}
	

}
