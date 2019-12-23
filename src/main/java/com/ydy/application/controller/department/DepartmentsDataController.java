 package com.ydy.application.controller.department;


 import com.ydy.application.filter.AuthTokenDTO;
import com.ydy.application.service.department.DepartmentsDataService;
import com.ydy.application.token.ContextHolder;
import com.ydy.application.util.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
     public Response getDepartmentsRoomList() {
         AuthTokenDTO authTokenDTO = ContextHolder.get();
         return departmentsDataService.dataList(authTokenDTO.getSectionId());
     }
    @ResponseBody
    @GetMapping("/test")
    public void departmentsDataTest() {
        departmentsDataService.sendClient();
    }

//    /**
//     * 新增
//     * @param departmentsData  传递的实体
//     * @return repsonse
//     */
//    @ResponseBody
//    @PostMapping
//    public Response departmentsDataInsert(@RequestBody DepartmentsData departmentsData) {
//        Boolean flag = departmentsDataService.insert(departmentsData);
//        return Response.ok(flag);
//    }
//
//	/**
//     * 更新
//     * @param departmentsData  传递的实体
//     * @return repsonse
//     */
//    @ResponseBody
//    @PutMapping("/{id}")
//    public Response departmentsDataUpdate(@RequestBody DepartmentsData departmentsData) {
//		Boolean flag = departmentsDataService.updateById(departmentsData);
//        return Response.ok(flag);
//    }
//
//	/**
//     * 查询
//     * @param departmentsData  传递的实体
//     * @return repsonse
//     */
//    @ResponseBody
//    @GetMapping("/{id}")
//    public Response departmentsDataUpdate(@PathVariable Long id) {
//		DepartmentsData result = departmentsDataService.selectById(id);
//        return Response.ok(result);
//    }
//
//    /**
//     * 根据id删除对象
//     * @param id  实体ID
//     * @return repsonse
//     */
//    @ResponseBody
//    @DeleteMapping("/{id}")
//    public Response departmentsDataDelete(@PathVariable Long id){
//        Boolean flag = departmentsDataService.deleteById(id);
//        return Response.ok(flag);
//    }
//
//	 /**
//     * 查询全部
//     * @param null
//     * @return repsonse
//     */
//    @ResponseBody
//    @GetMapping
//    public Response departmentsDataAll(@PathVariable Long id){
//        List<DepartmentsData> list = departmentsDataService.selectList(new EntityWrapper<DepartmentsData>().eq("1", "1"));
//        return Response.ok(list);
//    }

}