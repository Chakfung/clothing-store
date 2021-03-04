package com.javaweb.clothingstore.enums;

public enum OrderStateEnum {
    SUCCESS(1,"操作成功"),ERROR(1,"操作失败")
    , EMPTY(1, "数据为空"),;

    private int state;
    private String stateInfo;

    OrderStateEnum(int state, String stateInfo) {
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
