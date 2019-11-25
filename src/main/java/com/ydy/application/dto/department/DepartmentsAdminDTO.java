package com.ydy.application.dto.department;

import com.ydy.application.entity.department.DepartmentsAdmin;
import com.ydy.application.entity.department.DepartmentsBed;
import com.ydy.application.entity.department.DepartmentsDevice;
import lombok.Data;

@Data
public class DepartmentsAdminDTO extends DepartmentsAdmin {

	/**
	 * 科室名称
	 */
	private String sectionName;

}
