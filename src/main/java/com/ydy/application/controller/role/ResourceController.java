package com.ydy.application.controller.role;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ydy.application.dto.MenuTreeNode;
import com.ydy.application.entity.role.AuthResource;
import com.ydy.application.filter.AuthTokenDTO;
import com.ydy.application.service.role.ResourceService;
import com.ydy.application.token.ContextHolder;
import com.ydy.application.util.Response;
import com.ydy.application.util.TreeUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *   资源URL管理
 */
@RestController
@RequestMapping("/resource")
public class ResourceController {

    private static final Logger LOGGER = LoggerFactory.getLogger(ResourceController.class);

    @Autowired
    private ResourceService resourceService;

    /**
     * 分页信息 获取全部资源列
     * @return repsonse
     *
     * @api {post} /resource/page    资源分页信息
     * @apiGroup resource
     * @apiParam  {Number} currPage 页数
     * @apiParam  {Number} pageSize 每页数量
     */
    @ResponseBody
    @PostMapping("/page")
    public Response getResourceList(@RequestBody JSONObject json) {
        Map<String,Object> queryInfo = (Map) json;
        queryInfo.put("limit", (json.getInteger("currPage")-1)*json.getInteger("pageSize"));
        queryInfo.put("offset",json.getInteger("pageSize"));
        return resourceService.selectPageList(queryInfo);
    }

    /**
     * 新增资源
     * @param menu  传递的实体
     * @return repsonse
     *
     * @api {post} /resource 新增资源
     * @apiGroup resource
     * @apiParam  {String} code CODE
     * @apiParam  {String} name 资源名称
     * @apiParam  {Integer} parentId 父ID
     * @apiParam  {String} uri RUI
     * @apiParam  {String} method 方法
     */
    @PostMapping
    public Response addMenu(@RequestBody @Valid AuthResource menu ) {
        return resourceService.addMenu(menu);
    }

    /**
     * 修改资源
     * @param menu  传递的实体
     * @return repsonse
     *
     * @api {put} /resource 新增资源
     * @apiGroup resource
     * @apiParam  {Integer} id
     * @apiParam  {String} code CODE
     * @apiParam  {String} name 资源名称
     * @apiParam  {Integer} parentId 父ID
     * @apiParam  {String} uri RUI
     * @apiParam  {String} method 方法
     */
    @PutMapping
    public Response updateMenu(@RequestBody AuthResource menu) {
        return resourceService.addMenu(menu);
    }

    /**
     * 根据id删除对象
     * @param id  实体ID
     * @return repsonse
     *
     * @api {get} /resource/delete/{id}  删除
     * @apiGroup resource
     * @apiParam  {String} id
     */
    @ResponseBody
    @GetMapping("/delete/{id}")
    public Response deleteMenuByMenuId(@PathVariable Integer id) {
        return resourceService.deleteMenuByMenuId(id);
    }

    /**
     * 查询
     * @param id  传递的实体
     * @return repsonse
     *
     * @api {get} /resource/{id}  查询
     * @apiGroup resource
     * @apiParam  {String} id
     */
    @ResponseBody
    @GetMapping("/{id}")
    public Response getById(@PathVariable Integer id) {
        AuthResource authResource = resourceService.selectById(id);
        return Response.ok(authResource);
    }

    /**
     * 获取资源父id
     * @return repsonse
     *
     * @api {get} /resource/parentResource  查询
     * @apiGroup resource
     */
    @ResponseBody
    @GetMapping("/parentResource")
    public Response getParentResource() {
        List<AuthResource> list = resourceService.selectList(new EntityWrapper<AuthResource>().eq("TYPE", 1).eq("STATUS", 1));
        return Response.ok(list);
    }

    @GetMapping("authorityMenu")
    public Response getAuthorityMenu(HttpServletRequest request) {
        AuthTokenDTO authTokenDTO = ContextHolder.get();
        Integer uid = authTokenDTO.getUserId();
        return resourceService.getAuthorityMenusByUid(uid);
    }

    /**
     * 获取全部资源列
     * @return repsonse
     *
     * @api {get} /resource/menus  获取全部资源列
     * @apiGroup resource
     */
    @GetMapping("menus")
    public Response getMenus() {

        List<MenuTreeNode> treeNodes = new ArrayList<>();
        List<AuthResource> resources = resourceService.getMenus();

        for (AuthResource resource: resources) {
            MenuTreeNode node = new MenuTreeNode();
            BeanUtils.copyProperties(resource,node);
            treeNodes.add(node);
        }
        List<MenuTreeNode> menuTreeNodes = TreeUtil.buildTreeBy2Loop(treeNodes,-1);
        return Response.ok(menuTreeNodes);
    }



}
