package com.zqj.transaction.stock.pojo;

import lombok.Data;

/**
 * @author zqj
 * @create 2020-01-10 10:24
 */

@Data
public class Stock {

    private Long id;


    private Long goodsId;

    //库存
    private int count;
}
