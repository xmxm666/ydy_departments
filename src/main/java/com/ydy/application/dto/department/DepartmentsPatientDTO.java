package com.ydy.application.dto.department;

import com.ydy.application.entity.department.DepartmentsPatient;
import lombok.Data;

@Data
public class DepartmentsPatientDTO extends DepartmentsPatient {

	//病房id
	private Integer rid;

	private String roomName;

	//病床id
	private Integer bid;

	private String bedName;

	private Integer did;

	private String deviceNumber;

	//设备mac地址
	private String mac;

	//患者数据
	DepartmentsDataDTO patientData;
	
}
