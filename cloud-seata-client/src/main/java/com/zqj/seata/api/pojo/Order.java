package com.zqj.seata.api.pojo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 订单表实体类
 * @author zqj
 * @create 2020-01-15 16:26
 */

@Data
public class Order {

    private Long id;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 商品ID
     */
    private Long productId;

    /**
     * 商品数量
     */
    private Integer count;

    /**
     * 订单金额
     */
    private BigDecimal money;

    /**
     * 订单状态，1:已创建; 0:创建中
     */
    private int status;
}
