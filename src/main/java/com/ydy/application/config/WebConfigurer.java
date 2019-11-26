package com.ydy.application.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ydy.application.interceptor.AuthorityInterceptor;

/**
 * 和springmvc的webmvc拦截配置一样
 * @author BIANP
 */
//@Configuration
public class WebConfigurer implements WebMvcConfigurer {
	 @Override
	 public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(AuthorityInterceptor()).addPathPatterns("/**").excludePathPatterns("/error");
	 }
	 
	 
	 @Bean
	 public AuthorityInterceptor AuthorityInterceptor() {
		 return new AuthorityInterceptor();
	 }
}
