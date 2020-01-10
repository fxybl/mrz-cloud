package com.zqj.transaction.order.service;

import java.math.BigDecimal;

/**
 * @author zqj
 * @create 2020-01-10 11:35
 */
public interface OrderService {

    void createOrder(long goodsId, BigDecimal money);

}
