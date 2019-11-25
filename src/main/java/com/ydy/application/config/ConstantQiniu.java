package com.ydy.application.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
@ConfigurationProperties(prefix = "qiniu")
public class ConstantQiniu {

	public  String accessKey;

    private String secretKey;

    private String bucket;

    private String domainStr;
}
