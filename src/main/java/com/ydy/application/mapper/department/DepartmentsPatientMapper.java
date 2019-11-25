package com.ydy.application.mapper.department;

import com.ydy.application.dto.department.DepartmentsPatientDTO;
import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ydy.application.entity.department.DepartmentsPatient;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 子用户表 Mapper 接口
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
public interface DepartmentsPatientMapper extends BaseMapper<DepartmentsPatient> {

	void patientOutHospital(@Param("id") Integer id);


    Integer getPageListCount(Map<String, Object> queryInfo);

    List<DepartmentsPatientDTO> getPageList(Map<String, Object> queryInfo);

    /**
     * 根据id查询
     * @param id
     * @return
     */
    DepartmentsPatientDTO selectPatient(@Param("id") Integer id);
}
