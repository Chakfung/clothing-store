package com.javaweb.clothingstore.dao;

import com.javaweb.clothingstore.entity.ProductImg;

import java.util.List;

public interface ProductImgDao {
    int batInsertProductImg(List<ProductImg> productImgList);

    int deleteProductImgByProductId(long productId);

    List<ProductImg> queryProductImgList(long productId);
}
