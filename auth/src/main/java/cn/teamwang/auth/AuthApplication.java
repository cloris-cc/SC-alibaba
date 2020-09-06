package cn.teamwang.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

/**
 * @author Jacky
 * Date: 2020/9/5 14:33
 */
@SpringBootApplication
@EnableFeignClients
public class AuthApplication {
    public static void main(String[] args) {
        SpringApplication.run(AuthApplication.class, args);
    }

    @RestController
    static class TestController {
        @Autowired
        JWTHelper jwtHelper;
        @Autowired
        DiscoveryFeign discoveryFeign;
        @Autowired
        RestTemplate restTemplate;

        @GetMapping("/test")
        @CheckLogin
        public void test() {
            System.out.println(jwtHelper.expireTime);
        }

        @GetMapping("/feign")
        public String feign(String q) {
            return discoveryFeign.echo(q);
        }

    }

}
