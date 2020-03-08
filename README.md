# spring-cloud 全家桶

#cloud-admin  
管理服务，包括内存管理等等.   
https://github.com/fxybl/mrz-cloud/tree/master/cloud-admin   

#cloud-common
公用工具包   
https://github.com/fxybl/mrz-cloud/tree/master/cloud-common   

#cloud-eureka-client-consumer-service  
消费者  
https://github.com/fxybl/mrz-cloud/tree/master/cloud-eureka-client-consumer-service 

#cloud-eureka-client-user-service  
服务提供者  
https://github.com/fxybl/mrz-cloud/tree/master/cloud-eureka-client-user-service   

#cloud-eureka
注册中心   
https://github.com/fxybl/mrz-cloud/tree/master/cloud-eureka   

#cloud-feign-api
feign远程调用的api，公共接口  
https://github.com/fxybl/mrz-cloud/tree/master/cloud-feign-api   

#cloud-gateway
gateway网关  
包含IP过滤器，以及使用guava的RateLimiter的限流实践等等  
https://github.com/fxybl/mrz-cloud/tree/master/cloud-gateway   


#cloud-seata(阿里巴巴蚂蚁金服开源的分布式事务框架),AT模式（发生异常通过数据库反向回滚，相比较TCC模式，业务侵入性低）  
1.cloud-seata-account  
分布式事务的账户服务demo  
https://github.com/fxybl/mrz-cloud/tree/master/cloud-seata-account   

2.cloud-seata-client  
分布式事务的接口API  
https://github.com/fxybl/mrz-cloud/tree/master/cloud-seata-client    

3.cloud-seata-order  
分布式事务订单服务demo   
https://github.com/fxybl/mrz-cloud/tree/master/cloud-seata-order   

4.cloud-seata-storage  
分布式事务的库存服务demo  
包含库存超卖的实践，使用redis来增加效率,通过version字段来保持原子性操作  
https://github.com/fxybl/mrz-cloud/tree/master/cloud-seata-storage   

5.seata-server-1.0.0  
分布式事务的seata服务器(已打包)  
https://github.com/fxybl/mrz-cloud/tree/master/seata-server-1.0.0/seata  

6.seata-server-1.0.0  
分布式事务的seata服务器(源码)  
https://github.com/fxybl/mrz-cloud/tree/master/seata-1.0.0  

#apollo
携程开源的阿波罗分布式配置中心（支持动态更新配置，无需重启服务器）  
https://github.com/fxybl/mrz-cloud/tree/master/apollo-build-scripts  

#cloud-my-apollo 
自写的简易版的apollo配置中心 
包含自定的SpringValueRegistry，实现不需要重启服务器，则更新掉@Value的值，达成动态更新  
自定义的PropertySource,实现远程拉取配置并优先性。  
https://github.com/fxybl/mrz-cloud/tree/master/cloud-my-apollo      

#cloud-transaction 分布式事务之最终一致性(失败后通过自动重试，重试一定次数后死亡，此后通过人工介入的方式处理)
1.cloud-transaction-client  
事务-共有接口api   
https://github.com/fxybl/mrz-cloud/tree/master/cloud-transaction-client   

2.cloud-transaction-order  
事务-订单服务demo   
https://github.com/fxybl/mrz-cloud/tree/master/cloud-transaction-order   

3.cloud-transaction-service  
事务处理的服务  
https://github.com/fxybl/mrz-cloud/tree/master/cloud-transaction-service   

4.cloud-transaction-stock  
事务-库存服务demo   
https://github.com/fxybl/mrz-cloud/tree/master/cloud-transaction-stock   

5.cloud-transaction-task  
事务-定时处理事务消息的服务demo   
https://github.com/fxybl/mrz-cloud/tree/master/cloud-transaction-task   







