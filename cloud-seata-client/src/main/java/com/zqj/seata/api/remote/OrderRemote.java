package com.zqj.seata.api.remote;

import org.springframework.cloud.openfeign.FeignClient;

/**
 * 订单远程调用客户端
 *
 * @author zqj
 * @create 2020-01-15 16:37
 */

@FeignClient(value = "cloud-seata-order-service", path = "/order")
public interface OrderRemote {
}
