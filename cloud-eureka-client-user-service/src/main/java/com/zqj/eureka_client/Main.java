package com.zqj.eureka_client;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author zqj
 * @create 2019-12-31 15:37
 */

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients
public class Main {

    public static void main(String[] args) {
        System.setProperty("env","DEV");
        SpringApplication.run(Main.class,args);
    }
}
