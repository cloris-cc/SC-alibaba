package cn.teamwang.sharding.sphere.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @author Jacky
 * Date: 2020/9/12 21:26
 */
@Data
@Accessors(chain = true)
@TableName("t_order_item")
public class OrderItem {

    @TableId
    private Long orderItemId;

    private Long orderId;

    private Integer userId;

    private String status;
}
