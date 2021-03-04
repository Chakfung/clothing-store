package com.javaweb.clothingstore.service;

import com.javaweb.clothingstore.dto.CartExecution;
import com.javaweb.clothingstore.entity.Cart;

public interface CartService {
    CartExecution addCart(Cart cart);

    CartExecution getCartListByUserId(long userId);

    Cart getCartByUserIdAndProductId(long userId, long produtId);

    CartExecution editCart(Cart cart);

    CartExecution removeCart(long cartId);
}
