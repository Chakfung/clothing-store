package com.javaweb.clothingstore.service;

import com.javaweb.clothingstore.dto.ImageHolder;
import com.javaweb.clothingstore.dto.ProductExecution;
import com.javaweb.clothingstore.entity.Product;
import com.javaweb.clothingstore.exceptions.ProductOperationException;

import java.util.List;

public interface ProductService {
    ProductExecution addProduct(
            Product product, ImageHolder thumbnail,
            List<ImageHolder> productImageHolderList)
            throws ProductOperationException;

    Product getProductById(long productId);

    ProductExecution getProductList(Product productCondition, int pageIndex, int pageSize);

    ProductExecution modifyProduct(Product product, ImageHolder thumbnail, List<ImageHolder> productImgHolderList)
            throws ProductOperationException;

}
