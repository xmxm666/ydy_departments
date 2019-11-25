package com.ydy.application.service.department;

import com.baomidou.mybatisplus.service.IService;
import com.ydy.application.dto.department.DepartmentsPatientDTO;
import com.ydy.application.entity.department.DepartmentsPatient;
import com.ydy.application.util.PageDTO;
import com.ydy.application.util.Response;

import java.util.Map;

/**
 * <p>
 * 子用户表 服务类
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
public interface DepartmentsPatientService extends IService<DepartmentsPatient> {

	/**
	 * 分页信息
	 * @param queryInfo
	 * @return
	 */
	PageDTO selectPageList(Map<String, Object> queryInfo);

    /**
     * 病人出院
     * @param id
     * @return
     */
	Response patientOutHospital(Integer id);

	/**
	 * 新增/更新病人
	 * @param patientDTO
	 * @return
	 */
	Response insertOrUpdate(DepartmentsPatientDTO patientDTO);

    /**
     * 查询
     * @param id
     * @return
     */
    Response selectPatient(Integer id);
}
