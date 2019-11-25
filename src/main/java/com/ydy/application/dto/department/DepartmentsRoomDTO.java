package com.ydy.application.dto.department;

import java.util.List;

import com.ydy.application.entity.department.DepartmentsBed;
import com.ydy.application.entity.department.DepartmentsRoom;

import lombok.Data;

@Data
public class DepartmentsRoomDTO extends DepartmentsRoom{
	
	private List<DepartmentsBedDTO> bedList;
	
}
