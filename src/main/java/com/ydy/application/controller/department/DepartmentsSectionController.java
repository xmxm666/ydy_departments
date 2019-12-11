package com.ydy.application.controller.department;


import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ydy.application.entity.department.DepartmentsSection;
import com.ydy.application.service.department.DepartmentsSectionService;
import com.ydy.application.util.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

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
        return departmentsSectionService.addSection(departmentsSection);
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
        return departmentsSectionService.addSection(departmentsSection);
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
     * @api {get} /departmentsSection/delete/{id}   删除
     * @apiGroup section
     * @apiParam  {Number} id
     */
    @ResponseBody 
    @GetMapping("/delete/{id}")
    public Response departmentsSectionDelete(@PathVariable Integer id){
        return departmentsSectionService.deleteSection(id);
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
     * @api {get} /departmentsSection/hospital 查找
     * @apiGroup section
     * @apiParam  {Number} hospitalId 医院id
     */
    @ResponseBody
    @GetMapping("/hospital")
    public Response selectByHospital(@RequestParam Integer hospitalId) {
        List<DepartmentsSection> list = departmentsSectionService.selectList(new EntityWrapper<DepartmentsSection>()
                .eq("hospital_id", hospitalId)
                .eq("is_deleted", "0"));
        return Response.ok(list);
    }
    
}