package cn.teamwang.auth;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

/**
 * @author Jacky
 * Date: 2020/9/6 12:54
 */
@Configuration
public class GlobalConfig {
    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
}
