package com.zqj;

import com.netflix.appinfo.InstanceInfo;
import org.springframework.cloud.netflix.eureka.server.event.*;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

/**
 * eureka事件监听
 *
 * @author zqj
 * @create 2019-12-30 17:12
 */

@Component
public class EurekaStatusListener {

    //EurekaInstanceCanceledEvent 服务下线事件
    @EventListener
    public void listen(EurekaInstanceCanceledEvent event) {
        System.err.println(event.getServerId()+"\t"+event.getAppName()+"服务已下线");
    }

    //EurekaInstanceRegisteredEvent服务注册事件
    @EventListener
    public void listen(EurekaInstanceRegisteredEvent event){
        InstanceInfo info = event.getInstanceInfo();
        System.err.println(info.getAppName()+"\t"+"进行注册");
    }

    //EurekaInstanceRenewedEvent服务在设置时间内连接不上了，然后再次连接上，事件
    @EventListener
    public void listen(EurekaInstanceRenewedEvent event){
        System.err.println(event.getServerId()+"\t"+event.getAppName()+"进行续约");
    }

    //EurekaRegistryAvailableEvent注册中心启动事件
    @EventListener
    public void listen(EurekaRegistryAvailableEvent event){
        System.err.println("注册中心  启动");
    }

    //EurekaServerStartedEvent服务启动成功事件
    @EventListener
    public void listen(EurekaServerStartedEvent event){
        System.err.println("eureka server 启动");
    }


}
