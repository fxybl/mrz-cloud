package com.zqj.transaction_service.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zqj.transaction.pojo.TransactionMessage;
import com.zqj.transaction_service.mapper.TransactionMessageMapper;
import com.zqj.transaction_service.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author zqj
 * @create 2020-01-09 11:44
 */

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private TransactionMessageMapper mapper;

    @Transactional
    @Override
    public boolean sendMessage(TransactionMessage message) {
         mapper.save(message);
         return true;
    }

    @Transactional
    @Override
    public boolean sendMessage(List<TransactionMessage> messages) {
        mapper.saveBatch(messages);
        return true;
    }


    @Transactional
    @Override
    public boolean retrySendDieMessage() {
        mapper.retrySendDieMessage();
        return true;
    }

    @Transactional
    @Override
    public boolean incrSendCount(Long messageId, String sendDate) {
        TransactionMessage message = mapper.queryMessage(messageId);
        mapper.updateSendCount(messageId,sendDate,message.getSendCount()+1);
        return true;
    }

    @Override
    public Page<TransactionMessage> queryMessagePage(int status, int currentPage, int pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        return (Page<TransactionMessage>) mapper.queryMessages(status);
    }

    @Override
    public List<TransactionMessage> queryByWaitingMessage(int limit) {
        return mapper.queryMessagesLimit(limit);
    }

    @Transactional
    @Override
    public boolean confirmCustomerMessage(Long messageId, int status, String consumerSystem) {
        mapper.confirmCustomerMessage(messageId,status,consumerSystem);
        return true;
    }

    @Transactional
    @Override
    public boolean confirmDieMessage(Long messageId, int status) {
        mapper.confirmDieMessage(messageId,status);
        return true;
    }
}
