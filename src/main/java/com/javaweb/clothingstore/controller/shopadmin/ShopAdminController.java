package com.javaweb.clothingstore.controller.shopadmin;

import com.javaweb.clothingstore.entity.Shop;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "shopadmin", method = {RequestMethod.GET})
public class ShopAdminController {


    @RequestMapping(value = "/shopoperation")
    public String shopOperation() {
        return "shop/shopoperation";
    }


    @RequestMapping(value = "/shopmanagement")
    public String shopManagement(Model model,HttpServletRequest request) {
        Shop shop = (Shop) request.getSession().getAttribute("currentShop");
        return "shop/shopmanagement";
    }

    @RequestMapping("/productoperation")
    public String productOperation() {
        return "shop/productoperation";
    }

    @RequestMapping("/productmanagement")
    public String productManagement() {
        return "shop/productbrandmanagement";
    }
}
