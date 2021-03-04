package com.javaweb.clothingstore.service.Impl;

import com.javaweb.clothingstore.dao.ProductCategoryDao;
import com.javaweb.clothingstore.entity.ProductCategory;
import com.javaweb.clothingstore.service.ProductCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductCategoryServiceImpl implements ProductCategoryService {
    @Autowired
    private ProductCategoryDao productCategoryDao;

    @Override
    public List<ProductCategory> getProductCategoryList(ProductCategory productCategoryCondition) {
        return productCategoryDao.queryProductCategory(productCategoryCondition);
    }

    @Override
    @Transactional
    public int addProductCategoryList(List<ProductCategory> productCategoryList) {
        return productCategoryDao.batchInsertProductCategory(productCategoryList);
    }

    @Override
    public int removeProductCategory(long productCategoryId) {
        return productCategoryDao.deleteProductCategoryById(productCategoryId);
    }

    @Override
    public int updateProductCategory(ProductCategory productCategory) {
        return productCategoryDao.updateProductCategory(productCategory);
    }

}
