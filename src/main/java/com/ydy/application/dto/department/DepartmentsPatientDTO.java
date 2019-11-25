package com.ydy.application.dto.department;

import com.ydy.application.entity.department.DepartmentsPatient;
import com.ydy.application.entity.department.DepartmentsRoom;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

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
	
}
