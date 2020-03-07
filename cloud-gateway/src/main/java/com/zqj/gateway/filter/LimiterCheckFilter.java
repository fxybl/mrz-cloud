package com.zqj.gateway.filter;

import com.google.common.util.concurrent.RateLimiter;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.concurrent.TimeUnit;


/**
 *
 * 限流
 * @author zqj
 * @create 2020-01-03 11:04
 */

@Component
public class LimiterCheckFilter implements GlobalFilter, Ordered {

    //每秒100并发,即创建100个令牌桶
    public static volatile RateLimiter rateLimiter  = RateLimiter.create(100.0);

    @Override
    public int getOrder() {
        //返回的值影响过滤器的执行顺序，数字越小，优先级越高（-1，0，1 ,pre -1,0,1，返回时post，1,0,-1）
        return 0;
    }

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        //使用guava提供的限流
        //如果在10微秒内获取到了锁，则不拦截，否则拦截，，，以此来实现限流
        if(!rateLimiter.tryAcquire(10, TimeUnit.MICROSECONDS)){
            ServerHttpResponse response = exchange.getResponse();
            return response.writeWith(null);
        }
        return chain.filter(exchange);
    }

}
