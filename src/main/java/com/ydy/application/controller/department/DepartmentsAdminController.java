package com.ydy.application.controller.department;


import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ydy.application.dto.department.DepartmentsAdminDTO;
import com.ydy.application.entity.department.DepartmentsAdmin;
import com.ydy.application.service.department.DepartmentsAdminService;
import com.ydy.application.util.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;
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
     * @apiParam  {Number} hospitalId 医院id
     * @apiParam  {Number} sectionId    科室id
     */
    @ResponseBody
    @PostMapping("/page")
    public Response getDepartmentsSectionList(@RequestBody JSONObject json) {
        Map<String,Object> queryInfo = (Map) json;
        queryInfo.put("limit", (json.getInteger("currPage")-1)*json.getInteger("pageSize"));
        queryInfo.put("offset",json.getInteger("pageSize"));
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
     * @apiParam  {String} sectionId 科室id
     */
    @ResponseBody
    @PostMapping
    public Response departmentsAdminInsert(@RequestBody @Valid DepartmentsAdminDTO departmentsAdmin) {
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
    public Response departmentsAdminLogin(HttpServletRequest request, HttpServletResponse response) {
        String username = (String) request.getAttribute("username");
        String password = (String) request.getAttribute("password");
        DepartmentsAdmin admin = new DepartmentsAdmin();
        admin.setUsername(username);
        admin.setPassword(password);
        return departmentsAdminService.departmentsAdminLogin(admin);
    }


	/**
     * 更新
     * @param departmentsAdmin  传递的实体
     * @return repsonse
     *
     * @api {put} /departmentsAdmin  医生更新
     * @apiGroup admin
     * @apiParam  {Integer} id
     * @apiParam  {String} username 用户名
     * @apiParam  {String} password 密码
     * @apiParam  {String} sectionId 科室id
     */
    @ResponseBody
    @PutMapping
    public Response departmentsAdminUpdate(@RequestBody @Valid DepartmentsAdminDTO departmentsAdmin) {
        return departmentsAdminService.insertUpdate(departmentsAdmin);
    }

	/**
     * 查询
     * @param id  传递的实体
     * @return repsonse
     *
     * @api {get} /departmentsAdmin/{id}    查询
     * @apiGroup admin
     * @apiParam  {Integer} id
     */
    @ResponseBody
    @GetMapping("/{id}")
    public Response departmentsAdmin(@PathVariable Integer id) {
        return departmentsAdminService.selectAdmin(id);
    }

    /**
     * 根据id删除对象
     * @param id  实体ID
     * @return repsonse
     *
     * @api {get} /departmentsAdmin/delete/{id}    删除
     * @apiGroup admin
     * @apiParam  {Integer} id
     */
    @ResponseBody
    @GetMapping("/delete/{id}")
    public Response departmentsAdminDelete(@PathVariable Integer id){
        Boolean flag = departmentsAdminService.deleteById(id);
        return Response.ok(flag);
    }

	 /**
     * 查询全部
     * @param
     * @return repsonse
     *
     * @api {get} /departmentsAdmin    查询全部
     * @apiGroup admin
     */
    @ResponseBody
    @GetMapping
    public Response departmentsAdminAll(){
        List<DepartmentsAdmin> list = departmentsAdminService.selectList(new EntityWrapper<DepartmentsAdmin>().eq("1", "1"));
        return Response.ok(list);
    }

}