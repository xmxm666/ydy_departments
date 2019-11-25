package com.ydy.application.service.department.impl;

import com.ydy.application.Enum.ReturnCode;
import com.ydy.application.dto.department.DepartmentsPatientDTO;
import com.ydy.application.dto.department.DepartmentsRoomDTO;
import com.ydy.application.entity.department.DepartmentsRBDP;
import com.ydy.application.entity.department.DepartmentsSection;
import com.ydy.application.filter.AuthTokenDTO;
import com.ydy.application.mapper.department.DepartmentsRBDPMapper;
import com.ydy.application.token.ContextHolder;
import com.ydy.application.util.PageDTO;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ydy.application.entity.department.DepartmentsPatient;
import com.ydy.application.mapper.department.DepartmentsPatientMapper;
import com.ydy.application.service.department.DepartmentsPatientService;
import com.ydy.application.util.Response;

import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.validation.constraints.NotBlank;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 子用户表 服务实现类
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
@Service
@Slf4j
public class DepartmentsPatientServiceImpl extends ServiceImpl<DepartmentsPatientMapper, DepartmentsPatient> implements DepartmentsPatientService {

	@Resource
	private DepartmentsRBDPMapper departmentsRBDPMapper;

	@Override
	public PageDTO selectPageList(Map<String, Object> queryInfo) {
		//总数
		int listCount = baseMapper.getPageListCount(queryInfo);
		//数据
		List<DepartmentsPatientDTO> list = baseMapper.getPageList(queryInfo);

		return new PageDTO(listCount, list);
	}

	/**
	 * 病人出院
	 * @param id
	 * @return
	 */
	@Override
	@Transactional
	public Response patientOutHospital(Integer id) {
		//解绑  病床-患者 关联
		departmentsRBDPMapper.deletePatient(id);

		//设置为历史病人
		DepartmentsPatient departmentsPatient = new DepartmentsPatient();
		departmentsPatient.setId(id);
		departmentsPatient.setHistory(1);
		baseMapper.updateById(departmentsPatient);
		return Response.ok();
	}

	/**
	 * 新增/更新病人
	 * @param patientDTO
	 * @return
	 */
	@Transactional
	@Override
	public Response insertOrUpdate(DepartmentsPatientDTO patientDTO) {
		if(patientDTO.getRid() == null) {
			return Response.returnCode(ReturnCode.SAVE_FAIL.getCode(), "保存失败：请选择病房");
		}
		if(patientDTO.getBid() == null) {
			return Response.returnCode(ReturnCode.SAVE_FAIL.getCode(), "保存失败：请选择病床");
		}
		//查看病房-病床是否有患者
		DepartmentsRBDP rbdp = new DepartmentsRBDP();
		rbdp.setRid(patientDTO.getRid());
		rbdp.setBid(patientDTO.getBid());
		DepartmentsRBDP rbdp1 = departmentsRBDPMapper.selectOne(rbdp);
		if(rbdp1 == null) {
			return Response.returnCode(ReturnCode.SAVE_FAIL.getCode(), "保存失败：病房与病床不匹配");
		}

		AuthTokenDTO authTokenDTO = ContextHolder.get();
		Integer sectionId = authTokenDTO.getSectionId();

		Integer pid = patientDTO.getId();
		DepartmentsPatient patient = new DepartmentsPatient();
		patient.setCaseno(patientDTO.getCaseno());
		patient.setName(patientDTO.getName());
		patient.setSex(patientDTO.getSex());
		patient.setAge(patientDTO.getAge());
		patient.setDoctor(patientDTO.getDoctor());
		if(pid == null) {
			if(rbdp1.getPid() != null) {
				return Response.returnCode(ReturnCode.SAVE_FAIL.getCode(), "保存失败：该病床已有患者");
			}
			//新增病人
			patient.setSectionId(sectionId);
			patient.setCreatTime(new Date());
			patient.setHistory(0);
			baseMapper.insert(patient);
		} else {
			if(rbdp1.getPid() != null && rbdp1.getPid() != pid) {
				return Response.returnCode(ReturnCode.SAVE_FAIL.getCode(), "保存失败：该病床已有患者");
			}
			patient.setId(pid);
			baseMapper.updateById(patient);
		}

		//添加病床-患者 关联
		rbdp.setPid(patient.getId());
		departmentsRBDPMapper.setPatient(rbdp);

		return Response.ok();
	}

	/**
	 * 查询
	 * @param id
	 * @return
	 */
	@Override
	public Response selectPatient(Integer id) {
		DepartmentsPatientDTO patient = baseMapper.selectPatient(id);
		return Response.ok(patient);
	}

}
