package com.ydy.application.dto.department;

import java.util.List;

import com.ydy.application.entity.department.DepartmentsBed;

import com.ydy.application.entity.department.DepartmentsDevice;
import lombok.Data;

@Data
public class DepartmentsBedDTO extends DepartmentsBed{
	
	private DepartmentsDevice device;

	private Integer pid;

}
