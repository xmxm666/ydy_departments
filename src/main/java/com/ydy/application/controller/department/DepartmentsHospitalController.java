package com.ydy.application.controller.department;


import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ydy.application.entity.department.DepartmentsAdmin;
import com.ydy.application.entity.department.DepartmentsHospital;
import com.ydy.application.filter.AuthTokenDTO;
import com.ydy.application.service.department.DepartmentsHospitalService;
import com.ydy.application.token.ContextHolder;
import com.ydy.application.util.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

/**
 *  医院
 * @author rz123
 * @since 2019-08-06
 */
@Controller
@RequestMapping("/departmentsHospital")
@Slf4j
public class DepartmentsHospitalController {

    @Autowired
    public DepartmentsHospitalService departmentsHospitalService;


    /**
     * 分页信息
     * @return repsonse
     *
     * @api {post} /departmentsRoom/page    病房分页信息
     * @apiGroup room
     * @apiParam  {Number} currPage 页数
     * @apiParam  {Number} pageSize 每页数量
     */
    @ResponseBody
    @PostMapping("/page")
    public Response getDepartmentsRoomList(@RequestBody JSONObject json) {
        Map<String,Object> queryInfo = (Map) json;
        queryInfo.put("limit", (json.getInteger("currPage")-1)*json.getInteger("pageSize"));
        queryInfo.put("offset",json.getInteger("pageSize"));
        return Response.ok(departmentsHospitalService.selectPageList(queryInfo));
    }

    /**
     * 新增
     * @param departmentsHospital  传递的实体
     * @return repsonse
     */
    @ResponseBody
    @PostMapping
    public Response departmentsAdminInsert(@RequestBody DepartmentsHospital departmentsHospital) {
        Boolean flag = departmentsHospitalService.insert(departmentsHospital);
        return Response.ok(flag);
    }

	/**
     * 更新
     * @param departmentsHospital  传递的实体
     * @return repsonse
     */
    @ResponseBody
    @PutMapping("/{id}")
    public Response departmentsAdminUpdate(@RequestBody DepartmentsHospital departmentsHospital) {
		Boolean flag = departmentsHospitalService.updateById(departmentsHospital);
        return Response.ok(flag);
    }
	
	/**
     * 查询
     * @param id  传递的实体
     * @return repsonse
     */
    @ResponseBody
    @GetMapping("/{id}")
    public Response departmentsAdminUpdate(@PathVariable Integer id) {
        DepartmentsHospital result = departmentsHospitalService.selectById(id);
        return Response.ok(result);
    }
	
    /**
     * 根据id删除对象
     * @param id  实体ID
     * @return repsonse
     */
    @ResponseBody
    @DeleteMapping("/{id}")
    public Response departmentsAdminDelete(@PathVariable Integer id){
        Boolean flag = departmentsHospitalService.deleteById(id);
        return Response.ok(flag);
    }
	
	 /**
     * 查询全部
     * @param
     * @return repsonse
     */
    @ResponseBody
    @GetMapping
    public Response departmentsAdminAll(){
        List<DepartmentsHospital> list = departmentsHospitalService.selectList(new EntityWrapper<DepartmentsHospital>().eq("1", "1"));
        return Response.ok(list);
    }

}