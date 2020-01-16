package com.zqj.seata.order.service.impl;

import com.zqj.seata.api.pojo.Order;
import com.zqj.seata.api.remote.AccountRemote;
import com.zqj.seata.api.remote.StorageRemote;
import com.zqj.seata.order.mapper.OrderMapper;
import com.zqj.seata.order.service.OrderService;
import io.seata.spring.annotation.GlobalTransactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author zqj
 * @create 2020-01-16 10:22
 */
@Service
@Slf4j
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private StorageRemote storageRemote;
    @Autowired
    private AccountRemote accountRemote;

    @Override
    @GlobalTransactional(name = "seata-create-order",rollbackFor = Exception.class)
    @Transactional
    public void createOrder(Order order) {
        log.info("订单号{}:交易开始",order.getId());
        //本地创建订单
        orderMapper.create(order);
        //远程调用，扣减库存
        storageRemote.decrease(order.getProductId(),order.getCount());
        //远程调用，扣用户资金
        accountRemote.decrease(order.getUserId(),order.getMoney());
        log.info("订单号{}:交易结束",order.getId());
    }
}