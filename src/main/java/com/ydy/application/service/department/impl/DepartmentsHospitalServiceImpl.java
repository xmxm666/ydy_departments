package com.ydy.application.service.department.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ydy.application.Enum.ReturnCode;
import com.ydy.application.entity.department.DepartmentsHospital;
import com.ydy.application.entity.department.DepartmentsSection;
import com.ydy.application.mapper.department.DepartmentsHospitalMapper;
import com.ydy.application.service.department.DepartmentsHospitalService;
import com.ydy.application.service.department.DepartmentsSectionService;
import com.ydy.application.util.PageDTO;
import com.ydy.application.util.Response;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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

    @Resource
    private DepartmentsSectionService sectionService;

    @Override
    public PageDTO selectPageList(Map<String, Object> queryInfo) {
        //总数
        int listCount = baseMapper.selectCount(new EntityWrapper<DepartmentsHospital>());
        //数据
        List<DepartmentsHospital> list = baseMapper.getPageList(queryInfo);

        return new PageDTO(listCount, list);
    }

    @Override
    public Response addHospital(DepartmentsHospital hospital) {
        List<DepartmentsHospital> list = baseMapper.selectList(new EntityWrapper<DepartmentsHospital>().eq("name", hospital.getName()));
        if(list != null && list.size() > 0) {
            if(hospital.getId()==null || (hospital.getId() != null && !hospital.getId().equals(list.get(0).getId()))) {
                return Response.returnCode("3004","该医院已添加");
            }
        }
        int num = 0;
        if(hospital.getId() == null) {
            num = baseMapper.insert(hospital);
        }else {
            num = baseMapper.updateById(hospital);
        }
        if(num == 1) {
            return Response.ok();
        } else {
            return Response.returnCode(ReturnCode.SAVE_FAIL);
        }
    }

    @Override
    public Response deleteHospital(Integer id) {
        List<DepartmentsSection> sections = sectionService.selectList(new EntityWrapper<DepartmentsSection>().eq("hospital_id", id));
        if(sections != null && sections.size() > 0) {
            return Response.returnCode("3005", "删除失败：该医院已绑定科室，请先解绑");
        }
        int num = baseMapper.deleteById(id);
        if(num == 1) {
            return Response.ok();
        } else {
            return Response.returnCode(ReturnCode.SAVE_FAIL);
        }
    }
}
