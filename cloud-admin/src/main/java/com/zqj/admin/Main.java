package com.zqj.admin;

import de.codecentric.boot.admin.server.config.EnableAdminServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @author zqj
 * @create 2020-01-08 10:58
 */

@SpringBootApplication
@EnableDiscoveryClient
@EnableAdminServer
public class Main {

    public static void main(String[] args) {
        SpringApplication.run(Main.class,args);
    }
}
