package cn.teamwang.rocketmq.boot.service;

import cn.teamwang.rocketmq.boot.Topic;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Service;

/**
 * @author <a href="mailto:clorisforcoding@gmail.com">Jacky Fang</a>
 */
@Slf4j
@Service
@RocketMQMessageListener(consumerGroup = "delay-consumer-group", topic = Topic.DELAY_TOPIC)
public class DelayTopicHandler implements RocketMQListener<String> {

    @Override
    public void onMessage(String message) {
        System.out.println(1/0);
    }
}
