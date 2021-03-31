package cn.teamwang.rocketmq.boot.service;

import cn.teamwang.rocketmq.boot.Topic;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomUtils;
import org.apache.rocketmq.spring.annotation.ConsumeMode;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Service;

import java.util.Random;

/**
 * @author <a href="mailto:clorisforcoding@gmail.com">Jacky Fang</a>
 */
// 当需要用到负载均衡时，group和topic都要相同。
@RocketMQMessageListener(consumerGroup = "consumer-group-1", topic = Topic.STRING_TOPIC)
@Service
@Slf4j
public class StringTopicHandler implements RocketMQListener<String> {
    @Override
    public void onMessage(String s) {
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            log.error(e.getMessage());
        }
    }
}
