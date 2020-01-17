package com.zqj.seata.account;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author zqj
 * @create 2020-01-15 17:18
 */

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients(basePackages = "com.zqj.seata.api.remote")
public class Main {
    public static void main(String[] args) {
        System.setProperty("env","DEV");
        SpringApplication.run(Main.class,args);
    }
}
