package com.zqj.seata.api.pojo;

import lombok.Data;

/**
 * 库存表实体类
 * @author zqj
 * @create 2020-01-15 16:32
 */

@Data
public class Storage {

    private Long id;

    /**
     * 商品ID
     */
    private Long productId;

    /**
     * 总库存
     */
    private Integer total;

    /**
     * 已用库存
     */
    private Integer used;

    /**
     * 剩余库存
     */
    private Integer residue;
}
