package cn.teamwang.nacos.consumer;

import com.netflix.loadbalancer.IRule;
import com.netflix.loadbalancer.RoundRobinRule;
import org.springframework.context.annotation.Bean;

/**
 * 作为某个服务的独立配置的话，建议在内部类中实现。
 *
 * @author Jacky
 * Date: 2020/8/29 18:16
 */
public class RibbonSpecialConfig {

    @Bean
    public IRule roundRobinRule() {
        return new RoundRobinRule();
    }
}
