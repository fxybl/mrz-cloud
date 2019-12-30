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

    @EventListener
    public void listen(EurekaInstanceCanceledEvent event) {
        System.err.println(event.getServerId()+"\t"+event.getAppName()+"服务已下线");
    }

    @EventListener
    public void listen(EurekaInstanceRegisteredEvent event){
        InstanceInfo info = event.getInstanceInfo();
        System.err.println(info.getAppName()+"\t"+"进行注册");
    }

    @EventListener
    public void listen(EurekaInstanceRenewedEvent event){
        System.err.println(event.getServerId()+"\t"+event.getAppName()+"进行续约");
    }

    @EventListener
    public void listen(EurekaRegistryAvailableEvent event){
        System.err.println("注册中心  启动");
    }

    @EventListener
    public void listen(EurekaServerStartedEvent event){
        System.err.println("eureka server 启动");
    }


}
