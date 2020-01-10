package com.zqj.eureka_client.controller;

import com.ctrip.framework.apollo.model.ConfigChangeEvent;
import com.ctrip.framework.apollo.spring.annotation.ApolloConfigChangeListener;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 测试apollo配置中心
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

    //监听某字段改变
    @ApolloConfigChangeListener
    private void someOnChange(ConfigChangeEvent changeEvent) {
        if(changeEvent.isChanged("article.server.port")) {
            System.out.println("article.server.port修改了");
        }
    }




}
