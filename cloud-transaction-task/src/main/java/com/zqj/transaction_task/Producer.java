package com.zqj.transaction_task;

import org.apache.activemq.command.ActiveMQQueue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsMessagingTemplate;
import org.springframework.stereotype.Component;

/**
 * mq消息发送
 * @author zqj
 * @create 2020-01-09 17:15
 */

@Component
public class Producer {
    @Autowired
    private JmsMessagingTemplate jmsMessagingTemplate;

    public void send(String queue,String msg){
        jmsMessagingTemplate.convertAndSend(new ActiveMQQueue(queue),msg);
    }


}
