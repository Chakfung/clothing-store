package com.javaweb.clothingstore.dao;

import com.javaweb.clothingstore.entity.LocalAuth;
import com.javaweb.clothingstore.entity.Order;
import com.javaweb.clothingstore.entity.Product;
import com.javaweb.clothingstore.entity.Shop;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.assertEquals;

public class OrderDaoTest extends com.javaweb.clothingstore.BaseTest {
    @Autowired
    private OrderDao orderDao;

    @Test
    @Ignore
    public void testAbatchInsertOrder() {
        List<Order> orderList = new ArrayList<>();
        Order order = new Order();
        Shop shop = new Shop();
        shop.setShopId(36L);
        LocalAuth localAuth = new LocalAuth();
        localAuth.setUserId(2L);
        Product product = new Product();
        product.setProductId(1L);
        order.setLocalAuth(localAuth);
        order.setShop(shop);
        order.setProduct(product);
        order.setCount(1);
        order.setStatus(1);
        order.setCreateTime(new Date());
        orderList.add(order);
        Order order1 = new Order();
        order1.setLocalAuth(localAuth);
        order1.setShop(shop);
        order1.setProduct(product);
        order1.setCount(2);
        order1.setStatus(1);
        order1.setCreateTime(new Date());
        orderList.add(order1);
        int effectedNum = orderDao.batchInsertOrder(orderList);
        assertEquals(2, effectedNum);
    }

    @Test
    public void testBselectOrderByUserId() {
        Order orderCondition = new Order();
        LocalAuth localAuth = new LocalAuth();
        localAuth.setUserId(2L);
        orderCondition.setLocalAuth(localAuth);
        List<Order> orderList=orderDao.selectOrderByUserId(orderCondition);
        assertEquals(4, orderList.size());
    }

    @Test
    @Ignore
    public void testCselectOrderByShopId() {
        Order orderCondition = new Order();
        Shop shop = new Shop();
        shop.setShopId(36L);
        orderCondition.setShop(shop);
        List<Order> orderList=orderDao.selectOrderByShopId(orderCondition,1,3);
        assertEquals(2, orderList.size());
    }

    @Test
    public void testDupdateOrder() {
        Order order = new Order();
        order.setOrderId(2);
        order.setStatus(2);
        int effectedNum = orderDao.updateOrder(order);
        assertEquals(1, effectedNum);
    }
}
