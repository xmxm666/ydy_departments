package com.ydy.application.service.department.impl;

import com.ydy.application.dto.department.DepartmentsRoomDTO;
import com.ydy.application.dto.department.DepartmentsSectionDTO;
import com.ydy.application.util.PageDTO;
import com.ydy.application.util.Response;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ydy.application.entity.department.DepartmentsSection;
import com.ydy.application.mapper.department.DepartmentsSectionMapper;
import com.ydy.application.service.department.DepartmentsSectionService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 科室文档 服务实现类
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
@Service
public class DepartmentsSectionServiceImpl extends ServiceImpl<DepartmentsSectionMapper, DepartmentsSection> implements DepartmentsSectionService {

    @Override
    public PageDTO selectPageList(Map<String, Object> queryInfo) {
        //总数
        int listCount = baseMapper.getPageListCount(queryInfo);
        //数据
        List<DepartmentsSectionDTO> list = baseMapper.getPageList(queryInfo);

        return new PageDTO(listCount, list);
    }

}
