package com.zqj.my.apollo.core;

import org.springframework.core.env.EnumerablePropertySource;

import java.util.Set;

/**
 * spring中的key-value都是PropertySource方式存储
 * PropertySource中包含name和T,此类中T即Config
 * 此类将Config中的值包装成可以存储到spring中的类型
 *
 * @author zqj
 * @create 2020-03-08 17:08
 */
public class ConfigPropertySource extends EnumerablePropertySource<Config> {

    private static final String[] EMPTY_ARRAY = new String[0];

    /**
     * 使用spring的PropertySource的初始化方式
     *
     * @param name 用于区分不同的PropertySource，spring中有多个PropertySource，每个中都可能有相同的key,首位的生效
     * @param config 真正的key-value的存储
     */
    ConfigPropertySource(String name, Config config) {
        super(name, config);
    }

    /**
     * 获取所有的key数组
     *
     * @return
     */
    @Override
    public String[] getPropertyNames() {
        //获取所有的keys集合
        Set<String> propertyNames = this.source.getPropertyNames();
        if (propertyNames.isEmpty()) {
            return EMPTY_ARRAY;
        }
        //将set集合转换成其一致长度的字符串数组
        return propertyNames.toArray(new String[propertyNames.size()]);
    }

    /**
     * 根据key获取值
     *
     * @param property
     * @return
     */
    @Override
    public Object getProperty(String property) {
        return this.source.getProperty(property);
    }
}
