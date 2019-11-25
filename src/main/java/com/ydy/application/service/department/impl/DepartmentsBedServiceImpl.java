package com.ydy.application.service.department.impl;

import java.util.*;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.ydy.application.Enum.ReturnCode;
import com.ydy.application.dto.department.DepartmentsBedDetailDTO;
import com.ydy.application.entity.department.DepartmentsRBDP;
import com.ydy.application.mapper.department.DepartmentsRBDPMapper;
import com.ydy.application.service.department.DepartmentsRBDPService;
import com.ydy.application.util.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ydy.application.dto.department.DepartmentsBedDTO;
import com.ydy.application.entity.department.DepartmentsBed;
import com.ydy.application.mapper.department.DepartmentsBedMapper;
import com.ydy.application.service.department.DepartmentsBedService;
import com.ydy.application.util.PageDTO;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import javax.annotation.Resource;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
@Service
public class DepartmentsBedServiceImpl extends ServiceImpl<DepartmentsBedMapper, DepartmentsBed> implements DepartmentsBedService {


	@Resource
	private DepartmentsRBDPMapper departmentsRBDPMapper;

	@Override
	public PageDTO getDepartmentsBedList(Map<String, Object> queryInfo) {
		PageDTO<DepartmentsBedDTO> pageDto = this.getDepartmentsBedPageList(queryInfo);
		//查询详细信息
		return pageDto;
	}
	
	@Override
	public PageDTO<DepartmentsBedDTO> getDepartmentsBedPageList(Map<String, Object> queryInfo) {
		List<DepartmentsBedDTO> list = baseMapper.getDepartmentsBedPageList(queryInfo);
		int count = baseMapper.getDepartmentsBedPageListCount(queryInfo);
		return null;
	}

	/**
	 * 删除病床
	 * @param id
	 * @return
	 */
	@Transactional
	@Override
	public Response deleteBed(Integer id) {
		//检查该病床是否有患者
		Integer patientCount = departmentsRBDPMapper.selectCount(new EntityWrapper<DepartmentsRBDP>().eq("bid", id).isNotNull("pid"));
		if(patientCount != null && patientCount != 0) {
			return Response.returnCode(ReturnCode.DELETE_FAIL.getCode(), "删除失败：该病床还有患者");
		}

		//删除 病房-病床 关联
		departmentsRBDPMapper.delete(new EntityWrapper<DepartmentsRBDP>().eq("bid", id));

		//删除病床
		baseMapper.deleteById(id);
		return Response.ok();
	}

	/**
	 * 根据病房id查询病床
	 * @param rid
	 * @return
	 */
	@Override
	public Response getBedByRoomId(Integer rid) {
		List<DepartmentsBedDTO> bedList = baseMapper.getBedByRoomId(rid);
		return Response.ok(bedList);
	}
}
