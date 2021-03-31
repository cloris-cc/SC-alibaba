package cn.teamwang.rocketmq.boot.service;

import cn.teamwang.rocketmq.boot.Topic;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomUtils;
import org.apache.rocketmq.spring.annotation.ConsumeMode;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Service;

/**
 * @author <a href="mailto:clorisforcoding@gmail.com">Jacky Fang</a>
 */
@RocketMQMessageListener(consumerGroup = "orderly-consumer-group", topic = Topic.ORDERLY_TOPIC, consumeMode = ConsumeMode.ORDERLY)
@Service
@Slf4j
public class OrderlyTopicHandler implements RocketMQListener<String> {
    @Override
    public void onMessage(String message) {
        try {
            Thread.sleep(RandomUtils.nextInt(1,5) * 1000L);
        } catch (InterruptedException e) {
            log.error(e.getMessage());
        }
    }
}
