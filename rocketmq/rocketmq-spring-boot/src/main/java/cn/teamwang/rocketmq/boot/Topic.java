package cn.teamwang.rocketmq.boot;

/**
 * @author <a href="mailto:clorisforcoding@gmail.com">Jacky Fang</a>
 */
public class Topic {

    // string-topic 代表发送的消息体payload为string类型
    public static final String STRING_TOPIC = "string-topic";

    // 发送实体类user的消息
    public static final String USER_TOPIC = "user-topic";

    // 带有标签Tag的扩展消息
    public static final String MSG_EXT_TOPIC = "message-ext-topic";

    // 有序消费
    public static final String ORDERLY_TOPIC = "orderly-topic";

    // 事务消息
    public static final String TRANSACTION_TOPIC = "transaction-topic";






}
