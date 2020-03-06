package com.zqj.my.apollo.config_service;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 定时任务
 * @author zqj
 * @create 2020-03-06 18:59
 */

@Component
public class NotificationTask implements InitializingBean {

    @Autowired
    NotificationController notificationController;

    //bean初始化完成后执行的函数
    @Override
    public void afterPropertiesSet() throws Exception {
        new Thread(() -> {
            for (; ; ) {
                //有配置更新就进行处理,
                // 2处使用到了poll()方法，如果MyApolloConfigNotification中先使用，那么其直接拉取了最新的配置
                //如果此处先使用了poll()方法，则存在一处问题，controller中getConfig时，还没有执行put方法时，这里handMessage便执行了get，会导致获取到为空，从而没能注入变化的配置。
                String result = notificationController.poll.poll();
                if (result != null) {
                    Message message = new Message();
                    message.setMessage(result);
                    notificationController.handMessage(message);
                }
            }
        }).start();
    }
}
