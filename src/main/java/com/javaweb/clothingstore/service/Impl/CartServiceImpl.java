package com.javaweb.clothingstore.service.Impl;

import com.javaweb.clothingstore.dao.CartDao;
import com.javaweb.clothingstore.dto.CartExecution;
import com.javaweb.clothingstore.entity.Cart;
import com.javaweb.clothingstore.enums.CartStateEnum;
import com.javaweb.clothingstore.exceptions.CartOperationException;
import com.javaweb.clothingstore.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {
    @Autowired
    private CartDao cartDao;

    @Override
    @Transactional
    public CartExecution addCart(Cart cart) {
        if (cart != null) {
            try {
                int effectedNum = cartDao.insertCart(cart);
                if (effectedNum <= 0) {
                    throw new CartOperationException("add Cart Error");
                }
            } catch (Exception e) {
                throw new CartOperationException("add Cart Error" + e.getMessage());
            }
            return new CartExecution(CartStateEnum.SUCCESS);
        } else {
            return new CartExecution(CartStateEnum.EMPTY);
        }
    }

    @Override
    public CartExecution getCartListByUserId(long userId) {
        List<Cart> cartList = cartDao.selectCartByUserId(userId);
        if (cartList != null && cartList.size() > 0) {
            return new CartExecution(CartStateEnum.SUCCESS, cartList);
        } else {
            return new CartExecution(CartStateEnum.EMPTY);
        }
    }

    @Override
    public Cart getCartByUserIdAndProductId(long userId, long produtId) {
        return cartDao.selectCartByUserIdAndProductId(userId, produtId);
    }

    @Override
    public CartExecution editCart(Cart cart) {
        if (cart != null) {
            try {
                int effectedNum = cartDao.updateCart(cart);
                if (effectedNum <= 0) {
                    throw new CartOperationException("edit Cart Error");
                }
            } catch (Exception e) {
                throw new CartOperationException("edit Cart Error" + e.getMessage());
            }
            return new CartExecution(CartStateEnum.SUCCESS);
        } else {
            return new CartExecution(CartStateEnum.EMPTY);
        }
    }

    @Override
    public CartExecution removeCart(long cartId) {
        try {
            int effectedNum = cartDao.deleteCartByid(cartId);
            if (effectedNum <= 0) {
                throw new CartOperationException("Remove Cart Error");
            }
        } catch (Exception e) {
            throw new CartOperationException("Remove Cart Error" + e.getMessage());
        }
        return new CartExecution(CartStateEnum.SUCCESS);
    }

}
