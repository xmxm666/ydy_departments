package com.ydy.application.dto.department;

import lombok.Data;

import java.util.Date;

@Data
public class DepartmentsPatientDataDTO {

	private Integer did;

	private String mac;

	//数据类型     1:spo2, 2:hr, 3:rr, 4:nibp
	private Integer dataType;

	//时间类型     1:实时、2:时、3:日、4:周
	private Integer timeType;

	//获取该时间之前的数据
	private Date lastDate;

}
