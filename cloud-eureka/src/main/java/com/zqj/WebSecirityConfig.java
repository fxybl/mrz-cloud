package com.zqj;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * @author zqj
 * @create 2019-12-31 17:30
 */
@Configuration
@EnableWebSecurity
public class WebSecirityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //注意：为了可以使用 http://${user}:${password}@${host}:${port}/eureka/ 这种方式登录,所以必须是httpBasic,
        // 如果是form方式,不能使用url格式登录
        //eureka开启了security认证后，必须加上此配置，否则其他服务无法注册到eureka中

        //关闭csrf
        http.csrf().disable();
        //支持httpBasic
        http.authorizeRequests().anyRequest().authenticated().and().httpBasic();
    }
}
