package com.javaweb.clothingstore.exceptions;

public class ShopOperationException extends RuntimeException {
    private static final long serialVersionUID = 389447560211810221L;

    public ShopOperationException(String msg) {
        super(msg);
    }
}
