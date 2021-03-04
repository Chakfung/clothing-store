package com.javaweb.clothingstore.service.Impl;

import com.javaweb.clothingstore.dao.CartDao;
import com.javaweb.clothingstore.dao.OrderDao;
import com.javaweb.clothingstore.dto.OrderExcution;
import com.javaweb.clothingstore.entity.LocalAuth;
import com.javaweb.clothingstore.entity.Order;
import com.javaweb.clothingstore.enums.OrderStateEnum;
import com.javaweb.clothingstore.exceptions.CartOperationException;
import com.javaweb.clothingstore.exceptions.OrderOperationException;
import com.javaweb.clothingstore.service.OrderService;
import com.javaweb.clothingstore.util.PageCalculator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;

    @Autowired
    private CartDao cartDao;

    @Override
    @Transactional
    public OrderExcution addOrderList(List<Order> orderList, LocalAuth user) {
        if (orderList != null && orderList.size() > 0) {
            try {
                int effectedNum = orderDao.batchInsertOrder(orderList);
                if (effectedNum < 0) {
                    throw new OrderOperationException("insert order error");
                } else {
                    if (user != null && user.getPersonInfo() != null && user.getPersonInfo().getUserId() > 0) {
                        effectedNum = cartDao.deleteCartByUserId(user.getPersonInfo().getUserId());
                        if (effectedNum <= 0) {
                            throw new CartOperationException("remove user's cartlist error");
                        }
                    }
                }
                return new OrderExcution(OrderStateEnum.SUCCESS, effectedNum);
            } catch (Exception e) {
                throw new OrderOperationException("insert order error");
            }
        } else {
            return new OrderExcution(OrderStateEnum.EMPTY);
        }

    }

    @Override
    public List<Order> getOrderListByUserId(Order order) {
        return orderDao.selectOrderByUserId(order);
    }

    @Override
    public Order getOrderByOrderId(long orderId) {
        return orderDao.selectOrderByOrderId(orderId);
    }

    @Override
    public OrderExcution getOrderListByShopId(Order order, int pageIndex, int pageSize) {
        int rowIndex = PageCalculator.calculateRowIndex(pageIndex, pageSize);
        List<Order> orderList = orderDao.selectOrderByShopId(order, rowIndex, pageSize);
        int count = orderDao.CountOrderByShopId(order);
        OrderExcution oe = new OrderExcution();
        oe.setOrderList(orderList);
        oe.setCount(count);
        return oe;
    }

    @Override
    public OrderExcution modyfiOrder(Order order) {
        if (order != null && order.getOrderId() > 0 && order.getStatus() >= 0) {
            try {
                int effectedNum = orderDao.updateOrder(order);
                if (effectedNum < 0) {
                    throw new OrderOperationException("update order error");
                }
                return new OrderExcution(OrderStateEnum.SUCCESS, effectedNum);
            } catch (Exception e) {
                throw new OrderOperationException("update order error");
            }

        } else {
            return new OrderExcution(OrderStateEnum.EMPTY);
        }
    }
}
