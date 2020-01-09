package com.zqj.transaction.pojo;

import lombok.Data;

import java.util.Date;

/**
 * 事务消息实体类
 * @author zqj
 * @create 2020-01-08 18:01
 */

@Data
public class TransactionMessage {

    //消息ID
    private Long id;

    //消息内容,json格式
    private String message;

    //发送的队列
    private String queue;

    //哪个系统发送的
    private String sendSystem;

    //发送次数
    private int sendCount;

    //消息创建的时间
    private Date createDate;

    //最近一次发送消息的时间,每发送一次更新一次
    private Date sendDate;

    //状态：0等待消费  1已消费 2已死亡(默认0)
    private int status;

    //死亡条件，重发多少次后还是失败，标记为死亡消息（默认10次）
    private int dieCount=10;

    //消息被消费的时间
    private Date customerDate;

    //哪个系统消费了消息
    private String customerSystem;

    //消息死亡时间
    private Date dieDate;

}
