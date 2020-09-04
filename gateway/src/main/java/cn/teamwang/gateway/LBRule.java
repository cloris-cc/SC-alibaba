package cn.teamwang.gateway;

import com.netflix.loadbalancer.IRule;
import com.netflix.loadbalancer.RandomRule;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author Jacky
 * Date: 2020/9/4 13:28
 */
@Configuration
public class LBRule {
    @Bean
    public IRule randomRule() {
        return new RandomRule();
    }
}
