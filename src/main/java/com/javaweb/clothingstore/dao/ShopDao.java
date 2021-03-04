package com.javaweb.clothingstore.dao;

import com.javaweb.clothingstore.entity.Shop;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShopDao {

    List<Shop> queryShopList(@Param("shopCondition") Shop shopCondition, @Param("rowIndex") int rowIndex, @Param("pageSize") int pageSize);

    int queryShopCount(@Param("shopCondition") Shop shopCondition);

    Shop queryByShopId(Long shopId);

    int insertShop(Shop shop);

    int updateShop(Shop shop);

    List<Shop> selectAllShop();

}
