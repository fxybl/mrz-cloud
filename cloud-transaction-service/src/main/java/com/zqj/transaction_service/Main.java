package com.zqj.transaction_service;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author zqj
 * @create 2020-01-09 10:38
 */

@SpringBootApplication
@EnableFeignClients(basePackages = "com.zqj.transaction.message")
@EnableDiscoveryClient
@MapperScan("com.zqj.transaction_service.mapper")
public class Main {
    public static void main(String[] args) {
        System.setProperty("env","DEV");
        SpringApplication.run(Main.class,args);
    }
}
