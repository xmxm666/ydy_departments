package com.ydy.application.controller.department;

import com.farsunset.cim.sdk.server.model.Message;
import com.ydy.application.cim.push.DefaultMessagePusher;
import com.ydy.application.entity.department.DepartmentsAdmin;
import com.ydy.application.util.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;

@Controller
@RequestMapping("/cimTest")
public class CimTestController {

    @Resource
    private DefaultMessagePusher defaultMessagePusher;

    @ResponseBody
    @RequestMapping(value = "/send",method= RequestMethod.POST)
    public Response send(@RequestBody Message message)  {
        message.setAction("2");
        message.setSender("system");
        message.setFormat("0");

        message.setId(System.currentTimeMillis());

        defaultMessagePusher.push(message);

        return Response.ok();
    }

}
