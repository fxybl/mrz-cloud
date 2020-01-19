package com.zqj.transaction.stock.controller;

import com.zqj.transaction.stock.service.StockService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zqj
 * @create 2020-01-10 10:16
 */

@RestController
@Slf4j
public class StockController {

    @Autowired
    private StockService stockService;

    @PostMapping("/goods/buy")
    public boolean buy(){
        try {
            stockService.buy();
            return true;
        }catch (Exception e){
            log.error("发生异常，异常原因：{}",e);
            return false;
        }

    }


}
