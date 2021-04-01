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
    @Before(value = "execution(void cn.teamwang.rocketmq.boot.SendMessageTest.*(..))")
    public void beforeSend() {
        log.info("======> 准备发送消息");
    }

    @After(value = "execution(void cn.teamwang.rocketmq.boot.SendMessageTest.*(..))")
    public void afterSend() {
        log.info("======> 消息发送完成");
    }
*/
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
    public Object aroundHandle(ProceedingJoinPoint point) {
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
            /*
            for (StackTraceElement element : throwable.getStackTrace()) {
                log.error(element.toString());
            }
            */

            // 同线程不安全的 StringBuilder
            StringJoiner joiner = new StringJoiner("\n");
            joiner.add(throwable.getMessage());
            for (StackTraceElement element : throwable.getStackTrace()) {
                joiner.add(element.toString());
            }

            log.error("======> 类 {} 单条消息 {} 处理失败", simpleName, args);
            log.error(joiner.toString());
        }

        return result;
    }
}
