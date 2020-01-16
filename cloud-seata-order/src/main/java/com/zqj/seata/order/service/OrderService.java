package com.zqj.seata.order.service;

import com.zqj.seata.api.pojo.Order;

/**
 * @author zqj
 * @create 2020-01-16 10:21
 */

public interface OrderService {
    /**
     * 创建订单
     * @param order
     */
    void createOrder(Order order);
}
