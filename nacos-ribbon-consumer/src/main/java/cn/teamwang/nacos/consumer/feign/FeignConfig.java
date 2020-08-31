package cn.teamwang.nacos.consumer.feign;

import feign.Logger;
import org.springframework.context.annotation.Bean;

/**
 * @author Jacky
 * Date: 2020/8/30 3:31
 */
public class FeignConfig {
    @Bean
    public Logger.Level level() {
        return Logger.Level.FULL;
    }
}
