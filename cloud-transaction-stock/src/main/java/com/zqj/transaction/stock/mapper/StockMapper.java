package com.zqj.transaction.stock.mapper;

import com.zqj.transaction.stock.pojo.Stock;
import org.apache.ibatis.annotations.Param;

/**
 * @author zqj
 * @create 2020-01-10 10:22
 */
public interface StockMapper {
    Stock queryById(long i);

    void updateStock(@Param("id") long id, @Param("count") int count);
}
