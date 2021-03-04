package com.javaweb.clothingstore.dao;

import com.javaweb.clothingstore.entity.Cart;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartDao {
    int insertCart(Cart cart);

    List<Cart> selectCartByUserId(long userId);

    Cart selectCartByUserIdAndProductId(@Param("userId") long userId, @Param("productId") long productId);

    int updateCart(Cart cart);

    int deleteCartByid(long cartId);

    int deleteCartByUserId(long userId);
}
