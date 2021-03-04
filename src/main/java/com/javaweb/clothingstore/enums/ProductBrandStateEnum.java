package com.javaweb.clothingstore.enums;

public enum ProductBrandStateEnum {
    SUCCESS(1,"操作成功"),INNER_ERROR(-1001, "内部系统错误")
    ,EMPTY_LIST(-1002,"添加数少于1");
    private int state;
    private String stateInfo;

    private ProductBrandStateEnum(int state, String stateInfo) {
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

    public static ProductBrandStateEnum stateOf(int index) {
        for (ProductBrandStateEnum state : values()) {
            if (state.getState() == index) {
                return state;
            }
        }
        return null;
    }
}
