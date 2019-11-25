package com.ydy.application.service.department;

import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.service.IService;
import com.ydy.application.dto.department.DepartMentLoginDTO;
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


	Response insertUpdate(DepartmentsAdmin departmentsAdmin);

	/**
	 * 医生登录
	 * @param req
	 * @param resp
	 * @return
	 */
	Response departmentsAdminLogin(DepartmentsAdmin req, HttpServletResponse resp);

	/**
	 * 根据id查找admin 带科室
	 * @param id
	 * @return
	 */
	Response selectAdmin(Integer id);

	PageDTO selectPageList(Map<String, Object> queryInfo);
}
