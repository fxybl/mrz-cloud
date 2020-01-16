package com.zqj.seata.storage.service;

/**
 * @author zqj
 * @create 2020-01-16 10:32
 */
public interface StorageService {
    /**
     * 扣减库存
     * @param productId
     * @param count
     */
    void decrease(Long productId, Integer count);
}
