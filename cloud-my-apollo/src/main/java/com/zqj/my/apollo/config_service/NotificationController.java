package com.zqj.my.apollo.config_service;

import com.google.common.collect.HashMultimap;
import com.google.common.collect.Lists;
import com.google.common.collect.Multimap;
import com.google.common.collect.Multimaps;
import org.springframework.http.ResponseEntity;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.async.DeferredResult;

import java.util.ArrayList;
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
    public static Queue<String> poll = new LinkedBlockingQueue<>();


    //guava的同步线程安全的map,value是个List
    private final Multimap<String,DeferredResultWrapper> deferredResults = Multimaps.synchronizedSetMultimap(HashMultimap.create());

    @GetMapping("addMsg")
    public String addMsg(){
        poll.add("ps");
        return "ok";
    }

    @GetMapping("/getConfig")
    public DeferredResult<ResponseEntity<List<MyApolloConfigNotification>>> getConfig(){
        //定义一个需要反悔的结果包装类
        DeferredResultWrapper wrapper = new DeferredResultWrapper();
        //获取所有变化的通知ID
        List<MyApolloConfigNotification> apolloNotifications = getApolloNotifications();
        if(!CollectionUtils.isEmpty(apolloNotifications)){
            //如果有配置发生了变化，
            //直接设置结果为变化的配置通知
            wrapper.setResult(apolloNotifications);
        }else {
            //如果没有配置发生变化
            //则定义异步结果的超时时间事件以及完成事件
            wrapper.onTimeout(()->{
                //超时后执行的事件
                System.err.println("获取配置超时了");
            });
            wrapper.onComplete(() ->{
                System.err.println("正确的获取到了配置");
            });
            //设置完成后，在全局变量中加入此wrapper,使得定时任务如果获取到了变化的配置（(handleMessage()中的get("test))），将把配置通知结果注入到此wrapper中
            deferredResults.put("test",wrapper);
        }
        return wrapper.getResult();
    }

    //如果配置有变化，就获取所有的通知ID，获取后，便通过通知ID去找到对应的变化的配置
    private List<MyApolloConfigNotification> getApolloNotifications(){
        List<MyApolloConfigNotification> list = new ArrayList();
        String result = NotificationController.poll.poll();
        if(result != null){
            //队列不为空，说明配置不为空，获取变化的配置通知ID（随便加一个）
            list.add(new MyApolloConfigNotification("ns","no111"));
        }
        return list;
    }

    //处理消息内容
    public void handMessage(Message message){
        System.err.println("处理的消息内容:"+message);
        List<DeferredResultWrapper> results = Lists.newArrayList(deferredResults.get("test"));
        for(DeferredResultWrapper wrapper : results){
            //队列不为空，说明配置不为空，获取变化的配置通知ID（随便加一个，同上）
            List<MyApolloConfigNotification> list = new ArrayList();
            list.add(new MyApolloConfigNotification("ns","no111"));
            wrapper.setResult(list);
        }
    }


}
