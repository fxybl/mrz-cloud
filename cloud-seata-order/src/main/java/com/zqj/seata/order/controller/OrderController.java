package com.zqj.seata.order.controller;

import com.zqj.seata.api.remote.OrderRemote;
import com.zqj.seata.order.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zqj
 * @create 2020-01-16 10:22
 */

@RestController
public class OrderController implements OrderRemote {

    @Autowired
    private OrderService orderService;
}
