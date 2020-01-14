package com.zqj.transaction.message;

import com.zqj.transaction.pojo.TransactionMessage;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 事务消息服务调用接口
 *
 * @author zqj
 * @create 2020-01-09 9:30
 */
@FeignClient(value = "cloud-transaction-service", path = "/message", fallback = TransactionRemoteClientHystrix.class)
public interface TransactionRemoteClient {

    /**
     * 发送消息，只保存到数据库表中，由其他的线程执行发送
     * @param message
     * @return
     */
    @PostMapping("/send")
    boolean sendMessage(@RequestBody TransactionMessage message);



    /**
     * 批量发送消息
     * @param messages
     * @return
     */
    @PostMapping("/sends")
    boolean sendMessages(@RequestBody List<TransactionMessage> messages);



    /**
     * 累加发送次数
     * @param messageId
     * @param sendDate
     * @return
     */
    @PostMapping("/incrSendCount")
    boolean incrSendCount(@RequestParam("messageId") Long messageId, @RequestParam("sendDate") String sendDate);



    /**
     * 确定消息死亡
     * @param messageId
     * @return
     */
    @PostMapping("/confirmDieMessage")
    boolean confirmDieMessage(@RequestParam("messageId") Long messageId);



    /**
     * 确定消息被消费
     * @param messageId
     * @param consumerSystem
     * @return
     */
    @PostMapping("/confirmCustomerMessage")
    boolean confirmCustomerMessage(@RequestParam("messageId") Long messageId,@RequestParam("consumerSystem") String consumerSystem);



    /**
     * 查询最早的没有被消费的消息
     * @param limit
     * @return
     */
    @GetMapping("/queryByWaitingMessage")
    List<TransactionMessage> queryByWaitingMessage(@RequestParam("limit") int limit);



    /**
     * 重新发送已经死亡的消息
     * @return
     */
    @PostMapping("/retrySendDieMessage")
    boolean retrySendDieMessage();


    /**
     * 根据状态分页查询消息
     * @param status
     * @param currentPage
     * @param pageSize
     * @return
     */
    @GetMapping("queryMessagePage")
    List<TransactionMessage> queryMessagePage(@RequestParam("status") int status, @RequestParam("currentPage") int currentPage, @RequestParam("pageSize") int pageSize);


}
