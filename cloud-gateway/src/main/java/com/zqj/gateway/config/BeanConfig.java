package com.zqj.gateway.config;

import org.springframework.cloud.gateway.filter.ratelimit.KeyResolver;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import reactor.core.publisher.Mono;

/**
 * 限流bean
 * @author zqj
 * @create 2020-01-03 16:14
 */

@Configuration
public class BeanConfig {

    //使用IP进行限流
    @Bean
    public KeyResolver ipKeyResolver(){
     return exchange ->
             //IP作为唯一标识
         Mono.just(exchange.getRequest().getRemoteAddress().getHostName());
    }

    //使用用户进行限流
    @Bean
    public KeyResolver userKeyResolver(){
        return exchange ->
                //用户ID作为唯一标识
                Mono.just(exchange.getRequest().getQueryParams().getFirst("userId"));
    }

    //使用请求地址进行限流
    @Bean
    public KeyResolver uriKeyResolver(){
        return exchange ->
                //地址作为唯一标识
                Mono.just(exchange.getRequest().getPath().value());
    }


}
