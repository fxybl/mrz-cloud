package com.zqj.transaction.stock.mapper;

import com.zqj.transaction.stock.pojo.Stock;

/**
 * @author zqj
 * @create 2020-01-10 10:22
 */
public interface StockMapper {
    Stock queryById(long i);

    void updateStock(long id, int count);
}
