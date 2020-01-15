package com.zqj.seata.account.controller;

import com.zqj.seata.account.service.AccountService;
import com.zqj.seata.api.remote.AccountRemote;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;

/**
 * @author zqj
 * @create 2020-01-15 17:21
 */

@RestController
public class AccountController implements AccountRemote {

    @Autowired
    private AccountService accountService;

    /**
     * 扣除用户金额
     * @param userId
     * @param money
     */
    @Override
    public void decrease(Long userId, BigDecimal money) {
        accountService.decrease(userId,money);
    }
}
