package com.javaweb.clothingstore.service;

import com.javaweb.clothingstore.dto.ImageHolder;
import com.javaweb.clothingstore.dto.ShopExecution;
import com.javaweb.clothingstore.entity.Shop;
import com.javaweb.clothingstore.exceptions.ShopOperationException;

public interface ShopService {
    ShopExecution getShopList(Shop shopCondition, int pageIndex, int pageSize);

    Shop getByShopId(Long shopId);

    ShopExecution modifyShop(Shop shop, ImageHolder thumbnail) throws ShopOperationException;

    ShopExecution addShop(Shop shop, ImageHolder thumbnail) throws ShopOperationException;

    ShopExecution getAllShop();
}
