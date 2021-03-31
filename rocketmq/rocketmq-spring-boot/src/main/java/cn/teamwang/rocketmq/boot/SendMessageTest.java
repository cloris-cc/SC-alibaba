package cn.teamwang.rocketmq.boot;

import cn.teamwang.rocketmq.boot.domain.User;
import com.sun.org.apache.xpath.internal.objects.XString;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.client.producer.SendCallback;
import org.apache.rocketmq.client.producer.SendResult;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.apache.rocketmq.spring.support.RocketMQHeaders;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageHeaders;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Service;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author <a href="mailto:clorisforcoding@gmail.com">Jacky Fang</a>
 */
@Service
@Slf4j
public class SendMessageTest {

    // 按照名称装配。若是自己的Bean(eg:@Service/@Component/...)则用@Autowired按类型装配
    @Resource
    private RocketMQTemplate rocketMQTemplate;

    /**
     * 1. string-topic 普通消息
     */
    public void stringTopic() {
        // todo how to use
        // Message message = new Message(STRING_TOPIC, "一条普通的消息".getBytes(StandardCharsets.UTF_8));

        // sendResult 的目的是确保消息发送到了broker服务
        SendResult sendResult = rocketMQTemplate.syncSend(Topic.STRING_TOPIC, "string message");
        log.info("======> sendResult: {}", sendResult);
        SendResult sendResult1 = rocketMQTemplate.syncSend(Topic.STRING_TOPIC, MessageBuilder.withPayload("hello world".getBytes()).build());
        log.info("======> sendResult1: {}", sendResult1);

        // + 批量消息(被消费时无序;必须使用List<Message<T>>)
        List<Message<String>> msgList = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            msgList.add(MessageBuilder
                    .withPayload("批量消息" + i)
                    .setHeader(RocketMQHeaders.KEYS, "KEY_" + i)
                    .build());
        }
        // todo 超时会怎样？
        SendResult sendResult2 = rocketMQTemplate.syncSend(Topic.STRING_TOPIC, msgList, 60000);
        log.info("======> sendResult2: {}", sendResult2);

        // + 批量消息(有序) 见orderlyTopic()方法

    }

    /**
     * 有序消费（ConsumeMode & sendOrderly）
     * 注意：当send方法中的参数类型为 payload 则代表只有一条消息；Collection<T>才是多条消息。
     */
    public void orderlyTopic() {
        // 保证消息都在同一个queue(hashKey)中，才能实现顺序消费。
        rocketMQTemplate.syncSendOrderly(Topic.ORDERLY_TOPIC, "第 1 条消息", "unique-queue");
        rocketMQTemplate.syncSendOrderly(Topic.ORDERLY_TOPIC, "第 2 条消息", "unique-queue");
        rocketMQTemplate.syncSendOrderly(Topic.ORDERLY_TOPIC, "第 3 条消息", "unique-queue");
        rocketMQTemplate.syncSendOrderly(Topic.ORDERLY_TOPIC, "第 4 条消息", "unique-queue");
        rocketMQTemplate.syncSendOrderly(Topic.ORDERLY_TOPIC, "第 5 条消息", "unique-queue");

    }


    public void userTopic() {
        User user = new User().setUsername("jacky").setAge(18);
        // user
        SendResult sendResult = rocketMQTemplate.syncSend(Topic.USER_TOPIC, user);
        log.info("======> sendResult: {}", sendResult);
        // + header
        SendResult sendResult1 = rocketMQTemplate.syncSend(Topic.USER_TOPIC,
                MessageBuilder
                        .withPayload(user)
                        .setHeader(MessageHeaders.CONTENT_TYPE, MimeTypeUtils.APPLICATION_JSON_VALUE)
                        .build());
        log.info("======> sendResult1: {}", sendResult1);
        // + async
        rocketMQTemplate.asyncSend(Topic.USER_TOPIC, user, new SendCallback() {
            @Override
            public void onSuccess(SendResult sendResult) {
                log.info("======> callback sendResult: {}", sendResult);
            }

            @Override
            public void onException(Throwable throwable) {
                log.error("======> 消息发送失败：{}", throwable.getMessage());
            }
        });
    }

    public void msgExtTopic() {
        rocketMQTemplate.convertAndSend(Topic.MSG_EXT_TOPIC + ":tag0", "I'm from tag0");  // tag0 will not be consumer-selected
        System.out.printf("syncSend topic %s tag %s %n", Topic.MSG_EXT_TOPIC, "tag0");
        rocketMQTemplate.convertAndSend(Topic.MSG_EXT_TOPIC + ":tag1", "I'm from tag1");
        System.out.printf("syncSend topic %s tag %s %n", Topic.MSG_EXT_TOPIC, "tag1");
    }

    @RestController
    static class TestController {
        @Resource
        private SendMessageTest sendMessage;

        @GetMapping("/stringTopic")
        public String stringTopic() {
            sendMessage.stringTopic();
            return "stringTopic";
        }

        @GetMapping("/userTopic")
        public String userTopic() {
            sendMessage.userTopic();
            return "userTopic";
        }

        @GetMapping("/msgExtTopic")
        public String msgExtTopic() {
            sendMessage.msgExtTopic();
            return "msgExtTopic";
        }

        @GetMapping("/orderlyTopic")
        public String orderlyTopic() {
            sendMessage.orderlyTopic();
            return "orderlyTopic";
        }
    }

}
