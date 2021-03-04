package com.javaweb.clothingstore.enums;

public enum CartStateEnum {
    SUCCESS(1,"操作成功"),ERROR(-1001,"操作失败")
    ,EMPTY(-1002,"购物车为空"),EMPTY_CARTID(-1003,"cratid为空"),
    EMPTY_USERID(-1003, "userid为空"),;

    private int state;
    private String stateInfo;

    CartStateEnum(int state, String stateInfo) {
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
