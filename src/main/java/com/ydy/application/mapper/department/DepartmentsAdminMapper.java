package com.ydy.application.mapper.department;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ydy.application.dto.department.DepartmentsAdminDTO;
import com.ydy.application.dto.department.DepartmentsSectionDTO;
import com.ydy.application.entity.department.DepartmentsAdmin;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 医生表 Mapper 接口
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
public interface DepartmentsAdminMapper extends BaseMapper<DepartmentsAdmin> {

    DepartmentsAdminDTO selectAdmin(@Param("id") Integer id);

    Integer getPageListCount(Map<String, Object> queryInfo);

    List<DepartmentsAdminDTO> getPageList(Map<String, Object> queryInfo);
}
