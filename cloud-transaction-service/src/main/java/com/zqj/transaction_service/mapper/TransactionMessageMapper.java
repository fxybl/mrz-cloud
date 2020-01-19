package com.zqj.transaction_service.mapper;

import com.zqj.transaction.pojo.TransactionMessage;

import java.util.List;

/**
 * @author zqj
 * @create 2020-01-09 14:08
 */
public interface TransactionMessageMapper {

    void save(TransactionMessage message);

    void saveBatch(List<TransactionMessage> messages);

    void updateStatus(Long messageId, int status,String consumerSystem);

    void retrySendDieMessage();

    TransactionMessage queryMessage(Long messageId);

    void updateSendCount(Long messageId, String sendDate, int count);

    List<TransactionMessage> queryMessages(int status);

    List<TransactionMessage> queryMessagesLimit(int limit);
}
