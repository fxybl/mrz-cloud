package com.zqj.my.apollo.core;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.context.EnvironmentAware;
import org.springframework.core.env.CompositePropertySource;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

/**
 * key-value处理器
 * 1.实现EnvironmentAware这个接口是为了获取到spring的Environment，并注入到本实例中
 *
 * 2.实现BeanFactoryPostProcessor是为了在容器初始化bean之前就进行修改其信息
 * 此时是为了将自己定义的PropertySource添加到所有的PropertySource的首位
 * 如果一个key在多个PropertySource中都存在，则位于最前面的PropertySource优先
 *
 * Application Context
 * ----Environment
 *             --------PropertySources
 *                               ----------自己定义的PropertySource
 *                               ----------PropertySource1
 *                               ----------PropertySource2
 * @author zqj
 * @create 2020-03-08 17:21
 */

@Component
//这个注解去掉后，ConfigController中的值就会改变
public class PropertySourcesProcessor implements BeanFactoryPostProcessor, EnvironmentAware {

    private static final String MY_APOLLO_SOURCE_NAME = "MyApolloPropertySources";

    private ConfigurableEnvironment environment;

    @Override
    public void postProcessBeanFactory(ConfigurableListableBeanFactory configurableListableBeanFactory) throws BeansException {
        Config config = new Config();
        //定义自己的propertySource叫myApp
        ConfigPropertySource configPropertySource = new ConfigPropertySource("myApp",config);
        //混合的PropertySources(包含多个PropertySource)
        CompositePropertySource composite = new CompositePropertySource(MY_APOLLO_SOURCE_NAME);
        composite.addPropertySource(configPropertySource);
        //将我们自己的设置为PropertySource的首位
        environment.getPropertySources().addFirst(composite);
    }

    @Override
    public void setEnvironment(Environment environment) {
        //注入Environment
        this.environment = (ConfigurableEnvironment) environment;
    }
}
