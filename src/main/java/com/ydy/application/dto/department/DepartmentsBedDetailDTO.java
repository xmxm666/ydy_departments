package com.ydy.application.dto.department;

import java.util.List;

import com.ydy.application.entity.department.DepartmentsBed;
import com.ydy.application.entity.department.DepartmentsPatient;

import lombok.Data;

@Data
public class DepartmentsBedDetailDTO extends DepartmentsBed{
	
	private  DepartmentsPatient patient;
	
	private List data1;
	
	private List data2;
	
	private List data3;
	
	private List data4;

}
