package com.ydy.application.controller.department;


import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ydy.application.dto.department.DepartmentsRoomDTO;
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
import com.ydy.application.entity.department.DepartmentsRoom;
import com.ydy.application.filter.AuthTokenDTO;
import com.ydy.application.service.department.DepartmentsRoomService;
import com.ydy.application.token.ContextHolder;
import com.ydy.application.util.PageDTO;
import com.ydy.application.util.Response;

import javax.validation.Valid;

/**
 *  病房
 * @author rz123
 * @since 2019-08-06
 */
@Controller
@RequestMapping("/departmentsRoom")
public class DepartmentsRoomController {

    @Autowired
    public DepartmentsRoomService departmentsRoomService;

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
        AuthTokenDTO authTokenDTO = ContextHolder.get();
        queryInfo.put("sectionId", authTokenDTO.getSectionId());
        queryInfo.put("limit", (json.getInteger("currPage")-1)*json.getInteger("pageSize"));
        queryInfo.put("offset",json.getInteger("pageSize"));
        return Response.ok(departmentsRoomService.selectPageList(queryInfo));
    }

    /**
     * 新增
     * @param roomDTO  传递的实体
     * @return repsonse
     *
     * @api {post} /departmentsRoom 新增病房
     * @apiGroup room
     * @apiParam  {String} roomName 病房名称
     * @apiParam  {Object[]} bedList 病床(数组)
     * @apiParam  {String} bedList.bedName 床位
     * @apiParam  {Object} bedList.device 设备
     * @apiParam  {String} bedList.device.id 设备
     */
    @ResponseBody
    @PostMapping
    public Response departmentsRoomInsert(@RequestBody @Valid DepartmentsRoomDTO roomDTO) {
        return departmentsRoomService.insertOrUpdate(roomDTO);
    }

	/**
     * 更新
     * @param roomDTO  传递的实体
     * @return repsonse
     *
     * @api {put} /departmentsRoom  更新
     * @apiGroup room
     * @apiParam  {String} id
     * @apiParam  {String} roomName 病房名称
     * @apiParam  {Object[]} bedList 病床(数组)
     * @apiParam  {String} bedList.id
     * @apiParam  {String} bedList.bedName 床位
     * @apiParam  {Object} bedList.device 设备
     * @apiParam  {String} bedList.device.id 设备id
     */
    @ResponseBody
    @PutMapping
    public Response departmentsRoomUpdate(@RequestBody @Valid DepartmentsRoomDTO roomDTO) {
        return departmentsRoomService.insertOrUpdate(roomDTO);
    }	
	
	/**
     * 查询
     * @param id  传递的实体
     * @return repsonse
     *
     * @api {get} /departmentsRoom/{id}  查询
     * @apiGroup room
     * @apiParam  {String} id
     */
    @ResponseBody
    @GetMapping("/{id}")
    public Response departmentsRoomUpdate(@PathVariable Integer id) {
        return departmentsRoomService.selectRoom(id);
    }
	
    /**
     * 根据id删除对象
     * @param id  实体ID
     * @return repsonse
     *
     * @api {get} /departmentsRoom/delete/{id}  删除
     * @apiGroup room
     * @apiParam  {String} id
     */
    @ResponseBody
    @GetMapping("/delete/{id}")
    public Response departmentsRoomDelete(@PathVariable Integer id){
        return departmentsRoomService.deleteRoom(id);
    }
	
	 /**
     * 查询全部
     * @return repsonse
     *
     * @api {get} /departmentsRoom  查询当前科室全部病房
     * @apiGroup room
     */
    @ResponseBody
    @GetMapping
    public Response departmentsRoomAll(){
        AuthTokenDTO authTokenDTO = ContextHolder.get();
        List<DepartmentsRoom> list = departmentsRoomService.selectList(new EntityWrapper<DepartmentsRoom>()
                .eq("is_deleted", "0")
                .eq("section_id", authTokenDTO.getSectionId()));
        return Response.ok(list);
    }

}