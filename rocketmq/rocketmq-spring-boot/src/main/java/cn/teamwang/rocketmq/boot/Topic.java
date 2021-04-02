package cn.teamwang.rocketmq.boot;

/**
 * todo 更新topic功能注释
 *
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
    public static final String TRANS_TOPIC = "transaction-topic";

    // 有返回值的消息
    public static final String REQUEST_TOPIC = "request-topic";

    // 延迟消息(使用有 delayLevel 参数的方法即可) + 重试
    public static final String DELAY_TOPIC  = "delay-topic";


}
