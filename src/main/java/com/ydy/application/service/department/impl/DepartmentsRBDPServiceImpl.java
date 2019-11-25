package com.ydy.application.service.department.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ydy.application.dto.department.DepartmentsRoomDTO;
import com.ydy.application.entity.department.DepartmentsRBDP;
import com.ydy.application.entity.department.DepartmentsRoom;
import com.ydy.application.filter.AuthTokenDTO;
import com.ydy.application.mapper.department.DepartmentsRBDPMapper;
import com.ydy.application.mapper.department.DepartmentsRoomMapper;
import com.ydy.application.service.department.DepartmentsBedService;
import com.ydy.application.service.department.DepartmentsRBDPService;
import com.ydy.application.service.department.DepartmentsRoomService;
import com.ydy.application.token.ContextHolder;
import com.ydy.application.util.PageDTO;
import com.ydy.application.util.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
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
public class DepartmentsRBDPServiceImpl extends ServiceImpl<DepartmentsRBDPMapper, DepartmentsRBDP> implements DepartmentsRBDPService {

}
