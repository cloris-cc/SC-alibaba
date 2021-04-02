package cn.teamwang.rocketmq.boot.aop;

import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.common.message.MessageExt;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

/**
 * @author <a href="mailto:clorisforcoding@gmail.com">Jacky Fang</a>
 */
@Slf4j
@Aspect
@Component
public class RetryLimit {

    @Around(value = "execution(* cn.teamwang.rocketmq.boot.service.*.*(..)) " +
            "&& !execution(* cn.teamwang.rocketmq.boot.service.TransactionListener.*(..))")
    public Object aroundHandle(ProceedingJoinPoint point) throws Throwable {
        Object result = null;
        // 获取方法参数(MessageExt)
        Object arg = point.getArgs()[0];
        if (arg instanceof MessageExt) {
            int times = ((MessageExt) arg).getReconsumeTimes();
            try {
                return point.proceed();
            } catch (Throwable throwable) {
                // 不处理异常，仅保存日志。
                // 2 为默认重试次数，实际生产中使用${}从yml配置文件获取。
                if (times >= 2) {
                    log.error("======> 消息进入死信队列 & 保存错误日志 MessageExt：{}, Body: {}", arg, new String(((MessageExt) arg).getBody()));
                }
                throw throwable;
            }
        } else {
            result = point.proceed();
            return result;
        }
    }
}
