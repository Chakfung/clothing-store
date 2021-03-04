package com.javaweb.clothingstore.dao;

import com.javaweb.clothingstore.entity.ProductCategory;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ProductCategoryDao {
    List<ProductCategory> queryProductCategory(@Param("productCategoryCondition") ProductCategory productCategoryCondition);

    int batchInsertProductCategory(List<ProductCategory> productCategoryList);

    int deleteProductCategoryById(long productCategoryId);

    int updateProductCategory(ProductCategory productCategory);
}
