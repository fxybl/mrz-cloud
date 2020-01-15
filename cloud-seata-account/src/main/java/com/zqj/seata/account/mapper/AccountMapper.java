package com.zqj.seata.account.mapper;

import java.math.BigDecimal;

/**
 * @author zqj
 * @create 2020-01-15 17:27
 */
public interface AccountMapper {
    /**
     * 扣减用户金额
     * @param userId
     * @param money
     */
    void decrease(Long userId, BigDecimal money);
}
