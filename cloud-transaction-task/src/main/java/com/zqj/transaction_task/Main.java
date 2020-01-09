package com.zqj.transaction_task;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author zqj
 * @create 2020-01-09 16:25
 */

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients(basePackages = "com.zqj.transaction.message")
public class Main {
    public static void main(String[] args) {
        SpringApplication.run(Main.class,args);
    }
}
