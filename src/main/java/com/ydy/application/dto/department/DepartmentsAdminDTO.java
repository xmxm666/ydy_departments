package com.ydy.application.dto.department;

import com.ydy.application.entity.department.DepartmentsAdmin;
import lombok.Data;

@Data
public class DepartmentsAdminDTO extends DepartmentsAdmin {

	/**
	 * 科室名称
	 */
	private String sectionName;

	private Integer hospitalId;

	private String hospitalName;

	private String roles;

	private Integer[] role;

}
