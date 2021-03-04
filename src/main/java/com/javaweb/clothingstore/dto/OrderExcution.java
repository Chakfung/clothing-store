package com.javaweb.clothingstore.dto;

import com.javaweb.clothingstore.entity.Order;
import com.javaweb.clothingstore.enums.OrderStateEnum;

import java.util.List;

public class OrderExcution {
    private List<Order> orderList;
    private int state;
    private String stateInfo;
    private int count;

    public OrderExcution() {

    }

    public OrderExcution(OrderStateEnum orderStateEnum) {
        this.state = orderStateEnum.getState();
        this.stateInfo = orderStateEnum.getStateInfo();
    }

    public OrderExcution(OrderStateEnum orderStateEnum, int count) {
        this.state = orderStateEnum.getState();
        this.stateInfo = orderStateEnum.getStateInfo();
        this.count = count;
    }

    public OrderExcution(OrderStateEnum orderStateEnum,List<Order> orderList,  int count) {
        this.orderList = orderList;
        this.state = orderStateEnum.getState();
        this.stateInfo = orderStateEnum.getStateInfo();
        this.count = count;
    }

    public List<Order> getOrderList() {
        return orderList;
    }

    public void setOrderList(List<Order> orderList) {
        this.orderList = orderList;
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

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
