package com.zqj.seata.order.controller;

import com.zqj.seata.api.pojo.Order;
import com.zqj.seata.api.resp.Result;
import com.zqj.seata.order.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zqj
 * @create 2020-01-16 10:22
 */

@RestController
@RequestMapping("/order")
@Validated
public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping("/create")
    public Result createOrder(@Validated Order order){
        orderService.createOrder(order);
        return new Result();
    }


}
