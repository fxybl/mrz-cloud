package com.zqj.transaction.order.pojo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author zqj
 * @create 2020-01-10 10:52
 */

@Data
public class Order {

    private Long id;

    private Long goodsId;

    //订单金额
    private BigDecimal money;
}
