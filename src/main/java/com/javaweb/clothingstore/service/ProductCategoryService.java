package com.javaweb.clothingstore.service;

import com.javaweb.clothingstore.entity.ProductCategory;

import java.util.List;

public interface ProductCategoryService {
    List<ProductCategory> getProductCategoryList(ProductCategory shopCategoryCondition);

    int addProductCategoryList(List<ProductCategory> productCategoryList);

    int removeProductCategory(long productCategoryId);

    int updateProductCategory(ProductCategory productCategory);
}
