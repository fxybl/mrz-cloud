package com.zqj.eureka_client;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.cloud.openfeign.EnableFeignClients;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @author zqj
 * @create 2019-12-31 16:28
 */

@SpringBootApplication(scanBasePackages = {"com.zqj.feign_api","com.zqj.eureka_client"})
@EnableDiscoveryClient
@EnableFeignClients(basePackages = "com.zqj.feign_api")
@EnableHystrix
@EnableSwagger2
public class Main {
    public static void main(String[] args) {
        //设置环境
        System.setProperty("env","DEV");
        SpringApplication.run(Main.class,args);
    }
}
