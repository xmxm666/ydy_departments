package com.ydy.application.controller.department;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import com.alibaba.fastjson.JSONObject;
import com.ydy.application.util.PageDTO;
import org.apache.tomcat.util.security.MD5Encoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ydy.application.dto.department.DepartMentLoginDTO;
import com.ydy.application.entity.department.DepartmentsAdmin;
import com.ydy.application.service.department.DepartmentsAdminService;
import com.ydy.application.util.Response;

import lombok.extern.slf4j.Slf4j;
/**
 *  医生
 * @author rz123
 * @since 2019-08-06
 */
@Controller
@RequestMapping("/departmentsAdmin")
@Slf4j
public class DepartmentsAdminController {

    @Autowired
    public DepartmentsAdminService departmentsAdminService;


    /**
     * 分页查询
     * @param json  分页信
     * @return repsonse
     *
     * @api {post} /departmentsAdmin/page  医生分页查询
     * @apiGroup admin
     * @apiParam  {Number} currPage 页数
     * @apiParam  {Number} pageSize 每页数量
     * @apiParam  {Number} role 角色   0-管理员， 1-医生
     * @apiParam  {Number} hospitalId 医院id
     * @apiParam  {Number} sectionId    科室id
     */
    @ResponseBody
    @PostMapping("/page")
    public Response getDepartmentsSectionList(@RequestBody JSONObject json) {
        Map<String,Object> queryInfo = (Map) json;
        queryInfo.put("limit", (json.getInteger("currPage")-1)*json.getInteger("pageSize"));
        queryInfo.put("offset",json.getInteger("pageSize"));
        queryInfo.put("role",json.getInteger("role"));
        queryInfo.put("hospitalId",json.getInteger("hospitalId"));
        queryInfo.put("sectionId",json.getInteger("sectionId"));
        return Response.ok(departmentsAdminService.selectPageList(queryInfo));
    }




    /**
     * 新增
     * @param departmentsAdmin  传递的实体
     * @return repsonse
     *
     * @api {post} /departmentsAdmin  医生新增
     * @apiGroup admin
     * @apiParam  {String} username 用户名
     * @apiParam  {String} password 密码
     * @apiParam  {String} role 角色   0-管理员， 1-医生
     * @apiParam  {String} sectionId 科室id
     */
    @ResponseBody
    @PostMapping
    public Response departmentsAdminInsert(@RequestBody @Valid DepartmentsAdmin departmentsAdmin) {
        return departmentsAdminService.insertUpdate(departmentsAdmin);
    }

    /**
     * @api {post} /departmentsAdmin/login  医生登录
     * @apiGroup admin
     * @apiParam  {String} username 用户名
     * @apiParam  {String} password 密码
     */
    @ResponseBody
    @PostMapping("/login")
    public Response departmentsAdminLogin(@RequestBody @Valid DepartmentsAdmin req , HttpServletResponse resp) {
        return departmentsAdminService.departmentsAdminLogin(req , resp);
    }

	/**
     * 更新
     * @param departmentsAdmin  传递的实体
     * @return repsonse
     *
     * @api {put} /departmentsAdmin  医生更新
     * @apiGroup admin
     * @apiParam  {String} id
     * @apiParam  {String} username 用户名
     * @apiParam  {String} password 密码
     * @apiParam  {String} role 角色   0-管理员， 1-医生
     * @apiParam  {String} sectionId 科室id
     */
    @ResponseBody
    @PutMapping
    public Response departmentsAdminUpdate(@RequestBody @Valid DepartmentsAdmin departmentsAdmin) {
        return departmentsAdminService.insertUpdate(departmentsAdmin);
    }

	/**
     * 查询
     * @param id  传递的实体
     * @return repsonse
     *
     * @api {get} /departmentsAdmin/{id}    查询
     * @apiGroup admin
     * @apiParam  {String} id
     */
    @ResponseBody
    @GetMapping("/{id}")
    public Response departmentsAdminUpdate(@PathVariable Integer id) {
        return departmentsAdminService.selectAdmin(id);
    }

    /**
     * 根据id删除对象
     * @param id  实体ID
     * @return repsonse
     *
     * @api {delete} /departmentsAdmin/{id}    删除
     * @apiGroup admin
     * @apiParam  {String} id
     */
    @ResponseBody
    @DeleteMapping("/{id}")
    public Response departmentsAdminDelete(@PathVariable Long id){
        Boolean flag = departmentsAdminService.deleteById(id);
        return Response.ok(flag);
    }

	 /**
     * 查询全部
     * @param
     * @return repsonse
      *
     */
    @ResponseBody
    @GetMapping
    public Response departmentsAdminAll(){
        List<DepartmentsAdmin> list = departmentsAdminService.selectList(new EntityWrapper<DepartmentsAdmin>().eq("1", "1"));
        return Response.ok(list);
    }

}