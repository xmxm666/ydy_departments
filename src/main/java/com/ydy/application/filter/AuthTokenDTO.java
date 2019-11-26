package com.ydy.application.filter;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

/**
 * 网关信息
 */
@Data
public class AuthTokenDTO {
	
	private String accessToken;// 接口token

	private String platType;// 0-科室医生 ，1-手机端用户，2-运营人员 3 进销存商家
	
	private Integer sectionId;// 如果是科室端，该字段代表科室id

	private String accountNo;// 用户唯一编号
	
	private String mechantNo;// 商家编号

	private String phone;// 手机号

	private String userName;// 用户名

	private String password;// 密码

	private Integer departMentId;

	private Integer roleId;
	
	private Date registerTime;
	
	private String sex;
	
	private Integer age;
	
	private Integer userId;
}
