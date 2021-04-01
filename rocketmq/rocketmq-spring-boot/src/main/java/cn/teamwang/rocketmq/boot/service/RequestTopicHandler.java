package cn.teamwang.rocketmq.boot.service;

import cn.teamwang.rocketmq.boot.Topic;
import cn.teamwang.rocketmq.boot.domain.User;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQReplyListener;
import org.springframework.stereotype.Service;

/**
 * @author <a href="mailto:clorisforcoding@gmail.com">Jacky Fang</a>
 */
@Service
@RocketMQMessageListener(consumerGroup = "request-consumer-group", topic = Topic.REQUEST_TOPIC)
public class RequestTopicHandler implements RocketMQReplyListener<String, User> {

    @Override
    public User onMessage(String message) {
        return new User().setUsername(message).setAge(18);
    }
}
