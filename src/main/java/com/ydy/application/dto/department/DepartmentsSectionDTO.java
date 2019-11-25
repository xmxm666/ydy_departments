package com.ydy.application.dto.department;

import com.ydy.application.entity.department.DepartmentsAdmin;
import com.ydy.application.entity.department.DepartmentsSection;
import lombok.Data;

@Data
public class DepartmentsSectionDTO extends DepartmentsSection {

	/**
     * 医院名称
	 */
	private String hospitalName;


}
