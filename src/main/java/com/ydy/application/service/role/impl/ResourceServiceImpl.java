package com.ydy.application.service.role.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ydy.application.Enum.ReturnCode;
import com.ydy.application.dto.MenuTreeNode;
import com.ydy.application.entity.role.AuthResource;
import com.ydy.application.mapper.role.AuthResourceMapper;
import com.ydy.application.service.role.ResourceService;
import com.ydy.application.util.PageDTO;
import com.ydy.application.util.Response;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.*;

/**
 *
 */
@Service("ResourceService")
public class ResourceServiceImpl extends ServiceImpl<AuthResourceMapper, AuthResource> implements ResourceService {

    private static final Logger LOGGER = LoggerFactory.getLogger(ResourceServiceImpl.class);

    @Resource
    private AuthResourceMapper authResourceMapper;

    @Override
    public Response getAuthorityMenusByUid(Integer uid) throws DataAccessException {
        HashMap<Integer, MenuTreeNode> nodeMap = new HashMap<>();

        //获取所有权限资源
        List<AuthResource> resources = authResourceMapper.selectAuthorityMenusByUid(uid);
        for (AuthResource resource : resources) {
            boolean hasParent = nodeMap.containsKey(resource.getParentId());
            if(!hasParent) {
                AuthResource parent = baseMapper.selectById(resource.getParentId());
                MenuTreeNode parentNode = new MenuTreeNode();
                BeanUtils.copyProperties(parent, parentNode);
                parentNode.addChilren(resource);
                nodeMap.put(resource.getParentId(), parentNode);
            } else {
                MenuTreeNode parentNode = nodeMap.get(resource.getParentId());
                parentNode.addChilren(resource);
            }
        }
        return Response.ok(nodeMap.values());
    }

    @Override
    public List<AuthResource> getMenus() throws DataAccessException {
        return authResourceMapper.selectMenus();
    }

    @Override
    public Response addMenu(AuthResource menu) throws DataAccessException {
        int type = menu.getType().intValue();
        if(type == 1) {
            if(StringUtils.isEmpty(menu.getIcon())) {
                return Response.returnCode("3004", "ICON不能为空");
            }
            if(StringUtils.isEmpty(menu.getRouter())) {
                return Response.returnCode("3004", "前端路由不能为空");
            }
            menu.setParentId(-1);
        } else if(type == 2 || type == 3) {
            if(StringUtils.isEmpty(menu.getUri())) {
                return Response.returnCode("3004", "URI不能为空");
            }
            if(StringUtils.isEmpty(menu.getMethod())) {
                return Response.returnCode("3004", "方法不能为空");
            }
            if(menu.getParentId() == null) {
                return Response.returnCode("3004", "父ID不能为空");
            }
            if(type == 2 && StringUtils.isEmpty(menu.getRouter())) {
                return Response.returnCode("3004", "前端路由不能为空");
            }
        }else {
            return Response.returnCode("3004", "资源类型不存在");
        }
        Integer num = 0;
        if(menu.getId() == null) {
            menu.setStatus(new Short("1"));
            menu.setCreateTime(new Date());
            num = authResourceMapper.insert(menu);
        } else {
            num = authResourceMapper.updateByPrimaryKey(menu);
        }
        if(num == 1) {
            return Response.ok();
        } else {
            return Response.returnCode(ReturnCode.SAVE_FAIL);
        }
    }

    @Override
    public Response deleteMenuByMenuId(Integer menuId) throws DataAccessException {
        Integer count = authResourceMapper.getParendId(menuId);
        if(count > 0) {
            return Response.returnCode("3005","删除失败：请先删除子资源！");
        }
        Integer num = authResourceMapper.deleteByPrimaryKey(menuId);
        if(num == 1) {
            return Response.ok();
        } else {
            return Response.returnCode(ReturnCode.DELETE_FAIL);
        }
    }

    @Override
    public Response selectPageList(Map<String, Object> queryInfo) {
        //总数
        Integer totalCount = authResourceMapper.getCount(queryInfo);
        //数据
        List<AuthResource> list = baseMapper.getPageList(queryInfo);
        return Response.ok(new PageDTO<>(totalCount, list));
    }

}
