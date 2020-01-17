package com.zqj.seata.account.service.impl;

import com.zqj.seata.account.mapper.AccountMapper;
import com.zqj.seata.account.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

/**
 * @author zqj
 * @create 2020-01-15 17:23
 */
@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountMapper accountMapper;

    @Transactional
    @Override
    public void decrease(Long userId, BigDecimal money) {
        accountMapper.decrease(userId,money);
        //去掉注释，测试分布式事务
        //throw new RuntimeException("");
    }
}
