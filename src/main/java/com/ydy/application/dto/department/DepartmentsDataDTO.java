package com.ydy.application.dto.department;

import com.ydy.application.entity.department.DepartmentsData;
import lombok.Data;

@Data
public class DepartmentsDataDTO extends DepartmentsData {

	//设备id
	private Integer did;
	
}
