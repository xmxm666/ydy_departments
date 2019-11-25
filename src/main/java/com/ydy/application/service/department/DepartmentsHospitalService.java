package com.ydy.application.service.department;

import com.baomidou.mybatisplus.service.IService;
import com.ydy.application.entity.department.DepartmentsHospital;
import com.ydy.application.util.PageDTO;

import java.util.Map;

/**
 * <p>
 * 医院 服务类
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
public interface DepartmentsHospitalService extends IService<DepartmentsHospital> {


	PageDTO selectPageList(Map<String, Object> queryInfo);
}
