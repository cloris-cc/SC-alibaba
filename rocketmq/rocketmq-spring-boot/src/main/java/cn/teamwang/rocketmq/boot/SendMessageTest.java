package cn.teamwang.rocketmq.boot;

import cn.teamwang.rocketmq.boot.domain.User;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.client.producer.SendCallback;
import org.apache.rocketmq.client.producer.SendResult;
import org.apache.rocketmq.client.producer.TransactionSendResult;
import org.apache.rocketmq.spring.core.RocketMQLocalRequestCallback;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.apache.rocketmq.spring.support.RocketMQHeaders;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageHeaders;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Service;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

    public void transTopic() {
        TransactionSendResult result = rocketMQTemplate.sendMessageInTransaction(Topic.TRANS_TOPIC,
                MessageBuilder
                        .withPayload("事务消息")
                        .setHeader("orderId", "123456")
                        .build(),
                null);
    }

    public void requestTopic() {
        // 同步
        User user = rocketMQTemplate.sendAndReceive(Topic.REQUEST_TOPIC, "tea-tea", User.class, 60000);
        log.info("======> replied data: {}", user);

        // 异步
        rocketMQTemplate.sendAndReceive(Topic.REQUEST_TOPIC, "jacky", new RocketMQLocalRequestCallback<User>() {
            @Override
            public void onSuccess(User message) {
                System.out.println(message);
            }

            @Override
            public void onException(Throwable e) {
                System.out.println(e.getMessage());
            }
        }, 60000);
    }

    public void delayTopic() {
        // 默认的 messageDelayLevel = 1s 5s 10s 30s 1m 2m 3m 4m 5m 6m 7m 8m 9m 10m 20m 30m 1h 2h （共18个）
        // 如果想增加或修改延迟时间, 添加/更改 broker 的 conf 文件中该属性(messageDelayLevel)即可。
        // 此外，消息重试的时间也是由该属性决定，重试从 level 0 开始，每重试一次level + 3。死信队列也可以被订阅和消费，并且也会过期。有效期与正常消息相同，均为 3 天，3 天后会被自动删除。因此，请在死信消息产生后的 3天内及时处理。
        rocketMQTemplate.syncSend(Topic.DELAY_TOPIC, MessageBuilder.withPayload("hi").build(), 5000, 0);
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

        @GetMapping("/transTopic")
        public String transTopic() {
            sendMessage.transTopic();
            return "transTopic";
        }

        @GetMapping("/requestTopic")
        public String requestTopic() {
            sendMessage.requestTopic();
            return "requestTopic";
        }

        @GetMapping("/delayTopic")
        public String delayTopic() {
            sendMessage.delayTopic();
            return "delayTopic";
        }
    }

}
