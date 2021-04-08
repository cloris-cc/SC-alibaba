package cn.teamwang.rocketmq.boot.service;

import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQTransactionListener;
import org.apache.rocketmq.spring.core.RocketMQLocalTransactionListener;
import org.apache.rocketmq.spring.core.RocketMQLocalTransactionState;
import org.springframework.messaging.Message;

/**
 * & see: https://blog.csdn.net/y532798113/article/details/111285548
 *
 * @author <a href="mailto:clorisforcoding@gmail.com">Jacky Fang</a>
 */
@RocketMQTransactionListener
@Slf4j
public class TransactionListener implements RocketMQLocalTransactionListener {

    @Override
    public RocketMQLocalTransactionState executeLocalTransaction(Message msg, Object arg) {
        log.info("======> 本地事务处理中...");
        String orderId = (String) msg.getHeaders().get("orderId");
        // todo 打印事务id
        //
        // todo 为了解决重复消息《==》幂等性，可以将tid放入redis，并设置状态,消费端，每次从redis中获取事务id，根据状态并判断是否被消费过
        if ("123456".equals(orderId)) {
            return RocketMQLocalTransactionState.UNKNOWN;
        }

        return RocketMQLocalTransactionState.COMMIT;
    }

    @Override
    public RocketMQLocalTransactionState checkLocalTransaction(Message msg) {
        log.info("======> 由于本地事务状态未知，回查后决定 commit 该消息");
        return RocketMQLocalTransactionState.COMMIT;
    }
}
