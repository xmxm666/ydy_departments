package com.ydy.application;

import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.rules.DbType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

public class TestGen {
	public static void main(String[] args) throws InterruptedException {
		AutoGenerator mpg = new AutoGenerator();

		GlobalConfig gc = new GlobalConfig();
		gc.setOutputDir("D://codes");
		gc.setFileOverride(true);
		gc.setActiveRecord(true);  //不需要ActiveRecord特性的请改为false 
		gc.setEnableCache(true);// XML 二级缓存
		gc.setBaseResultMap(true);// XML ResultMap
		gc.setBaseColumnList(true);// XML columList
		gc.setAuthor("zqx");

		gc.setMapperName("%sMapper");
		gc.setXmlName("%sMapper");
		gc.setServiceName("%sService");
		gc.setServiceImplName("%sServiceImpl");
		gc.setControllerName("%sController");
		mpg.setGlobalConfig(gc);

		DataSourceConfig dsc = new DataSourceConfig();
		dsc.setDbType(DbType.MYSQL);
		
		dsc.setDriverName("com.mysql.jdbc.Driver");
		dsc.setUrl("jdbc:mysql://127.0.0.1:3306/ydy-department?characterEncoding=utf8&useSSL=false&autoReconnect=true&allowMultiQueries=true&serverTimezone=Asia/Shanghai");
		dsc.setUsername("root");
		dsc.setPassword("123456");
		mpg.setDataSource(dsc);

		StrategyConfig strategy = new StrategyConfig();
		// strategy.setTablePrefix(new String[] { "tlog_", "tsys_" });//
		strategy.setNaming(NamingStrategy.underline_to_camel);
		strategy.setInclude(new String[] { "departments_data" });
		// strategy.setExclude(new String[]{"test"});
		mpg.setStrategy(strategy);

		PackageConfig pc = new PackageConfig();
        pc.setParent("com.ydy.application");
        pc.setController("controller");
        pc.setService("service");
        pc.setMapper("mapper");
        pc.setEntity("entity");
        mpg.setPackageInfo(pc);
        
        
        TemplateConfig tc = new TemplateConfig();
        tc.setController("/templates/comtroller.java.vm");
        mpg.setTemplate(tc);
		mpg.execute();
	}



}
