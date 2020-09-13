package cn.teamwang.sharding.sphere;

import cn.teamwang.sharding.sphere.entity.Order;
import cn.teamwang.sharding.sphere.mapper.OrderMapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.assertj.core.api.Assertions.assertThat;


/**
 * @author Jacky
 * Date: 2020/9/12 22:48
 */
@SpringBootTest
@RunWith(SpringRunner.class)
public class ShardingTests {
    @Autowired
    OrderMapper orderMapper;

    @Test
    public void shardingDatabase() {
        // userId 10 % 2 = ds-0
        // user10 11 % 2 = ds-1
        int count = 0;
        count += orderMapper.insert(new Order().setUserId(10));
        count += orderMapper.insert(new Order().setUserId(11));
        assertThat(count).isEqualTo(2);
    }

    @Test
    public void shardingDBandTable() {
        System.out.println(orderMapper.selectOne(Wrappers.lambdaQuery(new Order().setUserId(2))));
    }
}
