package com.zqj.transaction_service.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

/**
 * 数据库连接池
 * @author zqj
 * @create 2020-01-09 13:48
 */

@Configuration
public class DataSourceConfig {

    @Value("${cloud.datasource.message.url}")
    private String url;

    @Value("${cloud.datasource.username}")
    private String username;

    @Value("${cloud.datasource.password}")
    private String password;

    @Bean
    public DataSource dataSource(){
        //springboot默认的连接池
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl(url);
        config.setUsername(username);
        config.setPassword(password);
        config.setMaximumPoolSize(100);
        config.setMinimumIdle(20);
        config.setConnectionTestQuery("SELECT 1 from dual");
        return new HikariDataSource(config);
    }
}
