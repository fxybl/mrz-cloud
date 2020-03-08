package com.zqj.my.apollo.controller;

import com.zqj.my.apollo.spring.SpringValue;
import com.zqj.my.apollo.spring.SpringValueProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.lang.reflect.InvocationTargetException;
import java.util.Collection;

/**
 *  测试自己写的PropertySource等
 * @author zqj
 * @create 2020-03-08 17:41
 */

@RestController
public class ConfigController {

    @Autowired
    private ConfigurableBeanFactory beanFactory;

    @Autowired
    private SpringValueProcessor springValueProcessor;

    @Value("${mrz}")
    private String name;

    @GetMapping("/getName")
    public String getName(){
        return name;
    }

    @GetMapping("/update")
    public String update(String newValue){
        //获取
        Collection<SpringValue> springValues = springValueProcessor.registry.get(beanFactory, "mrz");
        for(SpringValue springValue : springValues){
            try {
                //更新
                springValue.update(newValue);
            } catch (IllegalAccessException  | InvocationTargetException e) {
                e.printStackTrace();
            }
        }
        return name;
    }
}
