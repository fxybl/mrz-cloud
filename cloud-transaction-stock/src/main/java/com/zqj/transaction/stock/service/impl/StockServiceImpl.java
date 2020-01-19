package com.zqj.transaction.stock.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.zqj.transaction.message.TransactionRemoteClient;
import com.zqj.transaction.pojo.TransactionMessage;
import com.zqj.transaction.stock.mapper.StockMapper;
import com.zqj.transaction.stock.pojo.Stock;
import com.zqj.transaction.stock.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * @author zqj
 * @create 2020-01-10 10:20
 */
@Service
public class StockServiceImpl implements StockService {

    @Autowired
    private TransactionRemoteClient remoteClient;
    @Autowired
    private StockMapper stockMapper;

    @Transactional
    @Override
    public void buy() {
        //本地更新
        Stock stock = stockMapper.queryById(1);
        long stockId = 1L;
        stockMapper.updateStock(stockId,1);
        //发送消息，远程添加订单
        TransactionMessage message = new TransactionMessage();
        message.setQueue("order_create_queue");
        message.setCreateDate(new Date());
        message.setSendSystem("cloud-transaction-stock");
        JSONObject json = new JSONObject();
        json.put("goodsId",stock.getGoodsId());
        message.setMessage(json.toJSONString());
        //加入了hystrix熔断器，抛出异常超时都会返回false
        Integer result = remoteClient.sendMessage(message);
        if(result==null){
            //回滚
            throw new RuntimeException("失败，回滚");
        }
    }
}
