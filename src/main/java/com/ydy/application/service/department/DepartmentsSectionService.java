package com.ydy.application.service.department;

import com.baomidou.mybatisplus.service.IService;
import com.ydy.application.entity.department.DepartmentsSection;
import com.ydy.application.util.PageDTO;
import com.ydy.application.util.Response;

import java.util.Map;

/**
 * <p>
 * 科室文档 服务类
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
public interface DepartmentsSectionService extends IService<DepartmentsSection> {

    PageDTO selectPageList(Map<String, Object> queryInfo);

    Response addSection(DepartmentsSection departmentsSection);

    Response deleteSection(Integer sectionId);
}
