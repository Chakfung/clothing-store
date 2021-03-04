package com.javaweb.clothingstore.interceptor.shopadmin;

import com.javaweb.clothingstore.entity.LocalAuth;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class ShopLoginInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object userObj = request.getSession().getAttribute("user");
        if (userObj != null) {
            LocalAuth user = (LocalAuth) userObj;
            if (user != null && user.getPersonInfo().getUserId() != null && user.getPersonInfo().getUserId() > 0 && user.getPersonInfo().getEnableStatus() == 1) {
                return true;
            }
        }

        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<script>");
        out.println("window.open('" + request.getContextPath() + "/local/to_login','_self')");
        out.println("</script>");
        out.println("</html>");
        return false;
    }
}
