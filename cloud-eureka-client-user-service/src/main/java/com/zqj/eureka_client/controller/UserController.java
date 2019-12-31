package com.zqj.eureka_client.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zqj
 * @create 2019-12-31 16:03
 */

@RestController
public class UserController {

    @GetMapping("/user/hello")
    public String hello() {
        return "hello";
    }
}
