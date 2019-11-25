package com.ydy.application.service.department;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.ydy.application.dto.department.DepartmentsRoomDTO;
import com.ydy.application.entity.department.DepartmentsRoom;
import com.ydy.application.util.PageDTO;
import com.ydy.application.util.Response;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
public interface DepartmentsRoomService extends IService<DepartmentsRoom> {

	/**
	 * 分页查询病房
	 * @param queryInfo
	 * @return
	 */
	PageDTO selectPageList(Map<String, Object> queryInfo);

	/**
	 * 新增/更新  病房
	 * @return
	 */
	Response insertOrUpdate(DepartmentsRoomDTO roomDTO);

	/**
	 * 查询病房
	 * @param id
	 * @return
	 */
	Response selectRoom(Integer id);

	/**
	 * 根据id删除对象
	 * @param id
	 * @return
	 */
	Response deleteRoom(Integer id);
}
