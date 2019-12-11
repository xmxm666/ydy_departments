package com.ydy.application.service.role.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ydy.application.Enum.ReturnCode;
import com.ydy.application.dto.RoleDTO;
import com.ydy.application.entity.role.AuthResource;
import com.ydy.application.entity.role.AuthRole;
import com.ydy.application.entity.role.AuthRoleResource;
import com.ydy.application.entity.role.AuthUserRole;
import com.ydy.application.mapper.role.AuthResourceMapper;
import com.ydy.application.mapper.role.AuthRoleMapper;
import com.ydy.application.mapper.role.AuthRoleResourceMapper;
import com.ydy.application.mapper.role.AuthUserRoleMapper;
import com.ydy.application.service.role.RoleService;
import com.ydy.application.util.PageDTO;
import com.ydy.application.util.Response;
import org.springframework.beans.BeanUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author tomsun28
 * @date 12:28 2018/3/26
 */
@Service("RoleService")
public class RoleServiceImpl extends ServiceImpl<AuthRoleMapper, AuthRole> implements RoleService {

    @Resource
    private AuthRoleResourceMapper authRoleResourceMapper;

    @Resource
    private AuthRoleMapper authRoleMapper;

    @Resource
    private AuthUserRoleMapper userRoleMapper;

    @Resource
    private AuthResourceMapper resourceMapper;

    @Override
    public boolean authorityRoleResource(int roleId, int resourceId) throws DataAccessException {
        AuthRoleResource authRoleResource = new AuthRoleResource();
        authRoleResource.setRoleId(roleId);
        authRoleResource.setResourceId(resourceId);
        authRoleResource.setCreateTime(new Date());
        authRoleResource.setUpdateTime(new Date());
        return authRoleResourceMapper.insert(authRoleResource) == 1? Boolean.TRUE : Boolean.FALSE;
    }

    @Override
    public Response addRole(RoleDTO roleDTO) throws DataAccessException {
        String code = roleDTO.getCode();
        AuthRole data = baseMapper.selectByCode(roleDTO.getCode());
        if(data != null && !data.getId().equals(roleDTO.getId())) {
            return Response.returnCode("3004","保存失败：CODE已经存在");
        }
        AuthRole role = new AuthRole();
        BeanUtils.copyProperties(roleDTO, role);
        int num = 0;
        if(role.getId() == null) {
            role.setStatus(new Short("1"));
            role.setCreateTime(new Date());
            num = baseMapper.insert(role);
        }else {
            num = baseMapper.updateById(role);
        }
        if(num == 0) {
            return Response.returnCode(ReturnCode.SAVE_FAIL);
        }
        Integer roleId = role.getId();
        authRoleResourceMapper.delete(new EntityWrapper<AuthRoleResource>().eq("ROLE_ID", roleId));
        Integer[] resources = roleDTO.getResources();
        if(resources != null && resources.length> 0) {
            for (Integer resourceId : resources) {
                authorityRoleResource(roleId, resourceId);
            }
        }
        return Response.ok();
    }

    @Override
    public Response deleteRoleByRoleId(Integer roleId) throws DataAccessException {
        List<AuthUserRole> authUserRoles = userRoleMapper.selectByRoleId(roleId);
        if(authUserRoles != null && authUserRoles.size() > 0) {
            return Response.returnCode("3005", "删除失败，该角色已绑定用户，请先解绑！");
        }
        //删除 角色-资源 关联
        authRoleResourceMapper.deleteByUniqueKey(roleId, null);
        int num = authRoleMapper.deleteById(roleId);
        if(num == 1) {
            return Response.ok();
        } else {
            return Response.returnCode(ReturnCode.SAVE_FAIL);
        }
    }

    @Override
    public boolean deleteAuthorityRoleResource(Integer roleId, Integer resourceId) throws DataAccessException {
        int num = authRoleResourceMapper.deleteByUniqueKey(roleId, resourceId);
        return num == 1? Boolean.TRUE : Boolean.FALSE;
    }

    @Override
    public List<AuthRole> getRoleList() throws DataAccessException {
        return authRoleMapper.selectRoles();
    }

    @Override
    public Response selectPageList(Map<String, Object> queryInfo) {
        //总数
        Integer totalCount = baseMapper.getCount(queryInfo);
        //数据
        List<AuthRole> list = baseMapper.getPageList(queryInfo);
        return Response.ok(new PageDTO<>(totalCount, list));
    }

    @Override
    public Response getById(Integer id) {
        AuthRole role = baseMapper.selectById(id);
        RoleDTO roleDTO = new RoleDTO();
        BeanUtils.copyProperties(role, roleDTO);
        List<AuthResource> resources = resourceMapper.selectMenusByRoleId(id);
        Integer[] resourceId = new Integer[resources.size()];
        for(int i = 0, length = resources.size(); i < length; i++) {
            resourceId[i] = resources.get(i).getId();
        }
        roleDTO.setResources(resourceId);
        return Response.ok(roleDTO);
    }
}
