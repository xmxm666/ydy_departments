package com.ydy.application.service.role;

import com.baomidou.mybatisplus.service.IService;
import com.ydy.application.dto.RoleDTO;
import com.ydy.application.entity.role.AuthRole;
import com.ydy.application.util.Response;

import java.util.List;
import java.util.Map;

/**
 */
public interface RoleService extends IService<AuthRole> {

    /**
     * description TODO
     *
     * @param roleId 1
     * @param resourceId 2
     * @return boolean
     */
    boolean authorityRoleResource(int roleId, int resourceId);

    /**
     * @param role 1
     * @return boolean
     */
    Response addRole(RoleDTO role);

    /**
     * @param roleId 1
     * @return boolean
     */
    Response deleteRoleByRoleId(Integer roleId);

    /**
     * description TODO
     *
     * @param roleId 1
     * @param resourceId 2
     * @return boolean
     */
    boolean deleteAuthorityRoleResource(Integer roleId, Integer resourceId);

    /**
     * description TODO
     *
     * @return java.util.List<AuthRole>
     */
    List<AuthRole> getRoleList();

    Response selectPageList(Map<String, Object> queryInfo);

    Response getById(Integer id);
}
