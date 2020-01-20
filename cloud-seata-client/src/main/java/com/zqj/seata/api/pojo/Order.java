package com.zqj.seata.api.pojo;

import lombok.Data;

import javax.validation.constraints.NotNull;
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
    @NotNull(message = "用户ID不可为空")
    private Long userId;

    /**
     * 商品ID
     */
    @NotNull(message = "商品ID不可为空")
    private Long productId;

    /**
     * 商品数量
     */
    @NotNull(message = "商品数量不可为空")
    private Integer count;

    /**
     * 订单金额
     */
    @NotNull(message = "订单金额不可为空")
    private BigDecimal money;

    /**
     * 订单状态，1:已创建; 0:创建中
     */
    private int status;
}
