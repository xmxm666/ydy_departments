 package com.ydy.application.controller.department;


 import com.ydy.application.dto.department.DepartmentsPatientDataDTO;
import com.ydy.application.filter.AuthTokenDTO;
import com.ydy.application.service.department.DepartmentsDataService;
import com.ydy.application.token.ContextHolder;
import com.ydy.application.util.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

 /**
 *
 * @author zqx123
 * @since 2019-12-13
 */
@Controller
@RequestMapping("/departmentsData")
public class DepartmentsDataController {

    @Autowired
    public DepartmentsDataService departmentsDataService;

     /**
      * 获取生命体征监测全部列表
      * @return repsonse
      *
      * @api {get} /departmentsData/dataList 生命体征监测全部列表
      * @apiGroup data
      */
     @ResponseBody
     @GetMapping("/dataList")
     public Response getDataList() {
         AuthTokenDTO authTokenDTO = ContextHolder.get();
         return departmentsDataService.dataList(authTokenDTO.getSectionId());
     }

     /**
      * 根据pid获取生命体征
      * @return repsonse
      *
      * @api {get} /departmentsData/patientDetailData 根据pid获取生命体征
      * @apiGroup data
      */
     @ResponseBody
     @GetMapping("/patientDetailData/{pid}")
     public Response getDataByPid(@PathVariable Integer pid) {
         return departmentsDataService.patientDetailData(pid);
     }

    /**
    * 获取  实时、时、日、周  相应的数据
    * spo2, hr, rr, sbp, dbp
    *
    * @api {get} /departmentsData/patientData 患者监测数据
    * @apiGroup data
     *
     * @apiParam  {Number} did    设备id
     * @apiParam  {Number} dataType    数据类型     1:spo2, 2:hr, 3:rr, 4:nibp
     * @apiParam  {Number} timeType    时间类型     1:实时、2:时、3:日、4:周
    */
    @ResponseBody
    @PostMapping("/patientData")
    public Response getPatientData(@RequestBody DepartmentsPatientDataDTO patientData) {
        return departmentsDataService.getPatientData(patientData);
    }



}