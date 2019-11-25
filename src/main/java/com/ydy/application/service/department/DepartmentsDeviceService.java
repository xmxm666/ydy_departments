package com.ydy.application.service.department;

import com.baomidou.mybatisplus.service.IService;
import com.ydy.application.entity.department.DepartmentsDevice;
import com.ydy.application.util.PageDTO;
import com.ydy.application.util.Response;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
public interface DepartmentsDeviceService extends IService<DepartmentsDevice> {

    PageDTO selectPageList(Map<String, Object> queryInfo);

    Response departmentsDeviceAll(Integer sectionId);

    Response deleteDevice(Integer id);
}
