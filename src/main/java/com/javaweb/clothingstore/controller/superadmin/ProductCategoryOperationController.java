package com.javaweb.clothingstore.controller.superadmin;

import com.javaweb.clothingstore.entity.ProductCategory;
import com.javaweb.clothingstore.service.ProductCategoryService;
import com.javaweb.clothingstore.util.HttpServletRequestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/superadmin")
public class ProductCategoryOperationController {
    @Autowired
    private ProductCategoryService productCategoryService;

    @RequestMapping("/getparentpc")
    public String getParentProductCategory(Map<String, Object> modelMap) {
        try {
            List<ProductCategory> productCategoryList = productCategoryService.getProductCategoryList(null);
            if (productCategoryList != null && productCategoryList.size() > 0) {
                modelMap.put("success", true);
                modelMap.put("productCategoryList", productCategoryList);
                return "superadmin/parentpc";
            } else {
                modelMap.put("success", false);
                modelMap.put("errMsg", "can not get parentProductCategoryList");
                return "superadmin/operation";
            }
        } catch (Exception e) {
            modelMap.put("success", false);
            modelMap.put("errMsg", "get parentProductCategoryList exception" + e.getMessage());
            return "superadmin/operation";
        }
    }

    @RequestMapping("getchildpc")
    public String getChildProductCategory(Map<String, Object> modelMap, HttpServletRequest request) {
        long parentId = HttpServletRequestUtil.getLong(request, "parentId");
        if (parentId > -1) {
            ProductCategory parentPC = new ProductCategory();
            parentPC.setProductCategoryId(parentId);
            ProductCategory childPC = new ProductCategory();
            childPC.setParent(parentPC);
            List<ProductCategory> productCategoryList = productCategoryService.getProductCategoryList(childPC);
            if (productCategoryList != null && productCategoryList.size() > 0) {
                modelMap.put("success", true);
                modelMap.put("parentId", parentId);
                modelMap.put("productCategoryList", productCategoryList);
                return "superadmin/childpc";
            } else {
                modelMap.put("success", false);
                modelMap.put("errMsg", "can get childProductCategory");
                return "superadmin/operation";
            }
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "parentId is NULL");
            return "superadmin/operation";
        }
    }

    @RequestMapping(value = "/addchildpc", method = RequestMethod.POST)
    @ResponseBody
    private Map<String, Object> addAreaList(@RequestBody List<ProductCategory> productCategoryList, HttpServletRequest request) {
        Map<String, Object> modelMap = new HashMap<String, Object>();
        if (productCategoryList != null && productCategoryList.size() > 0) {
            for (int i = 0; i < productCategoryList.size(); i++) {
                productCategoryList.get(i).setCreateTime(new Date());
                productCategoryList.get(i).setLastEditTime(new Date());
            }
            try {
                int effectedNum = productCategoryService.addProductCategoryList(productCategoryList);
                if (effectedNum>0) {
                    modelMap.put("success", true);
                } else {
                    modelMap.put("success", false);
                    modelMap.put("errMsg", "can not add childproductcategory");
                }
            } catch (Exception e) {
                modelMap.put("success", false);
                modelMap.put("errMsg", "add childproductcategory error"+e.getMessage());
                return modelMap;
            }
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "childproductcategorylist is null");
        }
        return modelMap;
    }

    @RequestMapping("/removepc")
    @ResponseBody
    private Map<String, Object> removeProductCategory(HttpServletRequest request) {
        Map<String, Object> modelMap = new HashMap<String, Object>();
        long productCategoryId = HttpServletRequestUtil.getLong(request, "productCategoryId");
        if (productCategoryId > -1) {
            try {
                int effectedNum = productCategoryService.removeProductCategory(productCategoryId);
                if (effectedNum > 0) {
                    modelMap.put("success", true);
                } else {
                    modelMap.put("success", false);
                    modelMap.put("errMsg", "can not remove childproductcategory");
                }
            } catch (Exception e) {
                modelMap.put("success", true);
                modelMap.put("errMsg", "remove productcategory exception " + e.getMessage());
                return modelMap;
            }
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "areaId is NULL");
        }
        return modelMap;
    }
}
