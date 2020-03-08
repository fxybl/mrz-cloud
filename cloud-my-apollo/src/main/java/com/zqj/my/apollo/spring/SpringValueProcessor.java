package com.zqj.my.apollo.spring;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.stereotype.Component;
import org.springframework.util.ReflectionUtils;

import java.lang.reflect.Field;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

/**
 * SpringValue处理器
 * 实现BeanPostProcessor 以将bean进行处理
 * 实现BeanFactoryAware，为了注入BeanFactory
 *
 * @author zqj
 * @create 2020-03-08 18:45
 */

@Component
public class SpringValueProcessor implements BeanPostProcessor, BeanFactoryAware {

    private PlaceholderHelper placeholderHelper = new PlaceholderHelper();

    private BeanFactory beanFactory;

    public SpringValueRegistry registry = new SpringValueRegistry();

    /**
     * bean实例化之前进行处理
     *
     * @param bean
     * @param beanName
     * @return
     * @throws BeansException
     */
    @Override
    public Object postProcessBeforeInitialization(Object bean, String beanName) throws BeansException {
        //处理逻辑
        Class clazz = bean.getClass();
        for (Field field : findAllFields(clazz)) {
            //处理这个bean
            processField(bean, beanName, field);
        }
        return bean;
    }

    @Override
    public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {
        //不做处理
        return bean;
    }

    /**
     * 处理成员变量域
     *
     * @param bean
     * @param beanName
     * @param field
     */
    private void processField(Object bean, String beanName, Field field) {
        //获取value注解
        Value value = field.getAnnotation(Value.class);
        if (value == null) {
            return;
        }
        //解析
        Set<String> keys = placeholderHelper.extractPlaceholderKeys(value.value());
        if (keys.isEmpty()) {
            return;
        }

        for (String key : keys) {
            //组装到自定义的SpringValue
            SpringValue springValue = new SpringValue(key, value.value(), bean, beanName, field, false);
            //注册
            registry.register(beanFactory, key, springValue);
        }

    }

    /**
     * 通过class找到所有的成员变量域
     *
     * @param clazz
     * @return
     */
    private List<Field> findAllFields(Class clazz) {
        //只做添加，LinkedList效率更高
        List<Field> fields = new LinkedList<>();
        ReflectionUtils.doWithFields(clazz, new ReflectionUtils.FieldCallback() {
            @Override
            public void doWith(Field field) throws IllegalArgumentException, IllegalAccessException {
                //遍历处理，每个进行添加，获取了Field引用后，只需要在自己的SpringValueRegistry中对@Value进行修改，就可以作用于spring中的值
                fields.add(field);
            }
        });
        return fields;
    }

    @Override
    public void setBeanFactory(BeanFactory beanFactory) {
        this.beanFactory = beanFactory;
    }
}
