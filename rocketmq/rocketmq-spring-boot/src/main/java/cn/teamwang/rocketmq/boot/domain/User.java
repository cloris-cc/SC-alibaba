package cn.teamwang.rocketmq.boot.domain;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @author <a href="mailto:clorisforcoding@gmail.com">Jacky Fang</a>
 */
@Data
@Accessors(chain = true)
public class User {
    private String username;
    private Integer age;
}
