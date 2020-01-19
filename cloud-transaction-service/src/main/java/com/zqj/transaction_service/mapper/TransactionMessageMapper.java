package com.zqj.transaction_service.mapper;

import com.zqj.transaction.pojo.TransactionMessage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zqj
 * @create 2020-01-09 14:08
 */
public interface TransactionMessageMapper {

    Integer save(TransactionMessage message);

    void saveBatch(List<TransactionMessage> messages);

    void retrySendDieMessage();

    TransactionMessage queryMessage(Long messageId);

    void updateSendCount(Long messageId, String sendDate, int count);

    List<TransactionMessage> queryMessages(int status);

    List<TransactionMessage> queryMessagesLimit(int limit);

    void confirmCustomerMessage(@Param("messageId") Long messageId,@Param("status") int status, @Param("consumerSystem") String consumerSystem);

    void confirmDieMessage(@Param("messageId") Long messageId, @Param("status") int status);
}
