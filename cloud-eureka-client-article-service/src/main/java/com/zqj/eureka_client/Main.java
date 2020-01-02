package com.zqj.eureka_client;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author zqj
 * @create 2019-12-31 16:28
 */

@SpringBootApplication(scanBasePackages = {"com.zqj.feign_api","com.zqj.eureka_client"})
@EnableDiscoveryClient
@EnableFeignClients(basePackages = "com.zqj.feign_api")
@EnableHystrix
public class Main {
    public static void main(String[] args) {
        SpringApplication.run(Main.class,args);
    }
}
