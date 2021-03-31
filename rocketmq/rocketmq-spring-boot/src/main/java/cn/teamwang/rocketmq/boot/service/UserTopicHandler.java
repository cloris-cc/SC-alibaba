package cn.teamwang.rocketmq.boot.service;

import cn.teamwang.rocketmq.boot.Topic;
import cn.teamwang.rocketmq.boot.domain.User;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Service;

/**
 * @author <a href="mailto:clorisforcoding@gmail.com">Jacky Fang</a>
 */
@RocketMQMessageListener(consumerGroup = "user-topic-group", topic = Topic.USER_TOPIC)
@Service
@Slf4j
public class UserTopicHandler implements RocketMQListener<User> {
    @Override
    public void onMessage(User message) {
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            log.error(e.getMessage());
        }
    }
}
