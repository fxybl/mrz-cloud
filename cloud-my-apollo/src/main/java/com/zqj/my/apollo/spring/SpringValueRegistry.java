package com.zqj.my.apollo.spring;

import com.google.common.collect.LinkedListMultimap;
import com.google.common.collect.Maps;
import com.google.common.collect.Multimap;
import org.springframework.beans.factory.BeanFactory;

import java.util.Collection;
import java.util.Map;

/**
 * 注册器，将spring中的@Value都放进此类中的Map中
 * @author zqj
 * @create 2020-03-08 18:24
 */
public class SpringValueRegistry {

    //同步map，registry每个key(BeanFactory)代表一个BeanFactory,Value是一个Multimap，Multimap包含多个@Value的信息，key就是  @Value(${"key"})  中的key，
    //value则是自定义的SpringValue,里面包含了所有信息
    private final Map<BeanFactory, Multimap<String,SpringValue>> registry = Maps.newConcurrentMap();

    //定义一把锁
    private final Object LOCK = new Object();

    /**
     * 注册方法
     * @param beanFactory
     * @param key
     * @param springValue
     */
    public void register(BeanFactory beanFactory,String key,SpringValue springValue){
        //此种方式 更加效率，参考单例模式
        if(!registry.containsKey(beanFactory)){
            synchronized (LOCK){
                if(!registry.containsKey(beanFactory)){
                    //不存在此bean，便添加一个
                    registry.put(beanFactory, LinkedListMultimap.create());
                }
            }
        }
        //注册
        registry.get(beanFactory).put(key,springValue);
    }

    //通过key获取值
    public Collection<SpringValue> get(BeanFactory beanFactory,String key){
        Multimap<String, SpringValue> springValues = registry.get(beanFactory);
        if(springValues ==null){
            return null;
        }
        return springValues.get(key);
    }
}
