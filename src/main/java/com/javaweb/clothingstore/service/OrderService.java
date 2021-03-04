package com.javaweb.clothingstore.service;

import com.javaweb.clothingstore.dto.OrderExcution;
import com.javaweb.clothingstore.entity.LocalAuth;
import com.javaweb.clothingstore.entity.Order;

import java.util.List;

public interface OrderService {
    OrderExcution addOrderList(List<Order> orderList, LocalAuth user);

    List<Order> getOrderListByUserId(Order order);

    Order getOrderByOrderId(long orderId);

    OrderExcution getOrderListByShopId(Order order, int pageIndex, int pageSize);

    OrderExcution modyfiOrder(Order order);
}
