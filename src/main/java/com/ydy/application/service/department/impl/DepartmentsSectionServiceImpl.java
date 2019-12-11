package com.ydy.application.service.department.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ydy.application.dto.department.DepartmentsSectionDTO;
import com.ydy.application.entity.department.DepartmentsAdmin;
import com.ydy.application.entity.department.DepartmentsSection;
import com.ydy.application.mapper.department.DepartmentsAdminMapper;
import com.ydy.application.mapper.department.DepartmentsSectionMapper;
import com.ydy.application.service.department.DepartmentsSectionService;
import com.ydy.application.util.PageDTO;
import com.ydy.application.util.Response;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
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

    @Resource
    private DepartmentsAdminMapper adminMapper;

    @Override
    public PageDTO selectPageList(Map<String, Object> queryInfo) {
        //总数
        int listCount = baseMapper.getPageListCount(queryInfo);
        //数据
        List<DepartmentsSectionDTO> list = baseMapper.getPageList(queryInfo);

        return new PageDTO(listCount, list);
    }

    @Override
    public Response addSection(DepartmentsSection section) {
        List<DepartmentsSection> list = baseMapper.selectList(new EntityWrapper<DepartmentsSection>()
                .eq("name", section.getName())
                .eq("is_deleted", "0"));
        if(list != null && list.size() > 0) {
            if(section.getId()==null || (section.getId() != null && !section.getId().equals(list.get(0).getId()))) {
                return Response.returnCode("3004","该医院已添加" + section.getName());
            }
        }
        if(section.getId() == null) {
            section.setCreatTime(new Date());
            section.setIsDeleted(0);
            baseMapper.insert(section);
        }else {
            baseMapper.updateById(section);
        }
        return Response.ok();
    }

    @Override
    public Response deleteSection(Integer sectionId) {
        List<DepartmentsAdmin> adminList = adminMapper.selectList(new EntityWrapper<DepartmentsAdmin>().eq("section_id", sectionId));
        if(adminList != null && adminList.size() > 0) {
            return Response.returnCode("3006", "删除失败：该科室以绑定医生，请先解绑！");
        }
        DepartmentsSection section = new DepartmentsSection();
        section.setId(sectionId);
        section.setIsDeleted(1);
        baseMapper.updateById(section);
        return Response.ok();
    }

}
