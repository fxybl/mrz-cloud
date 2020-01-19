package com.zqj.transaction_service.enums;

/**
 *
 *消息消费状态枚举类
 * @author zqj
 * @create 2020-01-09 15:30
 */

public enum MessageEnum {

    /**
     * 消息死亡
     */
    DIE(2),

    /**
     * 消息已消费
     */
    OVER(1),

    /**
     * 消息等待消费
     */
    WAITING(0);

    private int status;

    MessageEnum(int status){
        this.status = status;
    }

    public int getStatus() {
        return status;
    }}
