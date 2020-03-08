package com.zqj.my.apollo.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *  测试自己写的PropertySource等
 * @author zqj
 * @create 2020-03-08 17:41
 */

@RestController
public class ConfigController {

    @Value("${mrz}")
    private String name;

    @GetMapping("/getName")
    public String getName(){
        return name;
    }
}
