package com.zqj.my.apollo.client;


import com.zqj.my.apollo.utils.HttpUtils;

/**
 * 客户端
 * @author zqj
 * @create 2020-03-06 19:15
 */
public class Client {

    public static void main(String[] args) throws Exception{
        register();
    }

    private static void register()throws Exception{
        System.out.println("开始注册");
        String result= HttpUtils.doGet("http://localhost:8055/my_apollo_config_service/00getConfig");
        if(result !=null){
            //重新拉取配置，然后重置springBean...
        }
        register();
        Thread.sleep(1000);
    }
}
