package com.ydy.application.service.department;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.ydy.application.dto.department.DepartmentsBedDTO;
import com.ydy.application.entity.department.DepartmentsBed;
import com.ydy.application.util.PageDTO;
import com.ydy.application.util.Response;

/**
 * <p>
 *  病床  服务类
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
public interface DepartmentsBedService extends IService<DepartmentsBed> {

	/**
	 *  科室版主页面List（具体数据信息 ）
	 * @param queryInfo
	 * @return
	 */
	PageDTO getDepartmentsBedList(Map<String, Object> queryInfo);

	
	/**
	 *  分页查询病床（、基本信息）
	 * @param queryInfo
	 * @return
	 */
	PageDTO getDepartmentsBedPageList(Map<String, Object> queryInfo);

	/**
	 * 删除病床
	 * @param id
	 * @return
	 */
    Response deleteBed(Integer id);

	/**
	 * 根据病房id查询病床
	 * @param rid
	 * @return
	 */
	Response getBedByRoomId(Integer rid);
}
