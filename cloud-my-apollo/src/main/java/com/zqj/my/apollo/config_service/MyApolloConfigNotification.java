package com.zqj.my.apollo.config_service;

import lombok.Data;

/**
 * 通知类
 * @author zqj
 * @create 2020-03-03 15:59
 */

@Data
public class MyApolloConfigNotification {

    //命名空间，相当于独立的容器
    private String namespace;
    //每个命名空间的对应的通知ID
    private String notificationId;

    public MyApolloConfigNotification(String namespace,String notificationId){
        this.namespace = namespace;
        this.notificationId = notificationId;
    }
}
