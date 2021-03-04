package com.javaweb.clothingstore.controller.frontend;

import com.javaweb.clothingstore.dto.HeadLineExecution;
import com.javaweb.clothingstore.dto.ProductExecution;
import com.javaweb.clothingstore.entity.*;
import com.javaweb.clothingstore.service.HeadLineService;
import com.javaweb.clothingstore.service.ProductBrandService;
import com.javaweb.clothingstore.service.ProductCategoryService;
import com.javaweb.clothingstore.service.ProductService;
import com.javaweb.clothingstore.util.HttpServletRequestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/frontend")
public class MainPageController {
    @Autowired
    private ProductCategoryService productCategoryService;

    @Autowired
    private ProductBrandService productBrandService;

    @Autowired
    private HeadLineService headLineService;

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/listmainpageinfo", method = RequestMethod.GET)
    public String  listMainPageInfo( Map<String, Object> modelMap,HttpServletRequest request) {
        List<ProductCategory> productParentCategoryList = new ArrayList<ProductCategory>();
        List<ProductCategory> productChildCategoryList;
        try {
            productParentCategoryList = productCategoryService.getProductCategoryList(null);
            productChildCategoryList = productCategoryService.getProductCategoryList(new ProductCategory());
            request.getSession().setAttribute("productParentCategoryList", productParentCategoryList);
            request.getSession().setAttribute("productChildCategoryList", productChildCategoryList);
        } catch (Exception e) {
            modelMap.put("success", false);
            modelMap.put("errMsg", e.getMessage());
            return "local/login";
        }
        List<HeadLine> headLineList = new ArrayList<HeadLine>();
        try {
            HeadLine headLineCondition = new HeadLine();
            headLineCondition.setEnableStatus(1);
            HeadLineExecution he = headLineService.getHeadLineList(headLineCondition, 0, 4);
            modelMap.put("headLineList", he.getHeadLineList());
        } catch (Exception e) {
            modelMap.put("success", false);
            modelMap.put("errMsg", e.getMessage());
            return "local/login";
        }
        List<ProductBrand> productBrandList;
        try {
            productBrandList = productBrandService.getProductBrandList(null);
            request.getSession().setAttribute("productBrandList", productBrandList);
        } catch (Exception e) {
            modelMap.put("success", false);
            modelMap.put("errMsg", e.getMessage());
            return "local/login";
        }
        try {
            Product capCondition = compactProductCondition(-1L, -1L, -1L, null, 1);
            ProductExecution cappe = productService.getProductList(capCondition, 1, 4);
            Product upCondition = compactProductCondition(-1L, -1L, -1L, null, 2);
            ProductExecution uppe = productService.getProductList(upCondition, 1, 4);
            Product downCondition = compactProductCondition(-1L, -1L, -1L, null, 3);
            ProductExecution downpe = productService.getProductList(downCondition, 1, 4);
            Product shoeCondition = compactProductCondition(-1L, -1L, -1L, null, 4);
            ProductExecution shoepe = productService.getProductList(shoeCondition, 1, 4);
            modelMap.put("capList", cappe.getProductList());
            modelMap.put("upList", uppe.getProductList());
            modelMap.put("downList", downpe.getProductList());
            modelMap.put("shoeList", shoepe.getProductList());
        } catch (Exception e) {
            modelMap.put("success", false);
            modelMap.put("errMsg", e.getMessage());
            return "local/login";
        }
        return "frontend/home";
    }

    @RequestMapping("/search")
    public String search(Map<String, Object> modelMap, HttpServletRequest request) {
        int pageIndex = HttpServletRequestUtil.getInt(request, "pageIndex");
        long shopId = HttpServletRequestUtil.getLong(request, "shopId");
        long productBrandId = HttpServletRequestUtil.getLong(request, "pbid");
        long productCategoryId = HttpServletRequestUtil.getLong(request, "pcid");
        long parentId = HttpServletRequestUtil.getLong(request, "parentid");
        String productName = HttpServletRequestUtil.getString(request, "pn");
        Product productConditon = compactProductCondition(shopId, productBrandId, productCategoryId, productName,parentId);
        try {
            ProductExecution pe = productService.getProductList(productConditon, pageIndex, 100);
            modelMap.put("productList", pe.getProductList());
            modelMap.put("count", pe.getCount());
            return "frontend/shop";
        } catch (Exception e) {
            modelMap.put("success", false);
            modelMap.put("errMsg", "get product list err" + e.getMessage());
            return "redirect: /frontend/listmainpageinfo";
        }
    }

    @RequestMapping("/getproductbyid")
    public String getProductById(Map<String, Object> modelMap, HttpServletRequest request) {
        long productId = HttpServletRequestUtil.getLong(request, "productId");
        if (productId > -1) {
            try {
                Product product = productService.getProductById(productId);
                if (product != null) {
                    modelMap.put("product", product);
                    return "frontend/productdetail";
                } else {
                    modelMap.put("success", false);
                    modelMap.put("errMsg", "can't get detail about this product");
                    return "frontend/home";
                }
            } catch (Exception e) {
                modelMap.put("success", false);
                modelMap.put("errMsg", "get product detail error" + e.getMessage());
                return "frontend/home";
            }
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "productId is NULL");
            return "frontend/home";
        }
    }

    private Product compactProductCondition(long shopId, long productBrandId,long productCategoryId, String productName,long parentId) {
        Product productCondition = new Product();

        if (parentId != -1L) {
            ProductCategory parent = new ProductCategory();
            parent.setProductCategoryId(parentId);
            ProductCategory child = new ProductCategory();
            child.setParent(parent);
            productCondition.setProductCategory(child);
        }

        if (shopId != -1L) {
            Shop shop = new Shop();
            shop.setShopId(shopId);
            productCondition.setShop(shop);
        }

        if (productCategoryId != -1L) {
            ProductCategory productCategory = new ProductCategory();
            productCategory.setProductCategoryId(productCategoryId);
            productCondition.setProductCategory(productCategory);
        }

        if (productBrandId != -1L) {
            ProductBrand productBrand = new ProductBrand();
            productBrand.setProductBrandId(productBrandId);
            productCondition.setProductBrand(productBrand);
        }

        if (productName != null) {
            productCondition.setProductName(productName);
        }
        return productCondition;
    }
}
