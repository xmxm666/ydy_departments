package com.ydy.application;
 
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
 
import com.baomidou.mybatisplus.plugins.PaginationInterceptor;
 
@Configuration
public class MybatisPlusConfig {
	 /**
     *   mybatis-plus分页插件
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        PaginationInterceptor page = new PaginationInterceptor();
        page.setDialectType("mysql");
        return page;
    }

}