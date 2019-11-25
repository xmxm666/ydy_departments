package com.ydy.application.mapper.department;

import java.util.List;
import java.util.Map;

import com.ydy.application.dto.department.DepartmentsBedDetailDTO;
import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ydy.application.dto.department.DepartmentsBedDTO;
import com.ydy.application.entity.department.DepartmentsBed;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
public interface DepartmentsBedMapper extends BaseMapper<DepartmentsBed> {

	List<DepartmentsBedDTO> getDepartmentsBedPageList(@Param("map")Map<String, Object> queryInfo);

	int getDepartmentsBedPageListCount(@Param("map")Map<String, Object> queryInfo);

	List<DepartmentsBedDTO> getBedByRoomId(@Param("rid") Integer rid);

}
