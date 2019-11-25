package com.ydy.application.service.department.impl;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.ydy.application.Enum.ReturnCode;
import com.ydy.application.dto.department.DepartmentsBedDTO;
import com.ydy.application.entity.department.*;
import com.ydy.application.filter.AuthTokenDTO;
import com.ydy.application.mapper.department.DepartmentsBedMapper;
import com.ydy.application.mapper.department.DepartmentsRBDPMapper;
import com.ydy.application.service.department.DepartmentsBedService;
import com.ydy.application.token.ContextHolder;
import com.ydy.application.util.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ydy.application.dto.department.DepartmentsRoomDTO;
import com.ydy.application.mapper.department.DepartmentsRoomMapper;
import com.ydy.application.service.department.DepartmentsRoomService;
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
@Slf4j
@Service
public class DepartmentsRoomServiceImpl extends ServiceImpl<DepartmentsRoomMapper, DepartmentsRoom> implements DepartmentsRoomService {

	@Resource
	private DepartmentsBedMapper departmentsBedMapper;
	@Resource
	private DepartmentsRBDPMapper departmentsRBDPMapper;

	@Override
	public PageDTO selectPageList(Map<String, Object> queryInfo) {
		//总数
		int departmentsRoomListCount = baseMapper.getDepartmentsRoomListCount(queryInfo);
		//数据
		List<DepartmentsRoomDTO> list = baseMapper.getDepartmentsRoomList(queryInfo);
		return new PageDTO<>(departmentsRoomListCount, list);
	}

	/**
	 * 新增/更新  病房
	 * @return
	 */
	@Transactional(rollbackFor=Exception.class)
	@Override
	public Response insertOrUpdate(DepartmentsRoomDTO roomDTO) {
		//检查是否绑定了相同设备
		if(!this.checkDevice(roomDTO.getBedList())) {
			return Response.returnCode(ReturnCode.SAVE_FAIL.getCode(), "保存失败：床位绑定了相同的设备，请检查");
		}

		AuthTokenDTO authTokenDTO = ContextHolder.get();
		Integer sectionId = authTokenDTO.getSectionId();
		try {
			Integer roomId = roomDTO.getId();
			DepartmentsRoom room = new DepartmentsRoom();
			room.setRoomName(roomDTO.getRoomName());
			if(roomId == null) {
				//新增病房
				room.setSectionId(sectionId);
				room.setIsDeleted(0);
				room.setCreatTime(new Date());
				baseMapper.insert(room);
			} else {
				//更新病房
				room.setId(roomId);
				baseMapper.updateById(room);

				departmentsRBDPMapper.deleteDevice(roomId);
			}
			if(roomDTO.getBedList() == null) {
				return Response.ok(room.getId());
			}

			for (DepartmentsBedDTO bedDTO : roomDTO.getBedList()) {
				Integer bedId = bedDTO.getId();

				//获取设备id
				DepartmentsDevice device = bedDTO.getDevice();
				Integer did = device==null?null:device.getId();
				DepartmentsBed bed = new DepartmentsBed();
				if(bedId == null) {
					//新增病床
					bed.setSectionId(sectionId);
					bed.setBedName(bedDTO.getBedName());
					bed.setType(0);
					bed.setCreatTime(new Date());
					departmentsBedMapper.insert(bed);

					//新增 病房-病床 关联表
					DepartmentsRBDP rbdp = new DepartmentsRBDP();
					rbdp.setRid(room.getId());
					rbdp.setBid(bed.getId());
					rbdp.setDid(did);
					departmentsRBDPMapper.insert(rbdp);
				}else {
					bed.setId(bedId);
					bed.setBedName(bedDTO.getBedName());
					departmentsBedMapper.updateById(bed);

					//病房-病床 关联表
					DepartmentsRBDP rbdp = new DepartmentsRBDP();
					rbdp.setRid(room.getId());
					rbdp.setBid(bedId);
					rbdp.setDid(did);
					EntityWrapper wrapper = new EntityWrapper<DepartmentsRBDP>();
					wrapper.eq("rid", rbdp.getRid()).eq("bid", rbdp.getBid());
					departmentsRBDPMapper.update(rbdp, wrapper);
				}
			}
			return Response.ok(room.getId());
		}catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly(); //手动事务处理
			return Response.returnCode(ReturnCode.SAVE_FAIL);
		}

	}

	/**
	 * 查询病房
	 * @param id
	 * @return
	 */
	@Override
	public Response selectRoom(Integer id) {
		DepartmentsRoomDTO room = baseMapper.selectRoom(id);
		return Response.ok(room);
	}


	@Transactional
	@Override
	public Response deleteRoom(Integer id) {
		//查看是否该病房有患者
		Integer patientCount = departmentsRBDPMapper.selectCount(new EntityWrapper<DepartmentsRBDP>().eq("rid", id).isNotNull("pid"));
		if(patientCount != null && patientCount != 0) {
			return Response.returnCode(ReturnCode.DELETE_FAIL.getCode(), "删除失败：该病房还有患者");
		}

		//解除病房-设备的绑定
		departmentsRBDPMapper.deleteDevice(id);

		//修改病房 isDelete状态
		DepartmentsRoom room = new DepartmentsRoom();
		room.setId(id);
		room.setIsDeleted(1);
		baseMapper.updateById(room);
		return Response.ok();
	}

	//检查是否绑定了相同设备
	public boolean checkDevice(List<DepartmentsBedDTO> bedDTOS) {
		if(bedDTOS == null || bedDTOS.size() == 0) {
			return true;
		}
		HashSet<Integer> dids = new HashSet<>();
		for (DepartmentsBedDTO bedDTO : bedDTOS) {
			DepartmentsDevice device = bedDTO.getDevice();
			Integer did = device==null?null:device.getId();
			if(did != null) {
				if(!dids.contains(did)) {
					dids.add(did);
				} else  {
					return false;
				}
			}
		}
		return true;
	}
}
