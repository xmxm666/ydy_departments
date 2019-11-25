package com.ydy.application.mapper.department;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ydy.application.dto.department.DepartmentsSectionDTO;
import com.ydy.application.entity.department.DepartmentsSection;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 科室文档 Mapper 接口
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
public interface DepartmentsSectionMapper extends BaseMapper<DepartmentsSection> {
    
    Integer getPageListCount(@Param("map")Map<String, Object> queryInfo);

    List<DepartmentsSectionDTO> getPageList(@Param("map")Map<String, Object> queryInfo);

}
