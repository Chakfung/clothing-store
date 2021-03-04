package com.javaweb.clothingstore.dto;

import com.javaweb.clothingstore.entity.Cart;
import com.javaweb.clothingstore.enums.CartStateEnum;

import java.util.List;

public class CartExecution {
    private int state;
    private String stateInfo;
    private List<Cart> cartList;

    public CartExecution() {

    }

    public CartExecution(CartStateEnum cartStateEnum) {
        this.state = cartStateEnum.getState();
        this.stateInfo = cartStateEnum.getStateInfo();
    }

    public CartExecution(CartStateEnum cartStateEnum, List<Cart> cartList) {
        this.state = cartStateEnum.getState();
        this.stateInfo = cartStateEnum.getStateInfo();
        this.cartList = cartList;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getStateInfo() {
        return stateInfo;
    }

    public void setStateInfo(String stateInfo) {
        this.stateInfo = stateInfo;
    }

    public List<Cart> getCartList() {
        return cartList;
    }

    public void setCartList(List<Cart> cartList) {
        this.cartList = cartList;
    }
}
