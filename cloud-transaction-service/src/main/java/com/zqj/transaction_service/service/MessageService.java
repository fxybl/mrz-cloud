package com.zqj.transaction_service.service;

import com.github.pagehelper.Page;
import com.zqj.transaction.pojo.TransactionMessage;

import java.util.List;

/**
 * @author zqj
 * @create 2020-01-09 11:44
 */
public interface MessageService {


    Integer sendMessage(TransactionMessage message);

    boolean sendMessage(List<TransactionMessage> messages);

    boolean retrySendDieMessage();

    boolean incrSendCount(Long messageId, String sendDate);

    Page<TransactionMessage> queryMessagePage(int status, int currentPage, int pageSize);

    List<TransactionMessage> queryByWaitingMessage(int limit);

    boolean confirmCustomerMessage(Long messageId, int status,String consumerSystem);

    boolean confirmDieMessage(Long messageId, int status);
}
