package cn.teamwang.rocketmq.stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.cloud.stream.messaging.Sink;
import org.springframework.cloud.stream.messaging.Source;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Jacky
 * Date: 2020/9/1 22:15
 */
@SpringBootApplication
@EnableBinding({Source.class, Sink.class})
public class RocketMQApplication {
    public static void main(String[] args) {
        SpringApplication.run(RocketMQApplication.class, args);
    }

    @Service
    static class TestService {
        @StreamListener("input")
        public void consumer(String msg) {
            System.out.println("接受到的消息为：" + msg);
        }

        // 消费指定tag的消息
    }

    @RestController
    static class TestController {
        @Autowired
//        private MessageChannel output;
        private Source source;

        @GetMapping("/test/{msg}")
        public String test(@PathVariable String msg) {
            source.output().send(MessageBuilder.withPayload(msg).build());
            System.out.println("消息已发送");
            return msg;
        }
    }

}
