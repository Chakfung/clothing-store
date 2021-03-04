package com.javaweb.clothingstore.service;

import com.javaweb.clothingstore.BaseTest;
import com.javaweb.clothingstore.dto.ImageHolder;
import com.javaweb.clothingstore.dto.ProductExecution;
import com.javaweb.clothingstore.entity.Product;
import com.javaweb.clothingstore.entity.ProductBrand;
import com.javaweb.clothingstore.entity.Shop;
import com.javaweb.clothingstore.enums.ProductStateEnum;
import com.javaweb.clothingstore.exceptions.ShopOperationException;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.assertEquals;

public class ProductServiceTest extends BaseTest {
    @Autowired
    private ProductService productService;

    @Test
    @Ignore
    public void testAddProduct() throws ShopOperationException, FileNotFoundException {
        Product product = new Product();
        Shop shop = new Shop();
        shop.setShopId(1L);
        ProductBrand pc = new ProductBrand();
        pc.setProductBrandId(2L);
        product.setShop(shop);
        product.setProductBrand(pc);
        product.setProductName("测试商品1");
        product.setProductDesc("测试描述1");
        product.setPriority(20);
        product.setCreateTime(new Date());
        product.setEnableStatus(ProductStateEnum.SUCCESS.getState());
        File thumbnailFile = new File("D:/SSM/imooc/SSM到SpringBoot/images/item/shop/20/2017060620114126875.jpg");
        InputStream is = new FileInputStream(thumbnailFile);
        ImageHolder imageHolder = new ImageHolder(is, thumbnailFile.getName());
        File productImg1 = new File("D:/SSM/imooc/SSM到SpringBoot/images/item/shop/20/20170606201141387851.jpg");
        InputStream is1 = new FileInputStream(productImg1);
        File productImg2 = new File("D:/SSM/imooc/SSM到SpringBoot/images/item/shop/20/20170606201141425050.jpg");
        InputStream is2 = new FileInputStream(productImg2);
        List<ImageHolder> productImgList = new ArrayList<ImageHolder>();
        productImgList.add(new ImageHolder(is1, productImg1.getName()));
        productImgList.add(new ImageHolder(is2, productImg2.getName()));
        ProductExecution pe = productService.addProduct(product, imageHolder, productImgList);
        assertEquals(ProductStateEnum.SUCCESS.getState(), pe.getState());
    }

    @Test
    public void testModifyProduct() throws ShopOperationException,FileNotFoundException {
        Product product = new Product();
        Shop shop = new Shop();
        shop.setShopId(1L);
        ProductBrand pc = new ProductBrand();
        pc.setProductBrandId(2L);
        product.setProductId(1L);
        product.setShop(shop);
        product.setProductBrand(pc);
        product.setProductName("正式的商品");
        product.setProductDesc("正式的商品");
        File thumnbnailFile = new File("D:/SSM/imooc/SSM到SpringBoot/images/item/shop/15/20170605234852321010.jpg");
        InputStream is = new FileInputStream(thumnbnailFile);
        ImageHolder thumbnail = new ImageHolder(is, thumnbnailFile.getName());
        File productImg1 = new File("D:/SSM/imooc/SSM到SpringBoot/images/item/shop/25/2017060609381150709.png");
        InputStream is1 = new FileInputStream(productImg1);
        File productImg2 = new File("D:/SSM/imooc/SSM到SpringBoot/images/item/shop/15/20170606085020558290.jpg");
        InputStream is2 = new FileInputStream(productImg2);
        List<ImageHolder> productImgHolderList = new ArrayList<ImageHolder>();
        productImgHolderList.add(new ImageHolder(is1, productImg1.getName()));
        productImgHolderList.add(new ImageHolder(is2, productImg2.getName()));
        ProductExecution pe = productService.modifyProduct(product, thumbnail, productImgHolderList);
        assertEquals(ProductStateEnum.SUCCESS.getState(), pe.getState());
    }
}
