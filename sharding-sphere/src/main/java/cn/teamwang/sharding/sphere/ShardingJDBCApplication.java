package cn.teamwang.sharding.sphere;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

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

}
