package com.mishop.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.apache.commons.fileupload.FileItem;

public class UploadUtils {
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
		return savaFileName;
	}
}