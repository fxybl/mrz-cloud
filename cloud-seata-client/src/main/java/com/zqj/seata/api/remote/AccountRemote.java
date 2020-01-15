package com.zqj.seata.api.remote;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;

/**
 * 账户远程客户端
 *
 * @author zqj
 * @create 2020-01-15 16:36
 */

@FeignClient(value = "cloud-seata-account-service", path = "/account")
public interface AccountRemote {

    /**
     * 扣减用户余额
     * @param userId
     * @param money
     */
    @PostMapping("/decrease")
    void decrease(@RequestParam("userId") Long userId,@RequestParam("money") BigDecimal money);
}
