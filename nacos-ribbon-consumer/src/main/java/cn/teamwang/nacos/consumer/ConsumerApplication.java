package cn.teamwang.nacos.consumer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

/**
 * @author Jacky
 * Date: 2020/8/29 17:55
 */
@SpringBootApplication
@EnableDiscoveryClient
@RibbonClient(name = "service-provider", configuration = RibbonSpecialConfig.class)
public class ConsumerApplication {
    public static void main(String[] args) {
        SpringApplication.run(ConsumerApplication.class, args);
    }

    @Bean
    @LoadBalanced // 开启 ribbon，识别服务名并实现负载均衡
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }

//    @Bean
//    public IRule randomRule() {
//        return new RandomRule();
//    }

    @RestController
    static class TestController {

        @Autowired
        RestTemplate restTemplate;

        @GetMapping("/test")
        public String test() {
            System.out.println(restTemplate.getForObject("http://service-provider/echo/test", String.class));
            return "ribbon作用结束";
        }
    }
}
