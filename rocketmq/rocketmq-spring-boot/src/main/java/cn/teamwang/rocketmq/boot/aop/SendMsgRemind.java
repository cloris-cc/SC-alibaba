package cn.teamwang.rocketmq.boot.aop;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import java.util.StringJoiner;

/**
 * @author <a href="mailto:clorisforcoding@gmail.com">Jacky Fang</a>
 */
@Aspect
@Component
@Slf4j
public class SendMsgRemind {

/*
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
*/

    @Around(value = "execution(* cn.teamwang.rocketmq.boot.service.*.*(..)) " +
            "&& !execution(* cn.teamwang.rocketmq.boot.service.TransactionListener.*(..))")
    public Object aroundHandle(ProceedingJoinPoint point) throws Throwable {
        // 获取方法参数
        Object args = point.getArgs();
        String className = point.getTarget().getClass().getName();
        String simpleName = className.substring(className.lastIndexOf(".") + 1);
        Object result = null;
        log.info("======> 类 {} 处理单条消息 {} 中...", simpleName, args);

        try {
            result = point.proceed();

            log.info("======> 类 {} 单条消息 {} 处理完成", simpleName, args);
        } catch (Throwable throwable) {
            // 此处只是为了获取异常日志，并不处理异常。如果在这里处理了异常，rocketmq就无法获取异常然后触发重试机制了。

            log.error("======> 类 {} 单条消息 {} 处理失败", simpleName, args);
            log.error(throwable.getMessage(), throwable);

            throw throwable;
        }

        return result;
    }
}
