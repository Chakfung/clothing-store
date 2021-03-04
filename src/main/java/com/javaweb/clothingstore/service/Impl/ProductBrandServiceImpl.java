package com.javaweb.clothingstore.service.Impl;

import com.javaweb.clothingstore.dao.ProductBrandDao;
import com.javaweb.clothingstore.dto.ProductBrandExecution;
import com.javaweb.clothingstore.entity.ProductBrand;
import com.javaweb.clothingstore.enums.ProductBrandStateEnum;
import com.javaweb.clothingstore.exceptions.ProductBrandException;
import com.javaweb.clothingstore.service.ProductBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductBrandServiceImpl implements ProductBrandService {
    @Autowired
    private ProductBrandDao productBrandDao;

    @Override
    public List<ProductBrand> getProductBrandList(Long shopId) {
        return productBrandDao.queryProductBrandList(shopId);
    }

    @Override
    @Transactional
    public ProductBrandExecution batchAddProductBrand(List<ProductBrand> productBrandList) throws ProductBrandException {
        if (productBrandList != null || productBrandList.size() > 0) {
            try {
                int effectNum = productBrandDao.batchInsertProductBrand(productBrandList);
                if (effectNum <= 0) {
                    throw new ProductBrandException("店铺类别创建失败");
                } else {
                    return new ProductBrandExecution(ProductBrandStateEnum.SUCCESS);
                }
            } catch (Exception e) {
                throw new ProductBrandException("batchAddProductBrand error " + e.getMessage());
            }
        } else {
            return new ProductBrandExecution(ProductBrandStateEnum.EMPTY_LIST);
        }
    }

    @Override
    public ProductBrandExecution deleteProductBrand(long productBrandId) throws ProductBrandException {
        try {
            int effectedNum = productBrandDao.deleteProductBrand(productBrandId);
            if (effectedNum <= 0) {
                throw new ProductBrandException("商品类别删除失败");
            } else {
                return new ProductBrandExecution(ProductBrandStateEnum.SUCCESS);
            }
        } catch (Exception e) {
            throw new ProductBrandException("deleteProductBrand error: "+e.getMessage());
        }
    }
}
