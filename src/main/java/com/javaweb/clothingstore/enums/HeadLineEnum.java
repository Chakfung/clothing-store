package com.javaweb.clothingstore.enums;

public enum HeadLineEnum {
    SUCCESS(1,"操作成功"),ERROR(-1001,"操作失败")
    ,NULL_HEADLINE(-1002,"数据为空"), IOERROR(-1003, "图片处理异常"),
    NULL_IMG(-1004, "图片为空"),;

    private int state;
    private String stateInfo;

    HeadLineEnum(int state, String stateInfo) {
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
