package com.zqj.seata.storage.mapper;

import org.apache.ibatis.annotations.Param;

/**
 * @author zqj
 * @create 2020-01-16 10:30
 */
public interface StorageMapper {
    /**
     * 扣减库存
     * @param productId
     * @param count
     */
    void decrease(@Param("productId") Long productId, @Param("count") Integer count);
}
