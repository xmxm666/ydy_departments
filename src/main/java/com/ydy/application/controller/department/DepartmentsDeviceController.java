package com.ydy.application.controller.department;


import java.util.Date;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.ydy.application.filter.AuthTokenDTO;
import com.ydy.application.service.department.DepartmentsRBDPService;
import com.ydy.application.token.ContextHolder;
import com.ydy.application.util.PageDTO;
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
import com.ydy.application.entity.department.DepartmentsDevice;
import com.ydy.application.service.department.DepartmentsDeviceService;
import com.ydy.application.util.Response;

import javax.validation.Valid;

/**
 *  设备
 * @author rz123
 * @since 2019-08-06
 */
@Controller
@RequestMapping("/departmentsDevice")
public class DepartmentsDeviceController {

    @Autowired
    public DepartmentsDeviceService departmentsDeviceService;

    /**
     * 分页查询
     * @api {post} /departmentsDevice/page  设备分页信息
     * @apiGroup device
     * @apiParam  {Number} currPage 页数
     * @apiParam  {Number} pageSize 每页数量
     */
    @ResponseBody
    @PostMapping("/page")
    public Response getDepartmentsDeviceList(@RequestBody JSONObject json) {
        Map<String,Object> queryInfo = (Map) json;

        AuthTokenDTO authTokenDTO = ContextHolder.get();
        queryInfo.put("sectionId", authTokenDTO.getSectionId());
        queryInfo.put("limit", (json.getInteger("currPage")-1)*json.getInteger("pageSize"));
        queryInfo.put("offset",json.getInteger("pageSize"));
        return Response.ok(departmentsDeviceService.selectPageList(queryInfo));
    }

    


    /**
     * 新增
     * @param departmentsDevice  传递的实体
     * @return repsonse
     *
     * @api {post} /departmentsDevice   新增
     * @apiGroup device
     * @apiParam  {String} deviceNumber 设备编号
     */
    @ResponseBody
    @PostMapping
    public Response departmentsDeviceInsert(@RequestBody @Valid DepartmentsDevice departmentsDevice) {
        AuthTokenDTO authTokenDTO = ContextHolder.get();
        departmentsDevice.setSectionId(authTokenDTO.getSectionId());
        departmentsDevice.setCreatTime(new Date());
        departmentsDevice.setIsDeleted(0);
        Boolean flag = departmentsDeviceService.insert(departmentsDevice);
        return Response.ok(flag);
    }

	/**
      * 更新
     * @param departmentsDevice  传递的实体
     * @return repsonse
     *
     * @api {put} /departmentsDevice    更新
     * @apiGroup device
     * @apiParam  {String} id
     * @apiParam  {String} deviceNumber 设备编号
     * @apiParam  {String} mac
     */
    @ResponseBody
    @PutMapping
    public Response departmentsDeviceUpdate(@RequestBody  @Valid DepartmentsDevice departmentsDevice) {
		Boolean flag = departmentsDeviceService.updateById(departmentsDevice);
        return Response.ok(flag);
    }
	
	/**
     * 查询
     * @param id  传递的实体
     * @return repsonse
     *
     * @api {get} /departmentsDevice/{id}   查询
     * @apiGroup device
     * @apiParam  {String} id
     */
    @ResponseBody
    @GetMapping("/{id}")
    public Response departmentsDeviceUpdate(@PathVariable Integer id) {
		DepartmentsDevice result = departmentsDeviceService.selectById(id);
        return Response.ok(result);
    }
	
    /**
     * 根据id删除对象
     * @param id  实体ID
     * @return repsonse
     *
     * @api {get} /departmentsDevice/delete/{id}    删除
     * @apiGroup device
     * @apiParam  {String} id
     */
    @ResponseBody
    @GetMapping("/delete/{id}")
    public Response departmentsDeviceDelete(@PathVariable Integer id){
        return departmentsDeviceService.deleteDevice(id);
    }
	
	 /**
     * 查询全部
     * @return repsonse
     *
	 * @api {get} /departmentsDevice    查询全部
     * @apiGroup device
     */
    @ResponseBody
    @GetMapping
    public Response departmentsDeviceAll(){
        AuthTokenDTO authTokenDTO = ContextHolder.get();
        return departmentsDeviceService.departmentsDeviceAll(authTokenDTO.getSectionId());
    }

}