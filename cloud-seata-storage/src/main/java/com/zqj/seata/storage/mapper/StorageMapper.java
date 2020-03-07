package com.zqj.seata.storage.mapper;

import com.zqj.seata.api.pojo.Storage;
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
    int decrease(@Param("productId") Long productId, @Param("count") Integer count,@Param("version") Integer version);

    /**
     * 查询库存
     * @param productId
     * @return
     */
    Storage queryStorage(@Param("productId") Long productId);
}
