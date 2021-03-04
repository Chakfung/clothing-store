package com.javaweb.clothingstore.controller.local;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.javaweb.clothingstore.dto.CartExecution;
import com.javaweb.clothingstore.entity.Cart;
import com.javaweb.clothingstore.entity.LocalAuth;
import com.javaweb.clothingstore.enums.CartStateEnum;
import com.javaweb.clothingstore.service.CartService;
import com.javaweb.clothingstore.util.HttpServletRequestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/local")
public class CartOperationController {
    @Autowired
    private CartService cartService;

    @RequestMapping("/addcart")
    @ResponseBody
    private Map<String, Object> addCart(HttpServletRequest request) {
        Map<String, Object> modelMap = new HashMap<String, Object>();
        LocalAuth user = (LocalAuth) request.getSession().getAttribute("user");
        String cartStr = HttpServletRequestUtil.getString(request, "cartStr");
        ObjectMapper mapper = new ObjectMapper();
        Cart cart = null;
        Cart ifexistcart = null;
        try {
            cart = mapper.readValue(cartStr, Cart.class);
            cart.setLocalAuth(user);
            ifexistcart = cartService.getCartByUserIdAndProductId(user.getPersonInfo().getUserId(), cart.getProduct().getProductId());
        } catch (Exception e) {
            modelMap.put("success", false);
            modelMap.put("errMsg", e.getMessage());
            return modelMap;
        }
        CartExecution ce;
        if (ifexistcart == null) {
            try {
                ce = cartService.addCart(cart);
                if (ce != null && ce.getState() == CartStateEnum.SUCCESS.getState()) {
                    modelMap.put("success", true);
                } else {
                    modelMap.put("success", false);
                    modelMap.put("errMsg", ce.getStateInfo());
                }
            } catch (Exception e) {
                modelMap.put("success", false);
                modelMap.put("errMsg", e.getMessage());
                return modelMap;
            }
        } else {
            try {
                ifexistcart.setNum(ifexistcart.getNum() + cart.getNum());
                ce = cartService.editCart(ifexistcart);
                if (ce != null && ce.getState() == CartStateEnum.SUCCESS.getState()) {
                    modelMap.put("success", true);
                } else {
                    modelMap.put("success", false);
                    modelMap.put("errMsg", ce.getStateInfo());
                }
            } catch (Exception e) {
                modelMap.put("success", false);
                modelMap.put("errMsg", e.getMessage());
                return modelMap;
            }
        }
        return modelMap;
    }

    @RequestMapping("/getcartlist")
    public String getCartList(Map<String, Object> modelMap, HttpServletRequest request) {
        LocalAuth user = (LocalAuth) request.getSession().getAttribute("user");
        long userId = user.getPersonInfo().getUserId();
        try {
            CartExecution ce = cartService.getCartListByUserId(userId);
            if (ce.getState() == CartStateEnum.SUCCESS.getState()) {
                modelMap.put("success", true);
                modelMap.put("cartList", ce.getCartList());
            } else {
                modelMap.put("success", false);
                modelMap.put("errMsg", ce.getStateInfo());
            }
            return "/frontend/cartlist";
        } catch (Exception e) {
            modelMap.put("success", false);
            modelMap.put("errMsg", "get Cart List Exception" + e.getMessage());
            return "/frontend/home";
        }
    }

    @RequestMapping("/removecart")
    @ResponseBody
    private Map<String, Object> removeCart(HttpServletRequest request) {
        Map<String, Object> modelMap = new HashMap<String, Object>();
        long cartId = HttpServletRequestUtil.getLong(request, "cartId");
        if (cartId > -1) {
            try {
                CartExecution ce = cartService.removeCart(cartId);
                if (ce.getState() == CartStateEnum.SUCCESS.getState()) {
                    modelMap.put("success", true);
                } else {
                    modelMap.put("success", false);
                    modelMap.put("errMsg", ce.getStateInfo());
                }
            } catch (Exception e) {
                modelMap.put("success", false);
                modelMap.put("errMsg", e.getMessage());
                return modelMap;
            }
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "cartId is NULL");
        }
        return modelMap;
    }
}
