package com.mishop.ctrl;

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
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

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
		String savePath = this.getServletContext().getRealPath("/upload");
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
						detail = item.getString("utf-8");
					}
				} else {
					out.print(item.getFieldName());
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
		Product product = new Product(0, category, productName, description, detail, price, discount, config, stock, 1,
				mainImage, subImages, null, null);
		int productId = ProductServiceImpl.getInstance().insertProduct(product);
		String[] colorArr = color.split("/");
		// 将颜色添加到表当中
		for (String colorStr : colorArr) {
			ColorServiceImpl.getInstance().insertColor(productId, colorStr);
		}

		out.print("上传成功");

	}

	/*
	 * 
	 * // 得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全 String savePath =
	 * this.getServletContext().getRealPath("/WEB-INF/upload"); File file = new
	 * File(savePath);
	 * 
	 * 
	 * // 判断上传文件的保存目录是否存在 if (!file.exists() && !file.isDirectory()) {
	 * out.print(savePath + "目录不存在，需要创建"); //System.out.println(savePath +
	 * "目录不存在，需要创建"); // 创建目录 file.mkdir(); } try { // 1、创建一个DiskFileItemFactory工厂
	 * DiskFileItemFactory factory = new DiskFileItemFactory(); // 2、创建一个文件上传解析器
	 * ServletFileUpload upload = new ServletFileUpload(factory); // 解决上传文件名的中文乱码
	 * upload.setHeaderEncoding("UTF-8"); String fieldName = ""; //
	 * 3、判断提交上来的数据是否是上传表单的数据 if (!ServletFileUpload.isMultipartContent(request)) {
	 * // 按照传统方式获取数据 return; } // 获取普通文本的表单字段 Product product = new Product();
	 * 
	 * // 4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，
	 * 每一个FileItem对应一个Form表单的输入项 List<FileItem> list = upload.parseRequest(request);
	 * for (FileItem item : list) { // 如果fileitem中封装的是普通输入项的数据 if
	 * (!item.isFormField()) { // 解决普通输入项的数据的中文乱码问题 String value =
	 * item.getString("UTF-8"); System.out.println(item.getFieldName()); //
	 * System.out.println("属性名是：" + item.getName() + ",属性值为：" +
	 * item.getFieldName()); // System.out.println(); } else { //
	 * 如果fileitem中封装的是上传文件
	 * 
	 * // 获取上传文件中name对应的属性值 String imageName = item.getFieldName();
	 * if(imageName.equals("main_image")) { System.out.println("产品主图是：" +
	 * item.getString() + "name=" + item.getFieldName()); } // 得到上传的文件名称， String
	 * filename = item.getName(); if (filename == null ||
	 * filename.trim().equals("")) { continue; }
	 * 
	 * 
	 * 
	 * // 注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：
	 * c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt // 处理获取到的上传文件的文件名的路径部分，只保留文件名部分 filename =
	 * filename.substring(filename.lastIndexOf("\\") + 1); // 获取item中的上传文件的输入流
	 * InputStream in = item.getInputStream(); // 创建一个文件输出流 FileOutputStream out =
	 * new FileOutputStream(savePath + "\\" + filename); System.out.println(savePath
	 * + "\\" + filename); // 创建一个缓冲区 byte buffer[] = new byte[1024]; //
	 * 判断输入流中的数据是否已经读完的标识 int len = 0; //
	 * 循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据 while ((len =
	 * in.read(buffer)) > 0) { // 使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath +
	 * "\\" + filename)当中 out.write(buffer, 0, len); } // 关闭输入流 in.close(); // 关闭输出流
	 * out.close(); // 删除处理文件上传时生成的临时文件 item.delete(); // message = "文件上传成功！";
	 * 
	 * 
	 * } } }catch (Exception e) { // message = "文件上传失败！"; e.printStackTrace(); }
	 */

}
