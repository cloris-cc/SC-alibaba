package cn.teamwang.sharding.sphere.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @author Jacky
 * Date: 2020/9/12 21:24
 */
@Data
@Accessors(chain = true)
@TableName("t_order")
public class Order {

    @TableId
    private Long orderId;

    private Integer userId;

    private String status;
}
