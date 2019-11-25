package com.ydy.application.service.department.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ydy.application.entity.department.DepartmentsHospital;
import com.ydy.application.mapper.department.DepartmentsHospitalMapper;
import com.ydy.application.service.department.DepartmentsHospitalService;
import com.ydy.application.util.PageDTO;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 医院 表 服务实现类
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
@Service
public class DepartmentsHospitalServiceImpl extends ServiceImpl<DepartmentsHospitalMapper, DepartmentsHospital> implements DepartmentsHospitalService {


    @Override
    public PageDTO selectPageList(Map<String, Object> queryInfo) {
        //总数
        int listCount = baseMapper.selectCount(new EntityWrapper<DepartmentsHospital>());
        //数据
        List<DepartmentsHospital> list = baseMapper.getPageList(queryInfo);

        return new PageDTO(listCount, list);
    }
}
