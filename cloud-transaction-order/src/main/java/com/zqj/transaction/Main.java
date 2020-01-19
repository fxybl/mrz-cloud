package com.zqj.transaction;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author zqj
 * @create 2020-01-10 10:50
 */

@SpringBootApplication(scanBasePackages = "com.zqj")
@EnableDiscoveryClient
@EnableFeignClients(basePackages = "com.zqj.transaction.message")
@MapperScan("com.zqj.transaction.order.mapper")
public class Main {
    public static void main(String[] args) {
        SpringApplication.run(Main.class,args);
    }
}
