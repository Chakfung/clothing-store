/*
package com.javaweb.clothingstore.service;

import com.javaweb.clothingstore.BaseTest;
import com.javaweb.clothingstore.dto.ImageHolder;
import com.javaweb.clothingstore.dto.ShopExecution;
import com.javaweb.clothingstore.entity.Area;
import com.javaweb.clothingstore.entity.PersonInfo;
import com.javaweb.clothingstore.entity.Shop;
import com.javaweb.clothingstore.entity.ProductCategory;
import com.javaweb.clothingstore.enums.ShopStateEnum;
import com.javaweb.clothingstore.exceptions.ShopOperationException;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Date;

import static org.junit.Assert.assertEquals;

public class ShopServiceTest extends BaseTest {
    @Autowired
    private ShopService shopService;

    @Test
    public void testGetShopList() {
        Shop shopCondition = new Shop();
        ProductCategory sc = new ProductCategory();
        sc.setShopCategoryId(2L);
        shopCondition.setShopCategory(sc);
        ShopExecution se = shopService.getShopList(shopCondition, 3, 2);
        System.out.println("店铺列表数" + se.getShopList().size());
        System.out.println("店铺总数" + se.getCount());
    }

    @Test
    @Ignore
    public void testModifyShop() throws ShopOperationException,FileNotFoundException{
        Shop shop = new Shop();
        shop.setShopId(1L);
        shop.setShopName("修改后的店铺名称");
        File shopImg = new File("C:\\Users\\Derrick\\Pictures\\0.jpg");
        InputStream is = new FileInputStream(shopImg);
        ImageHolder imageHolder = new ImageHolder(is, shopImg.getName());
        ShopExecution shopExecution = shopService.modifyShop(shop, imageHolder);
        System.out.println("新的图片地址:"+shopExecution.getShop().getShopImg());
    }

    @Test
    @Ignore
    public void testAddShop() {
        Shop shop = new Shop();
        PersonInfo owner = new PersonInfo();
        Area area = new Area();
        ProductCategory shopCategory = new ProductCategory();
        owner.setUserId(1L);
        area.setAreaId(2);
        shopCategory.setShopCategoryId(1L);
        shop.setOwner(owner);
        shop.setArea(area);
        shop.setShopCategory(shopCategory);
        shop.setShopName("测试的店铺2");
        shop.setShopDesc("test1");
        shop.setShopAddr("test1");
        shop.setPhone("test1");
        shop.setCreateTime(new Date());
        shop.setEnableStatus(ShopStateEnum.CHECK.getState());
        shop.setAdvice("审核中");
        File shopImg = new File("C:\\Users\\Derrick\\Pictures\\t01f780585200f4a03d.jpg");
        try {
            InputStream fis = new FileInputStream(shopImg);
            ImageHolder imageHolder = new ImageHolder(fis, shopImg.getName());
            ShopExecution se = shopService.addShop(shop, imageHolder);
            assertEquals(ShopStateEnum.CHECK.getState(),se.getState());
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
}
*/
