package com.javaweb.clothingstore.dao;

import com.javaweb.clothingstore.BaseTest;
import com.javaweb.clothingstore.entity.Product;
import com.javaweb.clothingstore.entity.ProductBrand;
import com.javaweb.clothingstore.entity.ProductImg;
import com.javaweb.clothingstore.entity.Shop;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.assertEquals;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ProductDaoTest extends BaseTest {
    @Autowired
    private ProductDao productDao;
    @Autowired
    private ProductImgDao productImgDao;

    @Test
    @Ignore
    public void testAInsertProduct() throws Exception {
        Shop shop1 = new Shop();
        shop1.setShopId(1L);
        ProductBrand pc1 = new ProductBrand();
        Product product1 = new Product();
        product1.setProductName("测试1");
        product1.setProductDesc("测试描述1");
        product1.setImgAddr("test1");
        product1.setPriority(1);
        product1.setEnableStatus(1);
        product1.setCreateTime(new Date());
        product1.setLastEditTime(new Date());
        product1.setShop(shop1);
        product1.setProductBrand(pc1);
        Product product2 = new Product();
        product2.setProductName("测试2");
        product2.setProductDesc("测试Desc2");
        product2.setImgAddr("test2");
        product2.setPriority(2);
        product2.setEnableStatus(0);
        product2.setCreateTime(new Date());
        product2.setLastEditTime(new Date());
        product2.setShop(shop1);
        product2.setProductBrand(pc1);
        Product product3 = new Product();
        product3.setProductName("测试3");
        product3.setProductDesc("测试Desc3");
        product3.setImgAddr("test3");
        product3.setPriority(3);
        product3.setEnableStatus(1);
        product3.setCreateTime(new Date());
        product3.setLastEditTime(new Date());
        product3.setShop(shop1);
        product3.setProductBrand(pc1);
        int effectNum = productDao.insertProduct(product1);
        assertEquals(1, effectNum);
        effectNum = productDao.insertProduct(product2);
        assertEquals(1, effectNum);
        effectNum = productDao.insertProduct(product3);
        assertEquals(1, effectNum);
    }

    @Test
    public void testBQueryProductList() throws Exception {
        Product productCondition = new Product();
        List<Product> productList = productDao.queryProductList(productCondition, 0, 3);
        assertEquals(3,productList.size());
        int count = productDao.queryProductCount(productCondition);
        assertEquals(6, count);
        productCondition.setProductName("测试");
        productList = productDao.queryProductList(productCondition, 0, 10);
        assertEquals(4, productList.size());
        count = productDao.queryProductCount(productCondition);
        assertEquals(4, count);
    }

    @Test
    @Ignore
    public void testCQueryProductByProductId() throws Exception {
        long productId = 1;
        ProductImg productImg1 = new ProductImg();
        productImg1.setImgAddr(" 图片1");
        productImg1.setImgDesc("测试图片1");
        productImg1.setPriority(1);
        productImg1.setCreateTime(new Date());
        productImg1.setProductId(productId);
        ProductImg productImg2 = new ProductImg();
        productImg2.setImgAddr("图片2");
        productImg2.setPriority(1);
        productImg2.setCreateTime(new Date());
        productImg2.setProductId(productId);
        List<ProductImg> productImgList = new ArrayList<ProductImg>();
        productImgList.add(productImg1);
        productImgList.add(productImg2);
        int effectNum = productImgDao.batInsertProductImg(productImgList);
        assertEquals(2, effectNum);
        Product product = productDao.queryByProductId(productId);
        assertEquals(2, product.getProductImgList().size());
        effectNum = productImgDao.deleteProductImgByProductId(productId);
        assertEquals(2, effectNum);
    }

    @Test
    @Ignore
    public void testDUpdateProduct() throws Exception {
        Product product = new Product();
        ProductBrand pc = new ProductBrand();
        Shop shop = new Shop();
        shop.setShopId(1L);
        pc.setProductBrandId(2L);
        product.setProductId(1L);
        product.setShop(shop);
        product.setProductName("第二个产品");
        product.setProductBrand(pc);
        int effectedNum = productDao.updateProduct(product);
        assertEquals(1, effectedNum);
    }
}
