package cn.teamwang.sharding.sphere;

import cn.teamwang.sharding.sphere.entity.Order;
import cn.teamwang.sharding.sphere.mapper.OrderMapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Jacky
 * Date: 2020/9/8 14:38
 */
@SpringBootApplication
@MapperScan(basePackages = {"cn.teamwang.sharding.sphere.mapper"})
public class ShardingJDBCApplication {
    public static void main(String[] args) {
        SpringApplication.run(ShardingJDBCApplication.class, args);
    }

    @RestController
    @Slf4j
    static class TestController {

        @Autowired
        OrderMapper orderMapper;

        @GetMapping("/test")
        public String test() {
            // 1 % 2 = 1
            log.info("查询到的对象：{}", orderMapper.selectOne(Wrappers.lambdaQuery(new Order().setUserId(2))));
            return "hello teamwang";
        }
    }

}
