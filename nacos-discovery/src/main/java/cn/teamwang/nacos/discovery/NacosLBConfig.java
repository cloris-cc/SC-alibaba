package cn.teamwang.nacos.discovery;

import com.netflix.loadbalancer.IRule;
import com.netflix.loadbalancer.RandomRule;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author Jacky
 * Date: 2020/9/4 13:01
 */
@Configuration
public class NacosLBConfig {
    // 这里配置有什么用，是在主动调用方那里配置才有用！
    @Bean
    public IRule nacosRule() {
//        return new NacosRule();
        return new RandomRule();
    }
}
