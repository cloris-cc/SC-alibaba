package cn.teamwang.nacos.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Jacky
 * Date: 2020/8/28 23:37
 */
@SpringBootApplication
@RefreshScope
public class NacosConfigApplication {
    public static void main(String[] args) {
/*        ConfigurableApplicationContext applicationContext = SpringApplication.run(NacosConfigApplication.class, args);
        String userName = applicationContext.getEnvironment().getProperty("env.user.name");
        String userAge = applicationContext.getEnvironment().getProperty("env.user.age");
        System.err.println("user name :" + userName + "; age: " + userAge);*/

        SpringApplication.run(NacosConfigApplication.class, args);
    }

    @RestController
    @RefreshScope
    static class TestController {
        @Value("${env.user.name}")
        String name;
        @Value("${env.user.age}")
        Integer age;
        @Value("${common.value}")
        String commonValue;

        @GetMapping("/test")
        public String getConfig() {
            System.out.println(name + ":" + age + ":" + commonValue);
            return "end";
        }
    }
}
