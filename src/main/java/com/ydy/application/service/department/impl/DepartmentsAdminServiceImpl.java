package com.ydy.application.service.department.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ydy.application.Enum.PLAT_TYPE;
import com.ydy.application.Enum.ReturnCode;
import com.ydy.application.dto.department.DepartmentsAdminDTO;
import com.ydy.application.entity.department.DepartmentsAdmin;
import com.ydy.application.entity.role.AuthUserRole;
import com.ydy.application.mapper.department.DepartmentsAdminMapper;
import com.ydy.application.mapper.role.AuthRoleMapper;
import com.ydy.application.mapper.role.AuthUserRoleMapper;
import com.ydy.application.service.department.DepartmentsAdminService;
import com.ydy.application.util.AuthTokenUtil;
import com.ydy.application.util.Md5HexMethod;
import com.ydy.application.util.PageDTO;
import com.ydy.application.util.Response;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Resource
	private AuthRoleMapper roleMapper;

	@Resource
	private AuthUserRoleMapper userRoleMapper;

	@Transactional
	@Override
	public Response insertUpdate(DepartmentsAdminDTO dto) {
		DepartmentsAdmin departmentsAdmin = new DepartmentsAdmin();
		BeanUtils.copyProperties(dto, departmentsAdmin);
		List<DepartmentsAdmin> adminList = baseMapper.selectList(new EntityWrapper<DepartmentsAdmin>()
				.eq("username", departmentsAdmin.getUsername())
				.eq("is_deleted", 0));
		if(adminList != null && adminList.size() > 0) {
			if(departmentsAdmin.getId()==null || (departmentsAdmin.getId() != null && !departmentsAdmin.getId().equals(adminList.get(0).getId()))) {
				return Response.returnCode("3004","保存失败：用户名已存在！");
			}
		}

		Integer[] role = dto.getRole();
		if(role == null || role.length == 0) {
			return Response.returnCode("3004","保存失败：请选择角色！");
		}

		Integer adminId = departmentsAdmin.getId();
		if(adminId == null) {
			String password = departmentsAdmin.getPassword();
			if(StringUtils.isEmpty(password)) {
				//如果没有设置密码，默认为：123456
				password = "123456";
			}
			departmentsAdmin.setPassword(Md5HexMethod.MD5Encode(password));
			departmentsAdmin.setCreatTime(new Date());
			departmentsAdmin.setCreatTime(new Date());
			departmentsAdmin.setIsDeleted(0);
			baseMapper.insert(departmentsAdmin);
		} else {
			String password = departmentsAdmin.getPassword();
			if(!StringUtils.isEmpty(password)) {
				departmentsAdmin.setPassword(Md5HexMethod.MD5Encode(password));
			}
			baseMapper.updateById(departmentsAdmin);
		}

		adminId = departmentsAdmin.getId();
		userRoleMapper.delete(new EntityWrapper<AuthUserRole>().eq("USER_ID", adminId));
		for (Integer roleId : role) {
			authorityUserRole(adminId, roleId);
		}

		return Response.ok();
	}

	public boolean authorityUserRole(Integer uid, Integer roleId){
        AuthUserRole authUserRole = new AuthUserRole();
        authUserRole.setRoleId(roleId);
        authUserRole.setUserId(uid);
        authUserRole.setCreateTime(new Date());
        authUserRole.setUpdateTime(new Date());
        return userRoleMapper.insert(authUserRole) == 1? Boolean.TRUE :Boolean.FALSE;
    }

	@Override
	public Response departmentsAdminLogin(DepartmentsAdmin admin) {
		EntityWrapper<DepartmentsAdmin> wrapper = new EntityWrapper<DepartmentsAdmin>();
		wrapper.eq("username", admin.getUsername()).and()
				.eq("password", Md5HexMethod.MD5Encode(admin.getPassword())).and()
				.eq("is_deleted", 0);
		DepartmentsAdmin departmentsAdmin = this.selectOne(wrapper);
		if (null != departmentsAdmin) {
			String token = createToken(departmentsAdmin);

			HashMap<String, Object> map = new HashMap();
			map.put("token", token);
			map.put("id", departmentsAdmin.getSectionId());
			return Response.ok(map);
		}
		return Response.returnCode(ReturnCode.LOGIN_FAIL);
	}

	private String createToken(DepartmentsAdmin departmentsAdmin) {
		String roles = roleMapper.selectUserRoles(departmentsAdmin.getId());

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("platType", PLAT_TYPE.DEPARTMENT_ADMIN.getCode());
		map.put("userId", departmentsAdmin.getId());
		map.put("username", departmentsAdmin.getUsername());
		map.put("loginTime", new Date().getTime()+"");
		map.put("section_id" , departmentsAdmin.getSectionId());
		map.put("roles", roles);
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
		Integer[] role = userRoleMapper.selectByUserId(id);
		departmentsAdminDTO.setRole(role);
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
