package com.javaweb.clothingstore.exceptions;

public class LocalAuthOperationException extends RuntimeException {

    private static final long serialVersionUID = 2603775207830065509L;

    public LocalAuthOperationException(String msg) {
        super(msg);
    }
}
