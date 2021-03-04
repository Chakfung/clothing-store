package com.javaweb.clothingstore.service;

import com.javaweb.clothingstore.dto.ProductBrandExecution;
import com.javaweb.clothingstore.entity.ProductBrand;
import com.javaweb.clothingstore.exceptions.ProductBrandException;

import java.util.List;

public interface ProductBrandService {
    List<ProductBrand> getProductBrandList(Long shopId);

    ProductBrandExecution batchAddProductBrand(List<ProductBrand> productBrandList) throws ProductBrandException;

    ProductBrandExecution deleteProductBrand(long productBrandId) throws ProductBrandException;
}
