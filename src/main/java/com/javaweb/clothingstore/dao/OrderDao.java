package com.javaweb.clothingstore.dao;

import com.javaweb.clothingstore.entity.Order;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDao {
    int batchInsertOrder(List<Order> orderList);

    List<Order> selectOrderByUserId(@Param("orderCondition") Order order);

    List<Order> selectOrderByShopId(@Param("orderCondition") Order order,
                                    @Param("rowIndex") int rowIndex, @Param("pageSize") int pageSize);

    Order selectOrderByOrderId(long orderId);

    int CountOrderByShopId(@Param("orderCondition") Order order);

    int updateOrder(Order order);
}
