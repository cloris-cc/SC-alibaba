package cn.teamwang.monitor;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Jacky
 * Date: 2020/9/7 11:58
 */
@SpringBootApplication
@EnableDiscoveryClient
public class MonitorApplication {
    public static void main(String[] args) {
        SpringApplication.run(MonitorApplication.class, args);
    }

    @RestController
    static class TestController {

        @GetMapping("/test")
        public String test(Integer q) {
            System.out.println(10 / q);
            return "hello zipkin";
        }
    }
}
