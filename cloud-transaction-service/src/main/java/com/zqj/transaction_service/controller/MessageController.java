package com.zqj.transaction_service.controller;

import com.zqj.transaction.message.TransactionRemoteClient;
import com.zqj.transaction.pojo.TransactionMessage;
import com.zqj.transaction_service.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * 消息处理controller
 * @author zqj
 * @create 2020-01-09 10:43
 */

@RestController
public class MessageController implements TransactionRemoteClient {

    @Autowired
    private MessageService messageService;

    @Override
    public boolean sendMessage(TransactionMessage message) {
        return messageService.sendMessage(message);
    }

    @Override
    public boolean sendMessages(List<TransactionMessage> messages) {
        return messageService.sendMessage(messages);
    }

    @Override
    public boolean incrSendCount(Long messageId, String sendDate) {
        return false;
    }

    @Override
    public boolean retrySendDieMessage(String ids) {
        return false;
    }

    @Override
    public boolean confirmCustomerMessage(Long messageId) {
        return false;
    }

    @Override
    public boolean confirmDieMessage(Long messageId) {
        return false;
    }

    @Override
    public List<TransactionMessage> queryByWaitingMessage(int limit) {
        return new ArrayList<>();
    }

    @Override
    public List<TransactionMessage> queryMessagePage(int status, int currentPage, int pageSize) {
        return new ArrayList<>();
    }


}
