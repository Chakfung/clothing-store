package com.javaweb.clothingstore.controller.shopadmin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.javaweb.clothingstore.dto.ProductBrandExecution;
import com.javaweb.clothingstore.entity.ProductBrand;
import com.javaweb.clothingstore.entity.Shop;
import com.javaweb.clothingstore.enums.ProductBrandStateEnum;
import com.javaweb.clothingstore.service.ProductBrandService;
import com.javaweb.clothingstore.util.HttpServletRequestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller("shopadminProductBrandOperationController")
@RequestMapping("/shopadmin")
public class ProductBrandOperationController {
    @Autowired
    private ProductBrandService productBrandService;

    @RequestMapping(value = "/getproductBrandlist", method = RequestMethod.GET)
    public String productBrandManagement(Map<String, Object> modelMap, HttpServletRequest request) {
        Shop currentShop = (Shop) request.getSession().getAttribute("currentShop");
        List<ProductBrand> list = null;
        if (currentShop != null && currentShop.getShopId() > 0) {
            list = productBrandService.getProductBrandList(currentShop.getShopId());
            modelMap.put("productBrandList", list);
            return "shop/productbrandmanagement";
        } else {
            ProductBrandStateEnum ps = ProductBrandStateEnum.INNER_ERROR;
            modelMap.put("errMsg", ps.getStateInfo());
            return "shop/shopmanagement";
        }
    }

    @RequestMapping("/to_addproductbrand")
    public String toAddProductBrand() {
        return "shop/productbrandadd";
    }

    @RequestMapping("/addproductbrand")
    @ResponseBody
    private Map<String, Object> addProductBrand(HttpServletRequest request) {
        Map<String, Object> modelMap = new HashMap<String, Object>();
        String brandStr = HttpServletRequestUtil.getString(request, "brandStr");
        if (brandStr != null) {
            ProductBrand productBrand = null;
            ObjectMapper mapper = new ObjectMapper();
            List<ProductBrand> productBrandList = new ArrayList<ProductBrand>();
            try {
                productBrand = mapper.readValue(brandStr, ProductBrand.class);
                if (productBrand != null) {
                    Shop currentShop = (Shop) request.getSession().getAttribute("currentShop");
                    productBrand.setShopId(currentShop.getShopId());
                    productBrand.setCreateTime(new Date());
                    productBrandList.add(productBrand);
                    ProductBrandExecution pe = productBrandService.batchAddProductBrand(productBrandList);
                    if (pe.getState() == ProductBrandStateEnum.SUCCESS.getState()) {
                        modelMap.put("success", true);
                    } else {
                        modelMap.put("success", false);
                        modelMap.put("errMsg", pe.getStateInfo());
                    }
                } else {
                    modelMap.put("success", false);
                    modelMap.put("errMsg", "init brand error");
                }
            } catch (Exception e) {
                modelMap.put("success", false);
                modelMap.put("errMsg", "add brand exception " + e.getMessage());
                return modelMap;
            }
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "brand is NULL");
        }
        return modelMap;
    }

    @RequestMapping("/removebrand")
    @ResponseBody
    private Map<String, Object> removeBrand(HttpServletRequest request) {
        Map<String, Object> modelMap = new HashMap<String, Object>();
        long brandId = HttpServletRequestUtil.getLong(request, "brandId");
        if (brandId > -1) {
            try {
                ProductBrandExecution pe = productBrandService.deleteProductBrand(brandId);
                if (pe.getState() == ProductBrandStateEnum.SUCCESS.getState()) {
                    modelMap.put("success", true);
                } else {
                    modelMap.put("success", false);
                    modelMap.put("errMsg", pe.getStateInfo());
                }
            } catch (Exception e) {
                modelMap.put("success", false);
                modelMap.put("errMsg", "remove Brand exception " + e.getMessage());
                return modelMap;
            }
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "brandId is NULL");
        }
        return modelMap;
    }



    @RequestMapping("/to_hotproduct")
    public String toHotproduct() {
        return "shop/hotproduct";
    }
    @RequestMapping("/to_turnover")
    public String toTurnover() {
        return "shop/turnover";
    }
}
