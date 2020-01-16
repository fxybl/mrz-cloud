package com.zqj.seata.storage.service.impl;

import com.zqj.seata.storage.mapper.StorageMapper;
import com.zqj.seata.storage.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zqj
 * @create 2020-01-16 10:32
 */
@Service
public class StorageServiceImpl implements StorageService {

    @Autowired
    private StorageMapper storageMapper;

    @Override
    public void decrease(Long productId, Integer count) {
        storageMapper.decrease(productId,count);
    }
}
