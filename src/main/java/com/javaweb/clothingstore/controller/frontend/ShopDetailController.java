package com.javaweb.clothingstore.controller.frontend;


import com.javaweb.clothingstore.dto.ProductExecution;
import com.javaweb.clothingstore.entity.Product;
import com.javaweb.clothingstore.entity.ProductBrand;
import com.javaweb.clothingstore.entity.Shop;
import com.javaweb.clothingstore.service.ProductBrandService;
import com.javaweb.clothingstore.service.ProductService;
import com.javaweb.clothingstore.service.ShopService;
import com.javaweb.clothingstore.util.HttpServletRequestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/frontend")
public class ShopDetailController {
    @Autowired
    private ShopService shopService;

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductBrandService productBrandService;


    @RequestMapping(value = "/listshopdetailpageinfo", method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> listShopDetailPageInfo(HttpServletRequest request) {
        Map<String, Object> modelMap = new HashMap<String, Object>();
        long shopId = HttpServletRequestUtil.getLong(request, "shopId");
        Shop shop = null;
        List<ProductBrand> productBrandList = null;
        if (shopId != -1) {
            shop = shopService.getByShopId(shopId);
            productBrandList = productBrandService.getProductBrandList(shopId);
            modelMap.put("shop", shop);
            modelMap.put("productBrandList", productBrandList);
            modelMap.put("success", true);
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "empty shopId");
        }
        return modelMap;
    }

    @RequestMapping(value = "/listproductsbyshop", method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> listProductsByShop(HttpServletRequest request) {
        Map<String, Object> modelMap = new HashMap<String, Object>();
        int pageIndex = HttpServletRequestUtil.getInt(request, "pageIndex");
        int pageSize = HttpServletRequestUtil.getInt(request, "pageSize");
        long shopId = HttpServletRequestUtil.getLong(request, "shopId");
        if ((pageIndex > 1) && (pageSize > 1) && (shopId > -1)) {
            long productBrandId = HttpServletRequestUtil.getLong(request, "productBrandId");
            String productName = HttpServletRequestUtil.getString(request, "productName");
            Product productCondition = compactProductCondition4Search(shopId, productBrandId, productName);
            ProductExecution pe = productService.getProductList(productCondition, pageIndex, pageSize);
            modelMap.put("productList", pe.getProductList());
            modelMap.put("count", pe.getCount());
            modelMap.put("success", true);
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "empty pageSize or pageIndex or ShopId");
        }
        return modelMap;
    }

    private Product compactProductCondition4Search(long shopId, long productBrandId, String productName) {
        Product productCondition = new Product();
        Shop shop = new Shop();
        shop.setShopId(shopId);
        productCondition.setShop(shop);
        if (productBrandId != -1L) {
            ProductBrand productBrand = new ProductBrand();
            productBrand.setProductBrandId(productBrandId);
            productCondition.setProductBrand(productBrand);
        }
        if (productName != null) {
            productCondition.setProductName(productName);
        }
        productCondition.setEnableStatus(1);
        return productCondition;
    }
}
