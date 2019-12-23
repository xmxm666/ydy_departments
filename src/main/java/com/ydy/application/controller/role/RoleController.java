package com.ydy.application.controller.role;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ydy.application.dto.RoleDTO;
import com.ydy.application.entity.role.AuthRole;
import com.ydy.application.service.role.ResourceService;
import com.ydy.application.service.role.RoleService;
import com.ydy.application.shiro.filter.ShiroFilterChainManager;
import com.ydy.application.util.Response;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

/**
 *
 */
@RequestMapping("/role")
@RestController
public class RoleController {

    private static final Logger LOGGER = LoggerFactory.getLogger(RoleController.class);

    @Autowired
    private RoleService roleService;

    @Autowired
    private ResourceService resourceService;

    @Autowired
    private ShiroFilterChainManager shiroFilterChainManager;

    /**
     * 分页信息 获取角色LIST
     * @return repsonse
     *
     * @api {post} /role/page    角色分页信息
     * @apiGroup role
     * @apiParam  {Number} currPage 页数
     * @apiParam  {Number} pageSize 每页数量
     */
    @ResponseBody
    @PostMapping("/page")
    public Response getRoles(@RequestBody JSONObject json) {
        Map<String,Object> queryInfo = (Map) json;
        queryInfo.put("limit", (json.getInteger("currPage")-1)*json.getInteger("pageSize"));
        queryInfo.put("offset",json.getInteger("pageSize"));
        return roleService.selectPageList(queryInfo);
    }

    /**
     * 新增角色
     * @param role  传递的实体
     * @return repsonse
     *
     * @api {post} /role 新增角色
     * @apiGroup role
     * @apiParam  {String} code CODE
     * @apiParam  {String} name 角色名称
     */
    @PostMapping
    public Response addRole(@RequestBody @Valid RoleDTO role) {
        return roleService.addRole(role);
    }

    /**
     * 更新角色
     * @param role  传递的实体
     * @return repsonse
     *
     * @api {put} /role 更新角色
     * @apiGroup role
     * @apiParam  {Integer} id ID
     * @apiParam  {String} code CODE
     * @apiParam  {String} name 角色名称
     */
    @PutMapping
    public Response updateRole(@RequestBody @Valid RoleDTO role) {
        return roleService.addRole(role);
    }

    /**
     * 根据角色ID删除角色
     * @param id  实体ID
     * @return repsonse
     *
     * @api {get} /role/delete/{id}  删除
     * @apiGroup role
     * @apiParam  {String} id
     */
    @GetMapping("/delete/{id}")
    public Response deleteRoleByRoleId(@PathVariable Integer id) {
        return roleService.deleteRoleByRoleId(id);
    }

    /**
     * 查询
     * @param id  传递的实体
     * @return repsonse
     *
     * @api {get} /role/{id}  查询
     * @apiGroup role
     * @apiParam  {String} id
     */
    @ResponseBody
    @GetMapping("/{id}")
    public Response getById(@PathVariable Integer id) {
        return roleService.getById(id);
    }

    /**
     * 查询全部
     * @param
     * @return repsonse
     *
     * @api {get} /role    查询全部
     * @apiGroup admin
     */
    @ResponseBody
    @GetMapping
    public Response roleAll(){
        List<AuthRole> list = roleService.selectList(new EntityWrapper<AuthRole>().eq("STATUS", "1"));
        return Response.ok(list);
    }

}
