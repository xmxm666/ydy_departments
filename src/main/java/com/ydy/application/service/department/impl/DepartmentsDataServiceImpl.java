package com.ydy.application.service.department.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.farsunset.cim.sdk.server.model.Message;
import com.ydy.application.cim.push.DefaultMessagePusher;
import com.ydy.application.dto.department.DepartmentsDataDTO;
import com.ydy.application.dto.department.DepartmentsPatientDTO;
import com.ydy.application.entity.department.DepartmentsData;
import com.ydy.application.entity.department.DepartmentsSection;
import com.ydy.application.mapper.department.DepartmentsDataMapper;
import com.ydy.application.mapper.department.DepartmentsPatientMapper;
import com.ydy.application.mapper.department.DepartmentsRBDPMapper;
import com.ydy.application.service.department.DepartmentsDataService;
import com.ydy.application.service.department.DepartmentsSectionService;
import com.ydy.application.util.Constants;
import com.ydy.application.util.JsonUtil;
import com.ydy.application.util.RedisUtil;
import com.ydy.application.util.Response;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 历史数据表 服务实现类
 * </p>
 *
 * @author zqx123
 * @since 2019-12-13
 */
@Service
public class DepartmentsDataServiceImpl extends ServiceImpl<DepartmentsDataMapper, DepartmentsData> implements DepartmentsDataService {

    @Resource
    private RedisUtil redisUtil;

    @Resource
    private DepartmentsRBDPMapper rbdpMapper;

    @Resource
    private DepartmentsSectionService sectionService;

    @Resource
    private DefaultMessagePusher defaultMessagePusher;

    @Resource
    private DepartmentsPatientMapper patientMapper;

    @Override
    public Response dataList(Integer sectionId) {
        Map<String,Object> queryInfo = new HashMap<>();
        queryInfo.put("sectionId", sectionId);
        List<DepartmentsPatientDTO> patientList = patientMapper.getPageList(queryInfo);
        //获取当前科室下所有设备的最后一条数据
        List<DepartmentsDataDTO> dataList = baseMapper.slectLastData(sectionId);
        for (DepartmentsPatientDTO patient : patientList) {
            if(patient.getDid() == null) {
                continue;
            }
            for (DepartmentsDataDTO data : dataList) {
                if(patient.getDid().compareTo(data.getDid()) == 0) {
                    patient.setPatientData(data);
                    break;
                }
            }
        }
        return Response.ok(patientList);
    }

    //模拟设备向服务器发送数据
    @Override
    public void deivceSendData() {
        List<String> macs = rbdpMapper.getPatientMac();
        if(macs == null || macs.size() == 0) {
            return;
        }
        //向数据库中批量插入spo2，hr， rr，nibp
        for (String mac : macs) {
            DepartmentsData data= new DepartmentsData();
            data.setMac(mac);

            //spo2血氧饱和度   [95-100)之间     保留2位小数
            BigDecimal spo2 = new BigDecimal(String.valueOf(Math.random() * 5 + 95)).setScale(2, BigDecimal.ROUND_DOWN);
            data.setSpo2(spo2);

            //hr    心率，心电图  60-100
            BigDecimal hr = new BigDecimal(String.valueOf(Math.random() * 40 + 60)).setScale(0, BigDecimal.ROUND_DOWN);
            data.setHr(hr);

            //rr    呼吸  16-20
            BigDecimal rr = new BigDecimal(String.valueOf(Math.random() * 4 + 16)).setScale(0, BigDecimal.ROUND_DOWN);
            data.setRr(rr);

            //nibp  血压
            //sbp   90-140
            BigDecimal sbp = new BigDecimal(String.valueOf(Math.random() * 50 + 90)).setScale(0, BigDecimal.ROUND_DOWN);
            //dbp   60-90
            BigDecimal dbp = new BigDecimal(String.valueOf(Math.random() * 30 + 60)).setScale(0, BigDecimal.ROUND_DOWN);
            data.setSbp(sbp);
            data.setDbp(dbp);

            data.setCreatTime(new Date());
            baseMapper.insert(data);
        }

    }

    @Override
    public void sendClient() {
        List<DepartmentsSection> sections = sectionService.selectList(new EntityWrapper<DepartmentsSection>().eq("is_deleted", 0));
        if(sections == null || sections.size() == 0) {
            return;
        }
        for (DepartmentsSection section : sections) {
            //获取该科室所有连接用户
            Map<Object, Object> hmget = redisUtil.hmget(Constants.CIM_SECTION + section.getId());
            if(hmget != null && hmget.size() > 0) {
                //该科室有连接用户时
                //获取当前科室下所有设备的最后一条数据
                List<DepartmentsDataDTO> dataList = baseMapper.slectLastData(section.getId());
                for (Map.Entry<Object, Object> map : hmget.entrySet()) {
                    Message message = new Message();
                    message.setAction(Constants.ACTION_NORMAL);
                    message.setSender("system");
                    message.setReceiver(map.getKey().toString());
                    message.setTimestamp(new Date().getTime());

                    message.setContent(JsonUtil.list2Json(dataList));
                    defaultMessagePusher.push(message);
                }

            }

        }

    }
}
