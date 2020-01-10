package com.zqj.transaction.order.mq;

import com.zqj.transaction.message.TransactionRemoteClient;
import com.zqj.transaction.order.pojo.Order;
import com.zqj.transaction.order.service.OrderService;
import com.zqj.transaction.pojo.TransactionMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.stereotype.Component;

import javax.jms.TextMessage;

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
            //手动确认
            text.acknowledge();
        }catch (Exception e){
            //异常时会触发重试机制，重试次数用完后还是错误，消息会进入DLQ队列
            throw new RuntimeException(e);
        }

    }
}
