package com.ydy.application.service.department;

import com.baomidou.mybatisplus.service.IService;
import com.ydy.application.dto.department.DepartmentsAdminDTO;
import com.ydy.application.entity.department.DepartmentsAdmin;
import com.ydy.application.util.PageDTO;
import com.ydy.application.util.Response;

import java.util.Map;

/**
 * <p>
 * 医生表 服务类
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
public interface DepartmentsAdminService extends IService<DepartmentsAdmin> {


	Response insertUpdate(DepartmentsAdminDTO departmentsAdmin);

	/**
	 * 医生登录
	 * @param admin
	 * @return
	 */
	Response departmentsAdminLogin(DepartmentsAdmin admin);

	/**
	 * 根据id查找admin 带科室
	 * @param id
	 * @return
	 */
	Response selectAdmin(Integer id);

	PageDTO selectPageList(Map<String, Object> queryInfo);
}
