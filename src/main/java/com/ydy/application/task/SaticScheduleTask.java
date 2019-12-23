package com.ydy.application.task;

import com.ydy.application.service.department.DepartmentsDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import java.time.LocalDateTime;

@Configuration      //1.主要用于标记配置类，兼备Component的效果。
@EnableScheduling   // 2.开启定时任务
public class SaticScheduleTask {

    @Autowired
    private DepartmentsDataService dataService;

    //  模拟设备向服务器发送数据
    @Scheduled(cron = "0 */1 * * * ?")
    private void configureTasks() {
        System.out.println("执行静态定时任务时间: " + LocalDateTime.now());
        dataService.deivceSendData();
    }

    //  模拟向客户端发送数据
    @Scheduled(cron = "30 */1 * * * ?")
    private void sendClient() {
        System.out.println("=========向客户端发送数据: " + LocalDateTime.now());
        dataService.sendClient();
    }
}