package com.ydy.application.dto.department;

import com.ydy.application.entity.department.DepartmentsBed;
import com.ydy.application.entity.department.DepartmentsDevice;
import lombok.Data;

@Data
public class DepartmentsDeviceDTO extends DepartmentsDevice{

	private Integer rid;

}
