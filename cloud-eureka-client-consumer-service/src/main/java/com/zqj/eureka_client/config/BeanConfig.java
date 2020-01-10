package com.zqj.eureka_client.config;

import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

/**
 * @author zqj
 * @create 2019-12-31 16:30
 */

@Configuration
public class BeanConfig {

    @Bean
    //这个注解会自动构建LoadBalancerClient接口的实现类并注册到spring容器中,
    //启用ribbon负载均衡,根据负载均衡策略请求集群中的一个服务实例
    //ribbon会自动将服务名字组装成对应的IP地址
    @LoadBalanced
    public RestTemplate getRestTemplate(){
        return new RestTemplate();
    }
}
