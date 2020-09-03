package cn.teamwang.sentinel;

import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Jacky
 * Date: 2020/9/1 3:44
 */
@SpringBootApplication
public class SentinelApplication {
    public static void main(String[] args) {
        SpringApplication.run(SentinelApplication.class, args);
    }

    @Service
    public static class TestService {

        @SentinelResource(value = "sayHello", blockHandler = "exceptionHandler") // ,fallback = "protect"
        public String sayHello(String name) {
            System.out.println(10 / Integer.parseInt(name));
            return "Hello, " + name;
        }

        public String protect(String name) {
            return "生不出人，我很抱歉";
        }

        public String exceptionHandler(String name, BlockException ex) {
            // Do some log here.
            System.out.println("呵呵");
            return "Oops, error occurred at " + name;
        }
    }

    @RestController
    public static class TestController {

        @Autowired
        private TestService service;

        @GetMapping(value = "/hello/{name}")
        public String apiHello(@PathVariable String name) {
            return service.sayHello(name);
        }

        @GetMapping(value = "/test/{str}")
        public String test(@PathVariable String str) {
            return str;
        }

    }

}
