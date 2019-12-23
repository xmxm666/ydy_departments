package com.ydy.application.controller.department;


import com.alibaba.fastjson.JSONObject;
import com.ydy.application.dto.department.DepartmentsPatientDTO;
import com.ydy.application.filter.AuthTokenDTO;
import com.ydy.application.service.department.DepartmentsPatientService;
import com.ydy.application.token.ContextHolder;
import com.ydy.application.util.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

/**
 *  患者
 * @author rz123
 * @since 2019-08-06
 */
@Controller
@RequestMapping("/departmentsPatient")
public class DepartmentsPatientController {

    @Autowired
    public DepartmentsPatientService departmentsPatientService;

    /**
     * 分页信息
     * @return repsonse
     *
     * @api {post} /departmentsPatient/page 患者分页信息
     * @apiGroup patient
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
        return Response.ok(departmentsPatientService.selectPageList(queryInfo));
    }


    /**
     * 新增病人
     * @param patientDTO  传递的实体
     * @return repsonse
     *
     * @api {post} /departmentsPatient  新增
     * @apiGroup patient
     * @apiParam  {String} caseno 病历号
     * @apiParam  {String} name   姓名
     * @apiParam  {String} sex
     * @apiParam  {String} doctor   主治医生
     * @apiParam  {String} rid   病房
     * @apiParam  {String} bid   病床
     */
    @ResponseBody
    @PostMapping
    public Response departmentsPatientInsert(@RequestBody @Valid DepartmentsPatientDTO patientDTO) {
        return departmentsPatientService.insertOrUpdate(patientDTO);
    }

	/**
     * 更新
     * @param patientDTO  传递的实体
     * @return repsonse
     *
     * @api {put} /departmentsPatient  更新
     * @apiGroup patient
     * @apiParam  {String} id
     * @apiParam  {String} caseno 病历号
     * @apiParam  {String} name   姓名
     * @apiParam  {String} sex
     * @apiParam  {String} doctor   主治医生
     * @apiParam  {String} rid   病房
     * @apiParam  {String} bid   病床
     */
    @ResponseBody
    @PutMapping
    public Response departmentsPatientUpdate(@RequestBody @Valid DepartmentsPatientDTO patientDTO) {
        return departmentsPatientService.insertOrUpdate(patientDTO);
    }
	
	/**
     * 查询
     * @param id  传递的实体
     * @return repsonse
     *
     * @api {get} /departmentsPatient/{id}  查询
     * @apiGroup patient
     * @apiParam  {String} id
     */
    @ResponseBody
    @GetMapping("/{id}")
    public Response departmentsPatientUpdate(@PathVariable Integer id) {
        return departmentsPatientService.selectPatient(id);
    }
	
    /**
     *   病人出院
     * @param id  实体ID
     * @return repsonse
     * @api {get} /departmentsPatient/out/{id}  病人出院
     * @apiGroup patient
     * @apiParam  {String} id
     */
    @ResponseBody
    @GetMapping("/out/{id}")
    public Response patientOutHospital(@PathVariable Integer id){
        return departmentsPatientService.patientOutHospital(id);
    }

}