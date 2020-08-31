package cn.teamwang.nacos.discovery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Jacky
 * Date: 2020/8/29 3:36
 */
@SpringBootApplication
@EnableDiscoveryClient
public class DiscoveryApplication {
    public static void main(String[] args) {
        SpringApplication.run(DiscoveryApplication.class, args);
    }

    @RestController
    static class EchoController {

        @Autowired
        DiscoveryClient discoveryClient;

        @GetMapping("/echo/{string}")
        public String echo(@PathVariable String string) {
            System.out.println("我被调用啦");
            return "Hello Nacos Discovery " + string;
        }

    }
}
