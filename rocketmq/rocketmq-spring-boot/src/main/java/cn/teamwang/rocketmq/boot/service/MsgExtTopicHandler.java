package cn.teamwang.rocketmq.boot.service;

import cn.teamwang.rocketmq.boot.Topic;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.client.consumer.DefaultMQPushConsumer;
import org.apache.rocketmq.common.UtilAll;
import org.apache.rocketmq.common.consumer.ConsumeFromWhere;
import org.apache.rocketmq.common.message.MessageExt;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.apache.rocketmq.spring.core.RocketMQPushConsumerLifecycleListener;
import org.springframework.stereotype.Service;

/**
 * @author <a href="mailto:clorisforcoding@gmail.com">Jacky Fang</a>
 */
@RocketMQMessageListener(consumerGroup = "tag-consumer-group", topic = Topic.MSG_EXT_TOPIC, selectorExpression = "tag0||tag1")
@Service
@Slf4j
public class MsgExtTopicHandler implements RocketMQListener<MessageExt> {
    @Override
    public void onMessage(MessageExt message) {
        System.out.printf("------- MessageExtConsumer received message, msgId: %s, body:%s \n", message.getMsgId(), new String(message.getBody()));

    }

/*    @Override , RocketMQPushConsumerLifecycleListener
    public void prepareStart(DefaultMQPushConsumer consumer) {
        // set consumer consume message from now
        consumer.setConsumeFromWhere(ConsumeFromWhere.CONSUME_FROM_TIMESTAMP);
        consumer.setConsumeTimestamp(UtilAll.timeMillisToHumanString3(System.currentTimeMillis()));

    }*/
}
