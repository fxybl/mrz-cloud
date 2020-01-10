package com.zqj.transaction.order.service.impl;

import com.zqj.transaction.order.mapper.OrderMapper;
import com.zqj.transaction.order.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

/**
 * @author zqj
 * @create 2020-01-10 11:36
 */

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public void createOrder(long goodsId, BigDecimal money) {
        orderMapper.addOrder(goodsId,money);
    }
}
