package cn.teamwang.rocketmq.boot.aop;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

/**
 * @author <a href="mailto:clorisforcoding@gmail.com">Jacky Fang</a>
 */
@Aspect
@Component
@Slf4j
public class SendMsgRemind {

/*
    @Before(value = "execution(void cn.teamwang.rocketmq.boot.SendMessageTest.*(..))")
    public void beforeSend() {
        log.info("======> 准备发送消息");
    }

    @After(value = "execution(void cn.teamwang.rocketmq.boot.SendMessageTest.*(..))")
    public void afterSend() {
        log.info("======> 消息发送完成");
    }
*/
    @Around(value = "execution(void cn.teamwang.rocketmq.boot.SendMessageTest.*(..))")
    public Object send(ProceedingJoinPoint point) {
        Object result = null;
        log.info("======> 准备发送消息(1/n)");

        try {
            result = point.proceed();
        } catch (Throwable throwable) {
            log.error(throwable.getMessage());
        }

        log.info("======> 消息发送完成(1/n)");
        return result;
    }

    @Around(value = "execution(* cn.teamwang.rocketmq.boot.service.*.*(..))")
    public Object aroundHandle(ProceedingJoinPoint point) {
        // 获取方法参数
        Object args = point.getArgs();
        Object result = null;
        log.info("======> 处理单条消息 {} 中...", args);

        try {
            result = point.proceed();
        } catch (Throwable throwable) {
            log.error(throwable.getMessage());
        }

        log.info("======> 单条消息 {} 处理完成", args);
        return result;
    }
}
