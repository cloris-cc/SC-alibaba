package cn.teamwang.seata.b;

import cn.teamwang.seata.b.mapper.OrderMapper;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.experimental.Accessors;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Jacky
 * Date: 2020/9/9 18:16
 */
@SpringBootApplication
@EnableDiscoveryClient
@MapperScan(basePackages = {"cn.teamwang.seata.b.mapper"})
public class BApplication {
    public static void main(String[] args) {
        SpringApplication.run(BApplication.class, args);
    }

    @RestController
    @AllArgsConstructor
    static class OrderController {

        private final OrderMapper orderMapper;

        @GetMapping("/order")
        @Transactional(rollbackFor = Exception.class)
        public String order(Integer userId) {
            System.out.println("接收到的userId：" + userId);

            // normal condition
            orderMapper.insert(new Order().setId(2).setOrderNo("no888888888888"));

            return "b服务执行结束";
        }
    }

    @Data
    @Accessors(chain = true)
    @TableName("order_copy")
    public static class Order {
        @TableId
        private Integer id;
        private String orderNo;
    }
}
