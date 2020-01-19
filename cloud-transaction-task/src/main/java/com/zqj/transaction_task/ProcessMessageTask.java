package com.zqj.transaction_task;

import com.zqj.transaction.message.TransactionRemoteClient;
import com.zqj.transaction.pojo.TransactionMessage;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Semaphore;

/**
 * 任务执行器
 *
 * @author zqj
 * @create 2020-01-09 17:19
 */

@Slf4j
@Component
public class ProcessMessageTask {

    @Autowired
    private TransactionRemoteClient remoteClient;

    @Autowired
    private Producer producer;

    @Autowired
    private RedissonClient redisson;

    //初始化一个10个线程的线程池去跑
    private ExecutorService executor = Executors.newFixedThreadPool(10);

    //最多一次性放行20个
    private Semaphore semaphore = new Semaphore(20);

    public void start() {

        Thread thread = new Thread(() -> {
            //轮询
            while (true) {
                //加一个分布式锁，一次只能一个人来拉取消息发送（实际中会进行集群，所以会多个服务调用此方法）
                final RLock lock = redisson.getLock("cloud-transaction-task");
                try {
                    lock.lock();
                    //消息没有读取完毕，会返回0，此时不用睡眠线程。
                    int sleepTime = process();
                    if (sleepTime > 0) {
                        Thread.sleep(sleepTime);
                    }
                } catch (Exception e) {
                    log.error("发送消息失败{}", e);
                } finally {
                    lock.unlock();
                }
            }
        });
        thread.start();
    }

    //发送消息
    private int process() throws Exception {
        //默认等待10秒
        int sleepTime = 10000;
        //查询等待消费的5000条数据出来
        List<TransactionMessage> transactionMessages = remoteClient.queryByWaitingMessage(5000);
        if (transactionMessages.size() == 5000) {
            //刚好等于5000，则有多余的数据没有查询出来
            sleepTime = 0;
        }
        //使用latch栅栏，等全部执行完成后，方法返回
        final CountDownLatch latch = new CountDownLatch(transactionMessages.size());
        for (final TransactionMessage message : transactionMessages) {
            //获取共享锁，最多同时20个
            semaphore.acquire();
            executor.execute(() -> {
                try {
                    doProcess(message);
                } catch (Exception e) {
                    log.error("发送消息失败{}", e);
                } finally {
                    //必须释放锁
                    semaphore.release();
                    latch.countDown();
                }
            });

        }
        return sleepTime;
    }

    //真正处理发送消息的方法
    private void doProcess(TransactionMessage message) {
        //如果满足死亡条件，让消息死亡
        if (message.getSendCount() >= message.getDieCount()) {
            //失败了不影响
            remoteClient.confirmDieMessage(message.getId());
            return;
        }
        //离上次发送的时间超过一分钟才继续发送
        long currentTime = System.currentTimeMillis();
        long sendTime = 0;
        if (message.getSendDate() != null) {
            sendTime = message.getSendDate().getTime();
        }
        if (currentTime - sendTime > 60000) {
            log.info("开始发送消息{}", message.getId());
            producer.send(message.getQueue(), message.getMessage());
            //增加发送次数
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String sendDate = format.format(new Date());
            //失败了也不影响
            remoteClient.incrSendCount(message.getId(), sendDate);
        }

    }

}
