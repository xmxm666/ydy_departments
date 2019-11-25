package com.ydy.application.config;

import java.io.File;
import java.io.IOException;

import javax.servlet.MultipartConfigElement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

import com.qiniu.common.Zone;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

@Configuration
public class QiniuConfig {

	@Autowired
	private ConstantQiniu constantQiniu;
	
	 @Autowired
	 private Environment env;

	@Bean
	public UploadManager UploadManager() {
		com.qiniu.storage.Configuration cfg = new com.qiniu.storage.Configuration(Zone.zone0());
		UploadManager uploadManager = new UploadManager(cfg);
		return uploadManager;
	}

	@Bean
	public Auth auth() {
		String accessKey = constantQiniu.getAccessKey();
		String secretKey = constantQiniu.getSecretKey();
		Auth auth = Auth.create(accessKey, secretKey);
		return auth;
	}

	/**
	 * 文件上传配置
	 * 
	 * @return
	 */
	@Bean
	public MultipartConfigElement multipartConfigElement() {
		MultipartConfigFactory factory = new MultipartConfigFactory();
		File directory = new File("");// 参数为空
		try {
			// 解决The temporary upload location异常

			// Windows_NT
			String property = env.getProperty("os");

			if (property != null && property.contains("Windows")) {
				String courseFile = directory.getCanonicalPath();
				factory.setLocation(courseFile);
			} else {
				factory.setLocation("/app/uploadpic/tmp");
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		// 单个数据大小
		factory.setMaxFileSize("2048000KB"); // KB,MB
		/// 总上传数据大小

		factory.setMaxRequestSize("2048000KB");
		return factory.createMultipartConfig();
	}

}
