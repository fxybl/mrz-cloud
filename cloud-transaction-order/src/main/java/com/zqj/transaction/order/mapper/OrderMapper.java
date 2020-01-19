package com.zqj.transaction.order.mapper;

import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;

/**
 * @author zqj
 * @create 2020-01-10 11:31
 */
public interface OrderMapper {

    void addOrder(@Param("goodsId") long goodsId, @Param("money") BigDecimal money);
}
