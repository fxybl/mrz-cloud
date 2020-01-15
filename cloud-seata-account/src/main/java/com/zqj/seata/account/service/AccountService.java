package com.zqj.seata.account.service;

import java.math.BigDecimal;

/**
 * @author zqj
 * @create 2020-01-15 17:22
 */
public interface AccountService {

    /**
     * 账户扣除金额
     * @param userId
     * @param money
     */
    void decrease(Long userId, BigDecimal money);
}
