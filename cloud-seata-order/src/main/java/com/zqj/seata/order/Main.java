package com.zqj.seata.order;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author zqj
 * @create 2020-01-16 10:19
 */
//去除spring的datasource的自动初始化，使用自定义的
@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
@EnableFeignClients(basePackages = "com.zqj.seata.api.remote")
@EnableDiscoveryClient
@MapperScan("com.zqj.seata.order.mapper")
public class Main {
    public static void main(String[] args) {
        System.setProperty("env","DEV");
        SpringApplication.run(Main.class,args);
    }
}
