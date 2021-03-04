package com.javaweb.clothingstore.controller.local;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.javaweb.clothingstore.dto.OrderExcution;
import com.javaweb.clothingstore.entity.LocalAuth;
import com.javaweb.clothingstore.entity.Order;
import com.javaweb.clothingstore.entity.Product;
import com.javaweb.clothingstore.entity.Shop;
import com.javaweb.clothingstore.enums.OrderStateEnum;
import com.javaweb.clothingstore.service.OrderService;
import com.javaweb.clothingstore.service.ProductService;
import com.javaweb.clothingstore.util.HttpServletRequestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/local")
public class OrderOperationController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private ProductService productService;

    @RequestMapping("/generateorder")
    @ResponseBody
    private Map<String, Object> modelMap(HttpServletRequest request) {
        Map<String, Object> modelMap = new HashMap<String, Object>();
        LocalAuth user = (LocalAuth) request.getSession().getAttribute("user");
        user.setUserId(user.getPersonInfo().getUserId());
        List<Order> orderList = new ArrayList<Order>();
        for (int i = 0; ; i++) {
            try {
                ObjectMapper mapper = new ObjectMapper();
                String orderStr = HttpServletRequestUtil.getString(request, "orderStr" + i);
                if (orderStr != null) {
                    Order order = mapper.readValue(orderStr, Order.class);
                    Product product = productService.getProductById(order.getProduct().getProductId());
                    Shop shop = new Shop();
                    shop.setShopId(product.getShop().getShopId());
                    order.setLocalAuth(user);
                    order.setShop(shop);
                    order.setCreateTime(new Date());
                    orderList.add(order);
                } else {
                    break;
                }
            } catch (Exception e) {
                modelMap.put("success", false);
                modelMap.put("errMsg", "generate order error" + e.getMessage());
                return modelMap;
            }
        }
        try {
            OrderExcution oe = orderService.addOrderList(orderList,user);
            if (oe.getState() == OrderStateEnum.SUCCESS.getState()) {
                modelMap.put("success", true);
            } else {
                modelMap.put("success", false);
                modelMap.put("errMsg", oe.getStateInfo());
            }
        } catch (Exception e) {
            modelMap.put("success", false);
            modelMap.put("errMsg", "generate order error" + e.getMessage());
            return modelMap;
        }
        return modelMap;
    }

    @RequestMapping("/getorderlist")
    public String getOrderList(Map<String, Object> modelMap, HttpServletRequest request) {
        LocalAuth user = (LocalAuth) request.getSession().getAttribute("user");
        user.setUserId(user.getPersonInfo().getUserId());
        try {
            Order orderCondition = new Order();
            orderCondition.setLocalAuth(user);
            List<Order> orderList = orderService.getOrderListByUserId(orderCondition);
            modelMap.put("success", true);
            modelMap.put("orderList", orderList);
        } catch (Exception e) {
            modelMap.put("success", false);
            modelMap.put("errMsg", "get orderList Error" + e.getMessage());
            return "redirect: /frontend/listmainpageinfo";
        }
        return "/frontend/orderlist";
    }

    @RequestMapping("/modifyorderstatus")
    @ResponseBody
    private Map<String, Object> modifyOrderStatus(HttpServletRequest request) {
        Map<String, Object> modelMap = new HashMap<String, Object>();
        String orderStr = HttpServletRequestUtil.getString(request, "orderStr");
        ObjectMapper mapper = new ObjectMapper();
        Order order;
        if (orderStr != null) {
            try {
                order = mapper.readValue(orderStr, Order.class);
                OrderExcution oe = orderService.modyfiOrder(order);
                if (oe.getState() == OrderStateEnum.SUCCESS.getState()) {
                    modelMap.put("success", true);
                } else {
                    modelMap.put("success", false);
                    modelMap.put("errMsg", oe.getStateInfo());
                }
            } catch (Exception e) {
                modelMap.put("success", false);
                modelMap.put("errMsg", "modify OrderStatus Error" + e.getMessage());
                return modelMap;
            }
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", OrderStateEnum.EMPTY.getStateInfo());
        }
        return modelMap;
    }
}
