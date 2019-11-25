package com.ydy.application.service.department.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ydy.application.dto.department.DepartmentsDeviceDTO;
import com.ydy.application.entity.department.DepartmentsRBDP;
import com.ydy.application.entity.department.DepartmentsSection;
import com.ydy.application.mapper.department.DepartmentsRBDPMapper;
import com.ydy.application.util.PageDTO;
import com.ydy.application.util.Response;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ydy.application.entity.department.DepartmentsDevice;
import com.ydy.application.mapper.department.DepartmentsDeviceMapper;
import com.ydy.application.service.department.DepartmentsDeviceService;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
@Service
public class DepartmentsDeviceServiceImpl extends ServiceImpl<DepartmentsDeviceMapper, DepartmentsDevice> implements DepartmentsDeviceService {

    @Resource
    DepartmentsRBDPMapper rbdpMapper;

    @Override
    public PageDTO selectPageList(Map<String, Object> queryInfo) {
        //总数
        int listCount = baseMapper.getPageListCount(queryInfo);
        //数据
        List<DepartmentsDevice> list = baseMapper.getPageList(queryInfo);

        return new PageDTO(listCount, list);
    }

    @Override
    public Response departmentsDeviceAll(Integer sectionId) {
        List<DepartmentsDeviceDTO> deviceAll = baseMapper.getAll(sectionId);
        return Response.ok(deviceAll);
    }

    @Override
    @Transactional
    public Response deleteDevice(Integer id) {
        DepartmentsDevice departmentsDevice = new DepartmentsDevice();
        departmentsDevice.setId(id);
        departmentsDevice.setIsDeleted(1);
        baseMapper.updateById(departmentsDevice);

        //删除病房-设备关联
        rbdpMapper.deleteDeviceByDid(id);
        return Response.ok();
    }
}
