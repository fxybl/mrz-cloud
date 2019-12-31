package com.zqj.eureka_client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

/**
 * @author zqj
 * @create 2019-12-31 16:46
 */

@RestController
public class ArticleController {

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/article/callHello")
    public String callHello(){
        return restTemplate.getForObject("http://cloud-eureka-client-user-service/user/hello",String.class);
    }
}
