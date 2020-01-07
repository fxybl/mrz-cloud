package com.zqj.eureka_client.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zqj
 * @create 2020-01-07 10:03
 */

@RestController
public class ApolloController {

    @Value("${article.server.port}")
    private String port;

    //测试
    @GetMapping("/article/port")
    public String getPort(){
        return port;
    }




}
