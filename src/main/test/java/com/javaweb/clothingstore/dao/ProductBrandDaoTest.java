package com.javaweb.clothingstore.dao;

import com.javaweb.clothingstore.BaseTest;
import com.javaweb.clothingstore.entity.ProductBrand;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.assertEquals;
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ProductBrandDaoTest extends BaseTest {
    @Autowired
    private ProductBrandDao productCategoryDao;

    @Test
    public void testBqueryProductCategoryList() {
        Long shopId = null;
        productCategoryDao.queryProductBrandList(shopId);
        List<ProductBrand> productCategoryList = productCategoryDao.queryProductBrandList(1L);
    }

    @Test

    public void testABatchInsertProductCategory() {
        ProductBrand productCategory = new ProductBrand();
        productCategory.setProductBrandName("商品类别1");
        productCategory.setPriority(1);
        productCategory.setCreateTime(new Date());
        productCategory.setShopId(1L);
        ProductBrand productCategory2 = new ProductBrand();
        productCategory2.setProductBrandName("商品类别2");
        productCategory2.setPriority(2);
        productCategory2.setCreateTime(new Date());
        productCategory2.setShopId(1L);
        List<ProductBrand> productCategoryList = new ArrayList<ProductBrand>();
        productCategoryList.add(productCategory);
        productCategoryList.add(productCategory2);
        int effectedNum = productCategoryDao.batchInsertProductBrand(productCategoryList);
        assertEquals(2,effectedNum);
    }

    @Test
    public void testCDeleteProductCategory() throws Exception {
        long shopId = 1L;
        List<ProductBrand> productCategoryList = productCategoryDao.queryProductBrandList(shopId);
        for (ProductBrand productCategory : productCategoryList) {
            if ("商品类别1".equals(productCategory.getProductBrandName()) || "商品类别2".equals(productCategory.getProductBrandName())) {
                int effectedNum = productCategoryDao.deleteProductBrand(productCategory.getProductBrandId(),shopId);
                assertEquals(1,effectedNum);
            }
        }
    }
}
