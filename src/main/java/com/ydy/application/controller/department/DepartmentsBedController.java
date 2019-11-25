package com.ydy.application.controller.department;


import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ydy.application.entity.department.DepartmentsDevice;
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

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ydy.application.entity.department.DepartmentsBed;
import com.ydy.application.filter.AuthTokenDTO;
import com.ydy.application.service.department.DepartmentsBedService;
import com.ydy.application.token.ContextHolder;
import com.ydy.application.util.PageDTO;
import com.ydy.application.util.Response;

import lombok.extern.slf4j.Slf4j;
/**
 *
 * @author rz123
 * @since 2019-08-06
 */
@Controller
@RequestMapping("/departmentsBed")
@Slf4j
public class DepartmentsBedController {

    @Autowired
    public DepartmentsBedService departmentsBedService;

    /**
     * 根据id删除对象
     * @param id  实体ID
     * @return repsonse
     *
     * @api {get} /departmentsBed/delete/{id}    删除
     * @apiGroup bed
     * @apiParam  {String} id
     */
    @ResponseBody
    @GetMapping("/delete/{id}")
    public Response departmentsBedDelete(@PathVariable Integer id){
        return departmentsBedService.deleteBed(id);
    }

    /**
     * 根据病房id查询病床
     * @return repsonse
     *
     * @api {get} /departmentsBed/getBedByRoomId/{rid}    根据病房id查询病床
     * @apiGroup bed
     * @apiParam  {String} rid
     */
    @ResponseBody
    @GetMapping("/getBedByRoomId/{rid}")
    public Response getBedByRoomId(@PathVariable Integer rid){
        return departmentsBedService.getBedByRoomId(rid);
    }

//    /**
//     * 科室版主页面List
//     *
//     * @param bootStrapTable  分页信息
//     * @param departmentsBed   查询条件
//     * @return repsonse
//     */
//    @ResponseBody
//    @PostMapping("/list/mainScreen")
//    public Response getDepartmentsBedList(@RequestBody JSONObject json) {
//    	AuthTokenDTO authTokenDTO = ContextHolder.get();
//        Map<String,Object> queryInfo = (Map) json;
//        queryInfo.put("sectionId", authTokenDTO.getSectionId());
//        queryInfo.put("offset",  (json.getInteger("currPage")-1)*json.getInteger("pagesize"));
//        queryInfo.put("pageSize", json.getInteger("pageSize"));
//        PageDTO pageDto = departmentsBedService.getDepartmentsBedList(queryInfo);
//		return Response.ok(pageDto);
//    }
//
//
//
//
//    /**
//     * 新增
//     * @param departmentsBed  传递的实体
//     * @return repsonse
//     */
//    @ResponseBody
//    @PostMapping
//    public Response departmentsBedInsert(@RequestBody DepartmentsBed departmentsBed) {
//    	AuthTokenDTO authTokenDTO = ContextHolder.get();
//    	departmentsBed.setCreatTime(new Date());
//    	departmentsBed.setSectionId(authTokenDTO.getSectionId());
//        departmentsBedService.insert(departmentsBed);
//        return Response.ok(departmentsBed.getId());
//    }
//
//	/**
//	 * 更新
//     * @param departmentsBed  传递的实体
//     * @return repsonse
//     */
//    @ResponseBody
//    @PutMapping("/{id}")
//    public Response departmentsBedUpdate(@RequestBody DepartmentsBed departmentsBed) {
//		Boolean flag = departmentsBedService.updateById(departmentsBed);
//        return Response.ok(flag);
//    }
//
//	/**
//     * 查询
//     * @param departmentsBed  传递的实体
//     * @return repsonse
//     */
//    @ResponseBody
//    @GetMapping("/{id}")
//    public Response departmentsBedUpdate(@PathVariable Long id) {
//    	log.info("token ============"+ContextHolder.get());
//		DepartmentsBed result = departmentsBedService.selectById(id);
//        return Response.ok(result);
//    }

	 /**
     * 查询全部
     * @param null
     * @return repsonse
     */
    /*@ResponseBody
    @GetMapping
    public Response departmentsBedAll(@PathVariable Long id){
        List<DepartmentsBed> list = departmentsBedService.selectList(new EntityWrapper<DepartmentsBed>().eq("1", "1"));
        return Response.ok(list);
    }*/

}