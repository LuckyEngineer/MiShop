package com.mishop.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadUtils {
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	public static String uploadFile(HttpServletRequest request, HttpServletResponse response) {
		String imageUrl = "";
		// 保存图片的路径
		String savePath = new File(request.getServletContext().getRealPath("/")).getParent();
		// 1、创建一个DiskFileItemFactory工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 2、创建一个文件上传解析器
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 3、解决上传文件名的中文乱码
		upload.setHeaderEncoding("UTF-8");
		try {
			List<FileItem> list = upload.parseRequest(request);
			for(FileItem item:list) {
				String fileName = item.getName();
				if(fileName != null) {
					try {
						imageUrl = UploadUtils.saveFile(item, savePath);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		} catch(FileUploadException e) {
			e.printStackTrace();
		}
		
		return null;
		
		
	}
	
	
	/**
	 * 
	 * @param item
	 * @param savePath
	 * @return
	 * @throws IOException
	 */
	public static String saveFile(FileItem item, String savePath) throws IOException {
		// 得到上传的文件名称，
		String fileName = item.getName();
		if (fileName == null || fileName.trim().equals("")) {
			return "";
		}
		// 处理获取到的上传文件的文件名的路径部分，只保留文件名部分
		fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
		String fileType = item.getContentType();
		InputStream is = item.getInputStream();

		int hashCode = fileName.hashCode();
		String dir1 = Integer.toHexString(hashCode & 0XF);// 计算第一级目录
		String dir2 = Integer.toHexString((hashCode >> 4) & 0XF);// 计算第二级目录

		String aimDir = savePath + "/" + dir1;
		if (!new File(aimDir).exists()) {
			new File(aimDir).mkdir();
		}
		aimDir = aimDir + "/" + dir2;
		if (!new File(aimDir).exists()) {
			new File(aimDir).mkdir();
		}
		String savaFileName = aimDir + "/";
		String extName = fileName.substring(fileName.lastIndexOf("."));
		fileName = UUID.randomUUID().toString().replaceAll("-", "") + extName;
		savaFileName = savaFileName + fileName;
		// 创建一个文件输出流
		FileOutputStream fos = new FileOutputStream(new File(savaFileName));
		// 创建一个缓冲区
		byte buffer[] = new byte[1024];
		// 判断输入流中的数据是否已经读完的标识
		int len = 0;
		while ((len = is.read(buffer)) > 0) {
			// 使用FileOutputStream输出流将缓冲区的数据写入到指定目录当中
			fos.write(buffer, 0, len);
		}
		// 关闭输入流
		fos.close();
		// 关闭输出流
		is.close();
		// 删除处理文件上传时生成的临时文件
		item.delete();
		// 需要返回相对路径
		String relativePath = "/upload/" + dir1 + "/" + dir2 + "/" + fileName;
		return relativePath;
	}
}