package com.zqj.my.apollo.config_service;

import com.google.common.collect.Lists;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.context.request.async.DeferredResult;

import java.util.List;

/**
 * spring的异步结果类DeferredResult的包装类
 * @author zqj
 * @create 2020-03-03 15:55
 */

public class DeferredResultWrapper {

    //默认60秒的超时时间
    private static final long TIMEOUT = 1000 * 60;

    //配置没有改变时，304的响应结果
    private static final ResponseEntity<List<MyApolloConfigNotification>> NOT_MODIFIED_RESPONSE_LIST =
            new ResponseEntity<>(HttpStatus.NOT_MODIFIED);

    //结果本尊,ResponseEntity是响应实体类，里面包含真实结果List<MyApolloConfigNotification>
    private DeferredResult<ResponseEntity<List<MyApolloConfigNotification>>> result;

    //默认的构造函数，为超时60秒，响应结果304
    public DeferredResultWrapper(){
        result = new DeferredResult<>(TIMEOUT,NOT_MODIFIED_RESPONSE_LIST);
    }

    //设置超时后执行函数
    public void onTimeout(Runnable timeout){
        result.onTimeout(timeout);
    }

    //设置正常完成后执行的函数
    public void onComplete(Runnable complete){
        result.onCompletion(complete);
    }

    //设置单个结果
    public void setResult(MyApolloConfigNotification notification){
        setResult(Lists.newArrayList(notification));
    }
    //设置多个结果
    public void setResult(List<MyApolloConfigNotification> notifications){
        result.setResult(new ResponseEntity<>(notifications,HttpStatus.OK));
    }

    //获取结果
    public DeferredResult<ResponseEntity<List<MyApolloConfigNotification>>> getResult(){
        return result;
    }






}
