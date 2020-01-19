package com.zqj.transaction.message;

import com.zqj.transaction.pojo.TransactionMessage;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * 事务消息的熔断器
 * @author zqj
 * @create 2020-01-09 9:32
 */

@Component
public class TransactionRemoteClientHystrix implements TransactionRemoteClient {

    @Override
    public Integer sendMessage(TransactionMessage message) {
        return null;
    }

    @Override
    public boolean sendMessages(List<TransactionMessage> messages) {
        return false;
    }

    @Override
    public boolean incrSendCount(Long messageId, String sendDate) {
        return false;
    }

    @Override
    public boolean retrySendDieMessage() {
        return false;
    }

    @Override
    public boolean confirmCustomerMessage(Long messageId,String consumerSystem) {
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
