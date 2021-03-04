package com.javaweb.clothingstore.controller.local;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.javaweb.clothingstore.dto.LocalAuthExecution;
import com.javaweb.clothingstore.entity.LocalAuth;
import com.javaweb.clothingstore.entity.PersonInfo;
import com.javaweb.clothingstore.enums.LocalAuthStateEnum;
import com.javaweb.clothingstore.service.LocalAuthService;
import com.javaweb.clothingstore.service.PersonInfoService;
import com.javaweb.clothingstore.util.CodeUtil;
import com.javaweb.clothingstore.util.HttpServletRequestUtil;
import com.javaweb.clothingstore.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/local")
public class LocalOperationController {
    @Autowired
    private LocalAuthService localAuthService;

    @Autowired
    private PersonInfoService personInfoService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(Map<String, Object> modelMap, HttpServletRequest request) {
        boolean needVerify = HttpServletRequestUtil.getBoolean(request, "needVerify");
        if (needVerify && !CodeUtil.checkVerifyCode(request)) {
            modelMap.put("success", false);
            modelMap.put("errMsg", "输入了错误的验证码");
            return "local/login";
        }

        String username = HttpServletRequestUtil.getString(request, "username");
        String password = HttpServletRequestUtil.getString(request, "password");
        if (username != null && password != null) {
            LocalAuth localAuth = localAuthService.getLocalAuthByUsernameAndPwd(username, password);
            if (localAuth != null) {
                modelMap.put("success", true);
                request.getSession().setAttribute("user", localAuth);
                if (localAuth.getPersonInfo().getUserType() == 2) {
                    return "redirect: /shopadmin/getshoplist";
                } else if (localAuth.getPersonInfo().getUserType() == 1) {
                    return "redirect: /frontend/listmainpageinfo";
                } else {
                    return "redirect: /superadmin/to_mainpage";
                }
            } else {
                modelMap.put("success", false);
                modelMap.put("errMsg", "用户名或密码为空");
                return "local/login";
            }
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "用户名和密码不能为空");
            return "local/login";
        }
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    private Map<String, Object> register(HttpServletRequest request) {
        Map<String, Object> modelMap = new HashMap<String, Object>();
        String password = HttpServletRequestUtil.getString(request, "password");
        String confirmpsw = HttpServletRequestUtil.getString(request, "confirmpsw");
        if (password != null && confirmpsw != null && password.equals(confirmpsw)) {
            String localAuthStr = HttpServletRequestUtil.getString(request, "localAuthStr");
            String personInfoStr = HttpServletRequestUtil.getString(request, "personInfoStr");
            ObjectMapper mapper = new ObjectMapper();
            PersonInfo personInfo;
            LocalAuth localAuth;
            if (localAuthStr != null && personInfoStr != null) {
                try {
                    personInfo = mapper.readValue(personInfoStr, PersonInfo.class);
                    personInfo.setEnableStatus(1);
                    personInfo.setUserType(1);
                    personInfo.setCreateTime(new Date());
                    personInfo.setLastEditTime(new Date());
                    int effectedNum = personInfoService.addPersonInfo(personInfo);
                    if (effectedNum > 0) {
                        PersonInfo newpersonInfo = personInfoService.getPersonInfoByEmail(personInfo);
                        if (newpersonInfo != null) {
                            localAuth = mapper.readValue(localAuthStr, LocalAuth.class);
                            localAuth.setPassword(MD5.getMd5(password));
                            localAuth.setUserId(newpersonInfo.getUserId());
                            localAuth.setCreateTime(new Date());
                            localAuth.setLastEditTime(new Date());
                            LocalAuthExecution le = localAuthService.addLocalAuth(localAuth);
                            if (le.getState() == LocalAuthStateEnum.SUCCESS.getState()) {
                                modelMap.put("success", true);
                            } else {
                                modelMap.put("success", false);
                                modelMap.put("errMsg", "regist unsuccessfully"+le.getStateinfo());
                            }
                        }
                    } else {
                        modelMap.put("success", false);
                        modelMap.put("errMsg", "regist unsuccessfully");
                    }
                } catch (Exception e) {
                    modelMap.put("success", false);
                    modelMap.put("errMsg", "regist error" + e.getMessage());
                    return modelMap;
                }
            }
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "password is null or password are inconsistent ");
        }
        return modelMap;
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().setAttribute("user", null);
        return "local/login";
    }
}
