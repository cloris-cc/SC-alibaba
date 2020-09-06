package cn.teamwang.auth;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

/**
 * @author Jacky
 * Date: 2020/9/5 19:51
 */
@Aspect
@Component
public class AOPProcess {

    @Around("@annotation(CheckLogin)")
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
        System.out.println("ccccheck login！");
        return joinPoint.proceed();
    }

}
