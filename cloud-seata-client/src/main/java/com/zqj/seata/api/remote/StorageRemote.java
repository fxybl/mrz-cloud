package com.zqj.seata.api.remote;

import com.zqj.seata.api.pojo.Storage;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 库存远程调用客户端
 * @author zqj
 * @create 2020-01-15 16:37
 */

@FeignClient(value = "cloud-seata-storage-service")
public interface StorageRemote {

    /**
     * 扣减库存
     * @param productId
     * @param count
     */
    @PostMapping("/storage/decrease")
    Storage decrease(@RequestParam("productId")Long productId, @RequestParam("count") Integer count);


}
