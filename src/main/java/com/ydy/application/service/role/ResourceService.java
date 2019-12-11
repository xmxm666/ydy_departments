package com.ydy.application.service.role;

import com.baomidou.mybatisplus.service.IService;
import com.ydy.application.entity.role.AuthResource;
import com.ydy.application.util.Response;

import java.util.List;
import java.util.Map;

/**
 */
public interface ResourceService extends IService<AuthResource> {

    /**
     * @param uid
     */
    Response getAuthorityMenusByUid(Integer uid);

    /**
     * @return java.util.List<com.usthe.bootshiro.domain.bo.AuthResource>
     */
    List<AuthResource> getMenus();

    /**
     * @param menu 1
     * @return java.lang.Boolean
     */
    Response addMenu(AuthResource menu);

    /**
     * @param menuId 1
     * @return java.lang.Boolean
     */
    Response deleteMenuByMenuId(Integer menuId);

    Response selectPageList(Map<String, Object> queryInfo);
}
