package com.javaweb.clothingstore.enums;

public enum  ProductStateEnum {
    SUCCESS(1,"操作成功"),INNER_ERROR(-1001, "内部系统错误")
    ,EMPTY(0,"商品为空或店铺为空");
    private int state;
    private String stateInfo;

    ProductStateEnum(int state, String stateInfo) {
        this.state = state;
        this.stateInfo = stateInfo;
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
}
