package com.zqj.transaction.order.mq;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zqj.transaction.message.TransactionRemoteClient;
import com.zqj.transaction.order.service.OrderService;
import com.zqj.transaction.pojo.TransactionMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.stereotype.Component;

import javax.jms.TextMessage;
import java.math.BigDecimal;

/**
 * 消息消费者
 * @author zqj
 * @create 2020-01-10 11:36
 */

@Component
public class OrderMqConsumer {

    @Autowired
    private TransactionRemoteClient remoteClient;

    @Autowired
    private OrderService orderService;

    @JmsListener(destination = "order_create_queue")
    public void createOrderQueue(TextMessage text){
        try {
            //消息内容
            JSONObject json = JSONObject.parseObject(text.getText());
            //创建订单
            orderService.createOrder(json.getLong("goodsId"),new BigDecimal(100));
            boolean result = remoteClient.confirmCustomerMessage(json.getLong("messageId"),"cloud-transaction-order");
            if(!result){
                //确定失败，回滚
                throw new RuntimeException("确定消息消费失败");
            }
            //手动确认
            text.acknowledge();
        }catch (Exception e){
            //异常时会触发重试机制，重试次数用完后还是错误，消息会进入DLQ队列(死信队列)
            throw new RuntimeException(e);
        }

    }
}
