package cn.teamwang.auth;

import java.lang.annotation.ElementType;
import java.lang.annotation.Target;

/**
 * @author Jacky
 * Date: 2020/9/5 19:48
 */
@Target({ElementType.TYPE, ElementType.FIELD, ElementType.METHOD})
public @interface CheckLogin {

}
