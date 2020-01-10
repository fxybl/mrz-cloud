package com.zqj.transaction.order.mapper;

import java.math.BigDecimal;

/**
 * @author zqj
 * @create 2020-01-10 11:31
 */
public interface OrderMapper {

    void addOrder(long goodsId, BigDecimal money);
}
