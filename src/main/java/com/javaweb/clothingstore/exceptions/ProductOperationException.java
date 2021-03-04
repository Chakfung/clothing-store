package com.javaweb.clothingstore.exceptions;

public class ProductOperationException extends RuntimeException {
    private static final long serialVersionUID = -5510718217827203064L;

    public ProductOperationException(String msg) {
        super(msg);
    }
}
