package com.ydy.application.mapper.department;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ydy.application.dto.department.DepartmentsDataDTO;
import com.ydy.application.dto.department.DepartmentsPatientDataDTO;
import com.ydy.application.entity.department.DepartmentsData;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 历史数据表 Mapper 接口
 * </p>
 *
 * @author zqx123
 * @since 2019-12-13
 */
public interface DepartmentsDataMapper extends BaseMapper<DepartmentsData> {

    //获取当前科室下所有设备的最后一条数据
    List<DepartmentsDataDTO> slectLastData(@Param("sectionId") Integer sectionId);

    DepartmentsDataDTO selectLastDataByMac(@Param("mac") String mac);

    //
    List<DepartmentsData> getPatientData(DepartmentsPatientDataDTO patientData);
}
