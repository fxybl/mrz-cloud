package com.zqj.feign_api.student;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author zqj
 * @create 2020-01-02 11:38
 */

@FeignClient("cloud-eureka-client-user-service")
public interface StudentRemoteClient {

    @GetMapping("/student/info")
    Student getStudent(String name);


}
