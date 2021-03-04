package com.javaweb.clothingstore.controller.superadmin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.javaweb.clothingstore.dto.ShopExecution;
import com.javaweb.clothingstore.entity.Shop;
import com.javaweb.clothingstore.enums.ShopStateEnum;
import com.javaweb.clothingstore.service.ShopService;
import com.javaweb.clothingstore.util.HttpServletRequestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/superadmin")
public class ShopOperationController {
    @Autowired
    private ShopService shopService;

    @RequestMapping("/getallshop")
    public String getAllShop(Map<String, Object> modelMap) {
        ShopExecution se = shopService.getAllShop();
        if (se.getState() == ShopStateEnum.SUCCESS.getState()) {
            modelMap.put("success", true);
            modelMap.put("shopList", se.getShopList());
            return "superadmin/shoplist";
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", se.getStateInfo());
            return "superadmin/operation";
        }
    }

    @RequestMapping("/changeshopstatus")
    @ResponseBody
    private Map<String, Object> changeShopStatus(HttpServletRequest request) {
        Map<String, Object> modelMap = new HashMap<String, Object>();
        String shopStr = HttpServletRequestUtil.getString(request, "shopStr");
        ObjectMapper mapper = new ObjectMapper();
        Shop shop = null;
        try {
            shop = mapper.readValue(shopStr, Shop.class);
            if (shop != null && shop.getShopId() != null) {
                ShopExecution se = shopService.modifyShop(shop, null);
                if (se.getState() == ShopStateEnum.SUCCESS.getState()) {
                    modelMap.put("success", true);
                } else {
                    modelMap.put("success", false);
                    modelMap.put("errMsg", se.getStateInfo());
                }
            } else {
                modelMap.put("success", false);
                modelMap.put("errMsg", ShopStateEnum.NULL_SHOP.getStateInfo());
            }
        } catch (Exception e) {
            modelMap.put("success", false);
            modelMap.put("errMsg", e.getMessage());
            return modelMap;
        }
        return modelMap;
    }

}
