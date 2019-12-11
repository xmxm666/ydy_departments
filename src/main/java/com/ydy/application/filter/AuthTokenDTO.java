package com.ydy.application.filter;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

/**
 * 网关信息
 */
@Data
public class AuthTokenDTO {

	private Integer sectionId;// 如果是科室端，该字段代表科室id

	private String userName;// 用户名

	private String roles;

	private String platType;// 0-科室医生 ，1-手机端用户，2-运营人员 3 进销存商家

	private String loginTime;

	private Integer userId;

}
