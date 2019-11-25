package com.ydy.application.mapper.department;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ydy.application.entity.department.DepartmentsAdmin;
import com.ydy.application.entity.department.DepartmentsHospital;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 医院表 Mapper 接口
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
public interface DepartmentsHospitalMapper extends BaseMapper<DepartmentsHospital> {

    List<DepartmentsHospital> getPageList(Map<String, Object> queryInfo);
}
