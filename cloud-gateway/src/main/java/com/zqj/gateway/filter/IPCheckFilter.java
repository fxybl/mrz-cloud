package com.zqj.gateway.filter;

import com.alibaba.fastjson.JSON;
import com.zqj.common.base.ResponseCode;
import com.zqj.common.base.ResponseData;
import com.zqj.gateway.util.IPUtils;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;


/**
 *
 * IP过滤,对黑名单IP禁止访问
 * @author zqj
 * @create 2020-01-03 11:04
 */

@Component
public class IPCheckFilter implements GlobalFilter, Ordered {

    @Override
    public int getOrder() {
        //返回的值影响过滤器的执行顺序，数字越小，优先级越高（-1，0，1 ,pre -1,0,1，返回时post，1,0,-1）
        return 0;
    }

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        //实际中使用动态获取的方式获取黑名单IP
        if("127.0.0.1".equals(IPUtils.getIP(exchange.getRequest()))){
            ServerHttpResponse response = exchange.getResponse();
            ResponseData<Void> data = new ResponseData<>();
            data.setCode(ResponseCode.LIMIT_ERROR.getCode());
            data.setMessage(ResponseCode.LIMIT_ERROR.getMessage());
            //将结果转换成byte数组
            byte[] bytes = JSON.toJSONBytes(data);
            DataBuffer wrap = response.bufferFactory().wrap(bytes);
            //状态未授权
            response.setStatusCode(HttpStatus.UNAUTHORIZED);
            response.getHeaders().add("Content-Type","application/json;charset=UTF-8");
            return response.writeWith(Mono.just(wrap));
        }
        return chain.filter(exchange);
    }

}
