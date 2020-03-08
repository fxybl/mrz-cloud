package com.zqj.my.apollo.core;

import java.util.HashSet;
import java.util.Set;

/**
 * 存取配置的类,key-value
 * @author zqj
 * @create 2020-03-08 16:58
 */
public class Config {

    public String getProperty(String key){
        if("mrz".equals(key)){
            return "zqj";
        }else if ("db".equals(key)){
            return "oracle";
        }
        return null;
    }

    public Set<String> getPropertyNames(){
        Set<String> set = new HashSet<>();
        set.add("mrz");
        set.add("db");
        return set;
    }
}
