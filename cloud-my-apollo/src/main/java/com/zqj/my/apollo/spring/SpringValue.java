package com.zqj.my.apollo.spring;


import lombok.Getter;
import org.springframework.core.MethodParameter;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Type;

/**
 * 自定义的(@Value)SpringValue，将spring中的 自己再存一遍
 *
 * @author zqj
 * @create 2020-03-08 18:03
 */

@Getter
public class SpringValue {

    //方法传参
    private MethodParameter methodParameter;
    //成员变量
    private Field field;
    //@Value这个注解对应的哪个bean
    private Object bean;
    //beanName
    private String beanName;
    //对应@Value(${key})中的key
    private String key;
    //对应@Value(${key})全部部分
    private String placeholder;
    //bean的类型
    private Class<?> targetType;
    private Type genericType;
    private boolean isJson;

    //成员变量上的@Value(${key})改变
    public SpringValue(String key, String placeholder, Object bean, String beanName, Field field, boolean isJson) {
        this.bean = bean;
        this.beanName = beanName;
        this.field = field;
        this.key = key;
        this.placeholder = placeholder;
        this.targetType = field.getType();
        this.isJson = isJson;
        if (isJson) {
            this.genericType = field.getGenericType();
        }
    }

    //方法上的@Value(${key})改变
    public SpringValue(String key, String placeholder, Object bean, String beanName, Method method, boolean isJson) {
        this.bean = bean;
        this.beanName = beanName;
        this.methodParameter = new MethodParameter(method, 0);
        this.key = key;
        this.placeholder = placeholder;
        Class<?>[] paramTps = method.getParameterTypes();
        this.targetType = paramTps[0];
        this.isJson = isJson;
        if (isJson) {
            this.genericType = method.getGenericParameterTypes()[0];
        }
    }

    /**
     * 更新值（@Value）
     * @param newVal
     * @throws IllegalAccessException
     * @throws InvocationTargetException
     */
    public void update(Object newVal) throws IllegalAccessException, InvocationTargetException{
        if(isField()){
            injectField(newVal);
        }else {
            injectMethod(newVal);
        }

    }

    /**
     * 成员变量上的设置新值
     *
     * @param newVal
     * @throws IllegalAccessException
     */
    private void injectField(Object newVal) throws IllegalAccessException {
        //获取原有的私有化权限
        boolean accessible = field.isAccessible();
        //去除私有化限制
        field.setAccessible(true);
        //设置新值
        field.set(bean, newVal);
        //设置为原有的是否私有化
        field.setAccessible(accessible);
    }

    /**
     * 方法中的@Value参数值改变为新值
     *
     * @param newVal
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     */
    private void injectMethod(Object newVal) throws InvocationTargetException, IllegalAccessException {
        methodParameter.getMethod().invoke(bean, newVal);
    }

    //是否是成员变量上的@Value
    public boolean isField() {
        return this.field != null;
    }

    //是否json
    public boolean isJson() {
        return isJson;
    }
}
