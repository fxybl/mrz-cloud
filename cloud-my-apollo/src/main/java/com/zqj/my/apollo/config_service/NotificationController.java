package com.zqj.my.apollo.config_service;

import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import com.google.common.collect.Multimaps;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.async.DeferredResult;

import java.util.List;
import java.util.Queue;
import java.util.concurrent.LinkedBlockingQueue;

/**
 * 通知controller
 * @author zqj
 * @create 2020-03-03 16:38
 */

@RestController
@RequestMapping("/my_apollo_config_service")
public class NotificationController {

    //无限队列，模拟存储配置更改的容器
    private static Queue<String> poll = new LinkedBlockingQueue<>();

    //guava的同步线程安全的map,value是个List
    private final Multimap<String,DeferredResultWrapper> deferredResults = Multimaps.synchronizedSetMultimap(HashMultimap.create());

    @GetMapping("/getMapping")
    public DeferredResult<ResponseEntity<List<MyApolloConfigNotification>>> getConfig(){
        return null;
    }

    //如果配置有变化，就获取所有的通知ID，获取后，便通过通知ID去找到对应的变化的配置
    private List<MyApolloConfigNotification> getApolloNotifications(){
        return null;
    }

    //处理消息内容
    public void handMessage(Message message){
        System.err.println("处理的消息内容:"+message);


    }


}
