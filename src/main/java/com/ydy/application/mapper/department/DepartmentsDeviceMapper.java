package com.ydy.application.mapper.department;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ydy.application.dto.department.DepartmentsDeviceDTO;
import com.ydy.application.entity.department.DepartmentsDevice;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
public interface DepartmentsDeviceMapper extends BaseMapper<DepartmentsDevice> {

    Integer getPageListCount(@Param("map") Map<String, Object> queryInfo);

    List<DepartmentsDevice> getPageList(@Param("map") Map<String, Object> queryInfo);

    List<DepartmentsDeviceDTO> getAll(@Param("sectionId") Integer sectionId);
}
