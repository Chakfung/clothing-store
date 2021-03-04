package com.javaweb.clothingstore.enums;

public enum LocalAuthStateEnum {
    SUCCESS(1,"操作成功"),INNER_ERROR(-1001,"内部错误")
    , NULL_AUTH_INFO(-1002, "用户信息为空"),ONLY_ONE_ACCOUNT(2,"账号已绑定");

    private int state;
    private String stateInfo;

    LocalAuthStateEnum(int state, String stateInfo) {
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
