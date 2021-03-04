package com.javaweb.clothingstore.dao;

import com.javaweb.clothingstore.entity.ProductBrand;

import java.util.List;

public interface ProductBrandDao {
    List<ProductBrand> queryProductBrandList(Long shopId);

    int batchInsertProductBrand(List<ProductBrand> productBrandList);

    int deleteProductBrand(long productBrandId);
}
