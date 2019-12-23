package com.ydy.application.service.department;

import com.baomidou.mybatisplus.service.IService;
import com.ydy.application.entity.department.DepartmentsData;
import com.ydy.application.util.Response;

/**
 * <p>
 * 历史数据表 服务类
 * </p>
 *
 * @author zqx123
 * @since 2019-12-13
 */
public interface DepartmentsDataService extends IService<DepartmentsData> {

    //生命体征监测全部列表
    public Response dataList(Integer sectionId);

    //模拟设备向服务器发送数据
    public void deivceSendData();

    //  模拟向客户端发送数据
    public void sendClient();


}
