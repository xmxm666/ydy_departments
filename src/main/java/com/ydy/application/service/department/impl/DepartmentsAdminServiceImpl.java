package com.ydy.application.service.department.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.ydy.application.Enum.ReturnCode;
import com.ydy.application.dto.department.DepartmentsAdminDTO;
import com.ydy.application.util.Md5HexMethod;
import com.ydy.application.util.PageDTO;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ydy.application.Enum.PLAT_TYPE;
import com.ydy.application.entity.department.DepartmentsAdmin;
import com.ydy.application.mapper.department.DepartmentsAdminMapper;
import com.ydy.application.service.department.DepartmentsAdminService;
import com.ydy.application.util.AuthTokenUtil;
import com.ydy.application.util.Response;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 医生表 服务实现类
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
@Service
public class DepartmentsAdminServiceImpl extends ServiceImpl<DepartmentsAdminMapper, DepartmentsAdmin> implements DepartmentsAdminService {

	@Transactional
	@Override
	public Response insertUpdate(DepartmentsAdmin departmentsAdmin) {
		Integer adminId = departmentsAdmin.getId();
		if(departmentsAdmin.getRole() == null) {
			return Response.returnCode(ReturnCode.SAVE_FAIL_ROLE);
		}
		// 医生的科室不能为空
		if(departmentsAdmin.getRole().equals(1) && departmentsAdmin.getSectionId() == null) {
			return Response.returnCode(ReturnCode.SAVE_FAIL_SECTION);
		}
		String password = Md5HexMethod.MD5Encode(departmentsAdmin.getPassword());
		departmentsAdmin.setPassword(password);
		if(adminId == null) {
			departmentsAdmin.setCreatTime(new Date());
			baseMapper.insert(departmentsAdmin);
		} else {
			baseMapper.updateById(departmentsAdmin);
		}
		return Response.ok();
	}

	@Override
	public Response departmentsAdminLogin(DepartmentsAdmin admin) {
		EntityWrapper<DepartmentsAdmin> wrapper = new EntityWrapper<DepartmentsAdmin>();
		wrapper.eq("username", admin.getUsername()).and().eq("password", Md5HexMethod.MD5Encode(admin.getPassword()));
		DepartmentsAdmin departmentsAdmin = this.selectOne(wrapper);
		if (null != departmentsAdmin) {
			String token = createToken(departmentsAdmin);
			/*resp.addHeader("token", token);*/

			HashMap<String, Object> map = new HashMap();
			map.put("token", token);
			map.put("id", departmentsAdmin.getId());
			map.put("role", departmentsAdmin.getRole());
			return Response.ok(map);
		}
		return Response.returnCode(ReturnCode.LOGIN_FAIL);
	}

	private String createToken(DepartmentsAdmin departmentsAdmin) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("platType", PLAT_TYPE.DEPARTMENT_ADMIN.getCode());
		map.put("userId", departmentsAdmin.getId());
		map.put("accountNo", departmentsAdmin.getUsername());
		map.put("username", departmentsAdmin.getUsername());
		map.put("registerTime", departmentsAdmin.getCreatTime().getTime());
		map.put("section_id" , departmentsAdmin.getSectionId());
		map.put("role" , departmentsAdmin.getRole());
		String token = AuthTokenUtil.createAuthToken(map);
		return token;
	}

	/**
	 * 根据id查找admin 带科室
	 * @param id
	 * @return
	 */
	@Override
	public Response selectAdmin(Integer id) {
		DepartmentsAdminDTO departmentsAdminDTO = baseMapper.selectAdmin(id);
		return Response.ok(departmentsAdminDTO);
	}

	@Override
	public PageDTO selectPageList(Map<String, Object> queryInfo) {
		//总数
		int listCount = baseMapper.getPageListCount(queryInfo);
		//数据
		List<DepartmentsAdminDTO> list = baseMapper.getPageList(queryInfo);

		return new PageDTO(listCount, list);
	}

}
