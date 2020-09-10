package cn.teamwang.seata.a;

import cn.teamwang.seata.a.mapper.UserMapper;
import com.baomidou.mybatisplus.annotation.TableId;
import io.seata.spring.annotation.GlobalTransactional;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.experimental.Accessors;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Jacky
 * Date: 2020/9/9 18:18
 */
@SpringBootApplication
@MapperScan(basePackages = {"cn.teamwang.seata.a.mapper"})
@EnableDiscoveryClient
@EnableFeignClients
public class AApplication {
    public static void main(String[] args) {
        SpringApplication.run(AApplication.class, args);
    }

    @Data
    @Accessors(chain = true)
    public static class User {
        @TableId
        private Integer id;
        private String name;
    }

    @RestController
    @AllArgsConstructor
    static class UserController {

        private final UserMapper userMapper;
        private final OrderFeign orderFeign;

        @GetMapping("/damn")
        @GlobalTransactional(rollbackFor = Exception.class)
        public String damn() {
            userMapper.insert(new User().setId(1).setName("jacky"));

            System.out.println("发送的userId：" + userMapper.selectById(1));

            orderFeign.order(1);

            // 后面出现异常，上述的b服务是不能回滚的。（分布式事务）

            // 分布式事务场景：后面出现异常，前面成功的远程服务（feign，RestTemplate，消息队列）无法回滚。因为它们的本地事务已经结束了。

            throw new RuntimeException("b服务(不)会回滚的。");

//            return "damn!!!";
        }
    }

    @FeignClient(name = "service-b")
    interface OrderFeign {
        @GetMapping("/order")
        String order(@RequestParam("userId") Integer userId);
    }

}
