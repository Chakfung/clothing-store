package com.javaweb.clothingstore.dao;

import com.javaweb.clothingstore.BaseTest;
import com.javaweb.clothingstore.entity.Cart;
import com.javaweb.clothingstore.entity.LocalAuth;
import com.javaweb.clothingstore.entity.Product;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.assertEquals;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class CartDaoTest extends BaseTest {
    @Autowired
    private CartDao cartDao;

    @Test
    @Ignore
    public void testAinsertCart() {
        Cart cart = new Cart();
        LocalAuth localAuth = new LocalAuth();
        localAuth.setUserId(2L);
        cart.setLocalAuth(localAuth);
        cart.setNum(1);
        Product product = new Product();
        product.setProductId(1L);
        cart.setProduct(product);
        int effectedNum = cartDao.insertCart(cart);
        assertEquals(1, effectedNum);
        Cart cart1 = new Cart();
        cart1.setLocalAuth(localAuth);
        cart1.setNum(2);
        Product product1 = new Product();
        product.setProductId(2L);
        cart.setProduct(product);
        effectedNum = cartDao.insertCart(cart);
        assertEquals(1, effectedNum);
    }

    @Test
    @Ignore
    public void testBselectCartByUserId() {
        List<Cart> cartList = cartDao.selectCartByUserId(2L);
        assertEquals(3, cartList.size());
    }

    @Test
    public void testCupdateCart() {
        Cart cart = new Cart();
        cart.setCartId(1L);
        cart.setNum(3);
        int effectedNum = cartDao.updateCart(cart);
        assertEquals(1, effectedNum);
    }

    @Test
    public void testDdeleteCartByid() {
        int effectNum = cartDao.deleteCartByid(3L);
        assertEquals(1, effectNum);
        effectNum = cartDao.deleteCartByid(4L);
        assertEquals(1, effectNum);
    }

}
