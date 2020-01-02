package com.zqj.feign_api.student;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author zqj
 * @create 2020-01-02 11:38
 */

@FeignClient("cloud-eureka-client-user-service")
public interface StudentRemoteClient {

    @GetMapping("/student/info")
    //不加RequestParam会报Request method 'POST' not supported（即便使用的get请求，也会报这个错误）
    Student getStudent(@RequestParam("name") String name);


}
