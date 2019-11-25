package com.ydy.application.mapper.department;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ydy.application.dto.department.DepartmentsRoomDTO;
import com.ydy.application.entity.department.DepartmentsRBDP;
import com.ydy.application.entity.department.DepartmentsRoom;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
public interface DepartmentsRBDPMapper extends BaseMapper<DepartmentsRBDP> {

    //添加病床-患者 关联
    void setPatient(DepartmentsRBDP rbdp);

    //解除病房-设备的绑定
    void deleteDevice(@Param("rid") Integer roomId);

    //解绑  病床-患者 关联
    void deletePatient(@Param("pid") Integer id);

    //解除病房-设备的绑定(删除设备)
    void deleteDeviceByDid(@Param("did")Integer id);
}
