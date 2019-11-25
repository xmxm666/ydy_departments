package com.ydy.application.controller.department;


import java.util.Date;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.ydy.application.util.PageDTO;
import org.apache.http.protocol.HTTP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ydy.application.entity.department.DepartmentsSection;
import com.ydy.application.service.department.DepartmentsSectionService;
import com.ydy.application.util.Response;

import javax.validation.Valid;

/**
 *  科室
 * @author rz123
 * @since 2019-08-06
 */
@Controller
@RequestMapping("/departmentsSection")
public class DepartmentsSectionController {

    @Autowired
    public DepartmentsSectionService departmentsSectionService;

    /**
     * 分页信息
     * @return repsonse
     *
     * @api {post} /departmentsSection/page 科室分页信息
     * @apiGroup section
     * @apiParam  {Number} currPage 页数
     * @apiParam  {Number} pageSize 每页数量
     * @apiParam  {Number} hospitalId 医院id
     */
    @ResponseBody
    @PostMapping("/page")
    public Response getDepartmentsSectionList(@RequestBody JSONObject json) {
        Map<String,Object> queryInfo = (Map) json;
		queryInfo.put("limit", (json.getInteger("currPage")-1)*json.getInteger("pageSize"));
		queryInfo.put("offset",json.getInteger("pageSize"));
		queryInfo.put("hospitalId",json.getInteger("hospitalId"));
		return Response.ok(departmentsSectionService.selectPageList(queryInfo));
    }

    


    /**
     * 新增
     * @param departmentsSection  传递的实体
     * @return repsonse
     *
     * @api {post} /departmentsSection  新增
     * @apiGroup section
     * @apiParam  {String} name 科室名
     * @apiParam  {Number} hospitalId   医院id
     */
    @ResponseBody
    @PostMapping
    public Response departmentsSectionInsert(@RequestBody @Valid DepartmentsSection departmentsSection) {
    	departmentsSection.setCreatTime(new Date());
    	departmentsSection.setIsDeleted(0);
        departmentsSectionService.insert(departmentsSection);
        return Response.ok(departmentsSection.getId());
    }

	/**
     * 更新
     * @param departmentsSection  传递的实体
     * @return repsonse
     *
     * @api {put} /departmentsSection   更新
     * @apiGroup section
     * @apiParam  {Number} id
     * @apiParam  {String} name 科室名
     * @apiParam  {Number} hospitalId   医院id
     */
    @ResponseBody
    @PutMapping
    public Response departmentsSectionUpdate(@RequestBody @Valid DepartmentsSection departmentsSection) {
		Boolean flag = departmentsSectionService.updateById(departmentsSection);
        return Response.ok(flag);
    }
	
	/**
     * 根据id查询对象
     * @param id  实体ID
     * @return repsonse
     *
     * @api {get} /departmentsSection/{id}  查找
     * @apiGroup section
     * @apiParam  {Number} id
     */
    @ResponseBody
    @GetMapping("/{id}")
    public Response departmentsSectionUpdate(@PathVariable Integer id) {
		DepartmentsSection result = departmentsSectionService.selectById(id);
        return Response.ok(result);
    }
	
    /**
     * 根据id删除对象
     * @param id  实体ID
     * @return repsonse
     *
     * @api {delete} /departmentsSection/{id}   删除
     * @apiGroup section
     * @apiParam  {Number} id
     */
    @ResponseBody 
    @DeleteMapping("/{id}")
    public Response departmentsSectionDelete(@PathVariable Integer id){
        DepartmentsSection section = new DepartmentsSection();
        section.setId(id);
        section.setIsDeleted(1);
        Boolean flag = departmentsSectionService.updateById(section);
        return Response.ok(flag);
    }
	
	 /**
     * 查询全部
     * @return repsonse
     */
    /*@ResponseBody
    @GetMapping
    public Response departmentsSectionAll(){
        List<DepartmentsSection> list = departmentsSectionService.selectList(new EntityWrapper<DepartmentsSection>().eq("1", "1"));
        return Response.ok(list);
    }*/

    /**
     * 根据hospitalId查询科室
     * @param hospitalId  实体ID
     * @return repsonse
     *
     * @api {get} /departmentsSection/hospital/{hospitalId}  查找
     * @apiGroup section
     * @apiParam  {Number} hospitalId 医院id
     */
    @ResponseBody
    @GetMapping("/hospital/{hospitalId}")
    public Response selectByHospital(@PathVariable Integer hospitalId) {
        List<DepartmentsSection> list = departmentsSectionService.selectList(new EntityWrapper<DepartmentsSection>().eq("hospital_id", hospitalId));
        return Response.ok(list);
    }
    
}