
spring-boot-rocketmq 示例，具体见项目代码和文档。

<!-- more -->

> 示例代码：[SC-alibaba/rocketmq/rocketmq-spring-boot at master · cloris-cc/SC-alibaba · GitHub](https://github.com/cloris-cc/SC-alibaba/tree/master/rocketmq/rocketmq-spring-boot)
>
> 笔记：[spring cloud alibaba - 茶茶日记 - winklog](https://teamwang.cn/2021/03/07/spring-cloud-alibaba/#4-RocketMQ)
>
> 官方中文文档：[rocketmq/docs/cn at master · apache/rocketmq · GitHub](https://github.com/apache/rocketmq/tree/master/docs/cn)

## 1. 快速开始

### 1.1 启动服务

下载地址：[Quick Start - Apache RocketMQ](http://rocketmq.apache.org/docs/quick-start/)

启动 Name Server：

```
  > nohup sh bin/mqnamesrv &
  > tail -f ~/logs/rocketmqlogs/namesrv.log
  The Name Server boot success...
```

启动 Broker：

```
  > nohup sh bin/mqbroker -n localhost:9876 &
  > tail -f ~/logs/rocketmqlogs/broker.log 
  The broker[%s, 172.30.30.233:10911] boot success...
```

关闭服务：

```
> sh bin/mqshutdown broker
The mqbroker(36695) is running...
Send shutdown request to mqbroker(36695) OK

> sh bin/mqshutdown namesrv
The mqnamesrv(36664) is running...
Send shutdown request to mqnamesrv(36664) OK
```

### 1.2 引入依赖

在 spring-boot 项目

```xml
<dependency>
    <groupId>org.apache.rocketmq</groupId>
    <artifactId>rocketmq-spring-boot-starter</artifactId>
    <version>${RELEASE.VERSION}</version>
</dependency>
```

或者使用 spring-cloud-stream

```xml
<dependency>
    <groupId>com.alibaba.cloud</groupId>
    <artifactId>spring-cloud-starter-stream-rocketmq</artifactId>
</dependency>
```

### 1.3 发送消息

在发送消息前，需要对生产(output)/消费者(input)做几项必要的配置

```yml
rocketmq:
  name-server: localhost:9876
  producer:
    group: test-group # 一般为业务名(application name)
```

接着使用`RocketMQTemplate`发送消息

```java
    // 按照名称装配。若是自己的Bean(eg:@Service/@Component/...)则用@Auowired按类型装配
    @Resource
    private RocketMQTemplate rocketMQTemplate;

    /**
     * 1. string-topic 普通消息
     */
    public void stringTopic() {
        SendResult sendResult = rocketMQTemplate.syncSend(Topic.STRING_TOPIC, "一条普通的消息");
        log.info("======> STRING_TOPIC：消息已发送");
        log.info("======> sendResult: {}", sendResult);
    }
```

消费消息

```java
// 当需要用到负载均衡时，group和topic都要相同。
@RocketMQMessageListener(consumerGroup = "consumer-group-1", topic = Topic.STRING_TOPIC)
@Service
@Slf4j
public class StringTopicHandler implements RocketMQListener<String> {
    @Override
    public void onMessage(String s) {
        log.info("======> 接受到消息：{}", s);
    }
}
```

## 2. 使用示例

### 2.1 基本概念

参照：[RocketMQ中Topic、Tag、GroupName的设计初衷](https://my.oschina.net/javamaster/blog/2051703)

### 2.2 主要功能

(消息之间的) 事务处理：生产者(服务A/本地事务) ==> 消费者(服务B)

### 2.3 注意 & todo

RocketMQListener<User>中的泛型消息体T为对象时，需要有**无参构造函数**。

[超级简单的 RocketMQ 流量削峰实战_xmt1139057136的专栏-CSDN博客](https://blog.csdn.net/xmtblog/article/details/106088595/)

业务设计：主要围绕topic，设计上和service/controller等类似，尽量一个topic对应一个实体类，例如对于user对象，有User-Service/Controller/Topic/Listener。

分布式事务是消息事务的父集。