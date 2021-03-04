package com.javaweb.clothingstore.controller.shopadmin;

import com.javaweb.clothingstore.dto.OrderExcution;
import com.javaweb.clothingstore.entity.LocalAuth;
import com.javaweb.clothingstore.entity.Order;
import com.javaweb.clothingstore.entity.Shop;
import com.javaweb.clothingstore.service.LocalAuthService;
import com.javaweb.clothingstore.service.OrderService;
import com.javaweb.clothingstore.util.HttpServletRequestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("/shopadmin")
public class ShopOrderOperationController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private LocalAuthService localAuthService;

    @RequestMapping("/getorderlist")
    public String getOrderList(Map<String, Object> modelMap, HttpServletRequest request) {
        int pageIndex = HttpServletRequestUtil.getInt(request, "pageIndex");
        int pageSize = HttpServletRequestUtil.getInt(request, "pageSize");
        int status = HttpServletRequestUtil.getInt(request, "status");
        Shop shop = (Shop) request.getSession().getAttribute("currentShop");
        if (pageIndex != -1 && pageSize != -1) {
            Order orderCondition = new Order();
            orderCondition.setShop(shop);
            orderCondition.setStatus(status);
            try {
                OrderExcution oe = orderService.getOrderListByShopId(orderCondition, pageIndex, pageSize);
                if (oe.getCount() > 0) {
                    modelMap.put("success", true);
                    modelMap.put("orderList", oe.getOrderList());
                    modelMap.put("count", oe.getCount());
                } else {
                    modelMap.put("success", false);
                    modelMap.put("errMsg", "查询不到任何订单");
                }
            } catch (Exception e) {
                modelMap.put("success", false);
                modelMap.put("errMsg", "Get orderlist error" + e.getMessage());
                return "redirect: /shopadmin/getshopmanagementinfo";
            }
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "Empty pageindex or empty pagesize");
        }
        if (status == 1) {
            return "shop/ordernoship";
        } else if (status == 2) {
            return "shop/ordership";
        } else if (status == 3) {
            return "shop/orderrefund";
        } else if (status == 4) {
            return "shop/orderrefunded";
        } else {
            return "shop/orderfinish";
        }
    }

    @RequestMapping("/getorderbyorderid")
    public String getOrderByOrderId(Map<String, Object> modelMap, HttpServletRequest request) {
        long orderId = HttpServletRequestUtil.getLong(request, "orderId");
        if (orderId > -1) {
            try {
                Order order = orderService.getOrderByOrderId(orderId);
                if (order != null) {
                    LocalAuth customer = localAuthService.getLocalAuthByUserId(order.getLocalAuth().getUserId());
                    modelMap.put("order", order);
                    modelMap.put("customer",customer);
                } else {
                    modelMap.put("success", false);
                    modelMap.put("errMsg", "cannot get order");
                }
            } catch (Exception e) {
                modelMap.put("success", false);
                modelMap.put("errMsg", "get Order information error" + e.getMessage());
                return "redirect: /shopadmin/getshopmanagementinfo";
            }
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "orderId is null");
        }
        return "shop/orderdetail";

    }
}
