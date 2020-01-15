package com.zqj.seata.api.pojo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 账户表实体类
 * @author zqj
 * @create 2020-01-15 16:30
 */

@Data
public class Account {

    private Long id;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 总额度
     */
    private BigDecimal total;

    /**
     * 已用额度
     */
    private BigDecimal used;

    /**
     * 剩余额度
     */
    private BigDecimal residue;
}
