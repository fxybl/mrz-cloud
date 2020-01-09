package com.zqj.transaction_service.controller;

import com.zqj.transaction.message.TransactionRemoteClient;
import com.zqj.transaction.pojo.TransactionMessage;
import com.zqj.transaction_service.enums.MessageEnum;
import com.zqj.transaction_service.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

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
        return messageService.incrSendCount(messageId,sendDate);
    }

    @Override
    public boolean retrySendDieMessage() {
        return messageService.retrySendDieMessage();
    }

    @Override
    public boolean confirmCustomerMessage(Long messageId) {
        return messageService.updateStatus(messageId, MessageEnum.OVER.getStatus());
    }

    @Override
    public boolean confirmDieMessage(Long messageId) {
        return messageService.updateStatus(messageId, MessageEnum.DIE.getStatus());
    }

    @Override
    public List<TransactionMessage> queryByWaitingMessage(int limit) {
        return messageService.queryByWaitingMessage(limit);
    }

    @Override
    public List<TransactionMessage> queryMessagePage(int status, int currentPage, int pageSize) {
        return messageService.queryMessagePage(status,currentPage,pageSize);
    }


}
