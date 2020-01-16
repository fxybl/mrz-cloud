package com.zqj.seata.order.mapper;

import com.zqj.seata.api.pojo.Order;

/**
 * @author zqj
 * @create 2020-01-16 10:20
 */
public interface OrderMapper {
    void create(Order order);
}
