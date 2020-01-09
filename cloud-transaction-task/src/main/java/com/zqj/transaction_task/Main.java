package com.zqj.transaction_task;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.ConfigurableApplicationContext;

import java.util.concurrent.CountDownLatch;

/**
 * @author zqj
 * @create 2020-01-09 16:25
 */

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients(basePackages = "com.zqj.transaction.message")
public class Main {
    public static void main(String[] args) {
        ConfigurableApplicationContext context = SpringApplication.run(Main.class, args);
        ProcessMessageTask task = context.getBean(ProcessMessageTask.class);
        task.start();
        //让主线程睡眠
        try {
            new CountDownLatch(1).await();
        } catch (InterruptedException e) {
            System.out.println("线程启动异常");
        }

    }
}
