package com.zqj.seata.order.service.impl;

import com.zqj.seata.order.mapper.OrderMapper;
import com.zqj.seata.order.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zqj
 * @create 2020-01-16 10:22
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;
}
