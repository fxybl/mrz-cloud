package com.zqj.seata.storage.service.impl;

import com.zqj.seata.api.constant.RedisConstant;
import com.zqj.seata.api.pojo.Storage;
import com.zqj.seata.storage.mapper.StorageMapper;
import com.zqj.seata.storage.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author zqj
 * @create 2020-01-16 10:32
 */
@Service
public class StorageServiceImpl implements StorageService {

    @Autowired
    private StorageMapper storageMapper;
    @Autowired
    private RedisTemplate redisTemplate;

    @Override
    @Transactional
    public Storage decrease(Long productId, Integer count) {
        //先检查库存
        Storage storage = checkStorage(productId, count);
        //再扣减库存
        int result = storageMapper.decrease(storage.getProductId(), count, storage.getVersion());
        if (result == 0) {
            //乐观锁更新失败
            throw new RuntimeException("库存扣减失败，请稍后重试");
        }
        //分布式事务，在订单那里创建完成后redis的库存再减掉
        return storage;
    }

    //检查库存
    private Storage checkStorage(Long productId, Integer count) {
        //从缓存获取剩余库存
        Object residue_ = redisTemplate.opsForValue().get(productId + RedisConstant.STORAGE_RESIDUE);
        Storage storage;
        if (residue_ == null) {
            //如果没有获取到，说明没有缓存，那么从数据库查询一边，然后放进缓存
            storage = storageMapper.queryStorage(productId);
            redisTemplate.opsForValue().set(productId + RedisConstant.STORAGE_RESIDUE, storage.getResidue());
            redisTemplate.opsForValue().set(productId + RedisConstant.STORAGE_VERSION, storage.getVersion());
            return storage;
        }
        Integer residue = Integer.parseInt(residue_.toString());
        if (residue < count) {
            //剩余数量小于需求数量，库存不足
            throw new RuntimeException("库存不足");
        }
        //CAS更新的version值
        Integer version = Integer.parseInt(redisTemplate.opsForValue().get(productId + RedisConstant.STORAGE_VERSION).toString());
        storage = new Storage();
        storage.setProductId(productId);
        storage.setResidue(residue);
        storage.setVersion(version);
        return storage;
    }
}
