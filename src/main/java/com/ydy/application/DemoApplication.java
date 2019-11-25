package com.ydy.application;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import com.baomidou.mybatisplus.plugins.OptimisticLockerInterceptor;

@SpringBootApplication
@MapperScan("com.ydy.application.mapper")
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

//	@Bean
//	public FilterRegistrationBean buildbFilter() {
//		FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
//		filterRegistrationBean.setOrder(6);
//		filterRegistrationBean.setFilter(new AuthFilter());
//		filterRegistrationBean.setName("AuthFilter");
//		filterRegistrationBean.addUrlPatterns("/*");
//		return filterRegistrationBean;
//	}

//	@Bean
//	public FilterRegistrationBean buildAFilter() {
//		FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
//		filterRegistrationBean.setOrder(7);
//		filterRegistrationBean.setFilter(new TokenHandleFilter());
//		filterRegistrationBean.setName("TokenHandleFilter");
//		filterRegistrationBean.addUrlPatterns("/*");
//		return filterRegistrationBean;
//	}

	// 只要网关配置就好 ， 底下的服务不需要配置。两个同时配置还导致了 跨域失败 适得其反。
	@Bean
	public CorsFilter corsFilter() {
		final UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
		final CorsConfiguration config = new CorsConfiguration();
		config.setAllowCredentials(true); // 允许cookies跨域
		config.addAllowedOrigin("*"); // #允许向该服务器提交请求的URI，*表示全部允许，在SpringMVC中，如果设成*，会自动转成当前请求头中的Origin
		config.addAllowedHeader("*"); // #允许访问的头信息,*表示全部
		config.addAllowedMethod("*"); // 预检请求的缓存时间（秒），即在这个时间段里，对于相同的跨域请求不会再预检了
		config.setMaxAge(0L); // 预检请求的缓存时间（秒），即在这个时间段里，对于相同的跨域请求不会再预检了
		source.registerCorsConfiguration("/**", config);
		return new CorsFilter(source);
	}


	@Bean
	public OptimisticLockerInterceptor optimisticLockerInterceptor() {
		return new OptimisticLockerInterceptor();
	}

}