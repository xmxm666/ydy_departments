package com.ydy.application.mapper.department;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ydy.application.dto.department.DepartmentsRoomDTO;
import com.ydy.application.entity.department.DepartmentsRoom;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
public interface DepartmentsRoomMapper extends BaseMapper<DepartmentsRoom> {

	List<DepartmentsRoomDTO> getDepartmentsRoomList(@Param("map")Map<String, Object> queryInfo);

	Integer getDepartmentsRoomListCount(@Param("map")Map<String, Object> queryInfo);

	/**
	 * 查询病房
	 * @param id
	 * @return DepartmentsRoomDTO DepartmentsBedDTO
	 */
	DepartmentsRoomDTO selectRoom(@Param("id")Integer id);

}
