package com.mast.shop.tools;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

/**
 * 多文件上传
 */
public class UploadImageTool {
	public static boolean uploadImage(CommonsMultipartFile[] files){
		boolean flag=true;
		if (files != null) {
			for (int i = 0; i < files.length; i++) {
				String type = files[i].getOriginalFilename().substring(
						files[i].getOriginalFilename().indexOf("."));// 取文件格式后缀名
				String filename = System.currentTimeMillis() + type;// 取当前时间戳作为文件名
				String path="D:"+File.separator+filename;
				/*String path = request.getSession().getServletContext()
						.getRealPath("/upload/" + filename);*/// 存放位置
				File destFile = new File(path);
				 String dipath="D:"+File.separator+"projectImage";
				    File file=new File(dipath);
				    	if(file.exists()){
				    		file.delete();
				    	}else{
				    		file.mkdir();
				    	}
				try {
					FileUtils.copyInputStreamToFile(files[i].getInputStream(),
							destFile);// 复制临时文件到指定目录下
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			System.out.println("-----ok------");
			return flag;
		} else {
			return flag;
		}
	}
	

}
