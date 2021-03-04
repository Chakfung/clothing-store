package com.javaweb.clothingstore.enums;

public enum OrderStatusEnum {
    GENERATED(0,"已下单"),PAYED(1,"付款"),
    SEND(2,"发货"),REFUND(3,"退款"),
    REFUNDED(4,"同意退款"),
    FINISH(5,"已完成"),CANCEL(1000,"取消");

    private int status;
    private String statusInfo;

    OrderStatusEnum(int status, String statusInfo) {
        this.status = status;
        this.statusInfo = statusInfo;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStatusInfo() {
        return statusInfo;
    }

    public void setStatusInfo(String statusInfo) {
        this.statusInfo = statusInfo;
    }
}
