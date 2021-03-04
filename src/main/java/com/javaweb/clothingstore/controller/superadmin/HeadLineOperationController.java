package com.javaweb.clothingstore.controller.superadmin;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.javaweb.clothingstore.dto.HeadLineExecution;
import com.javaweb.clothingstore.dto.ImageHolder;
import com.javaweb.clothingstore.dto.ShopExecution;
import com.javaweb.clothingstore.entity.HeadLine;
import com.javaweb.clothingstore.entity.Shop;
import com.javaweb.clothingstore.enums.HeadLineEnum;
import com.javaweb.clothingstore.service.HeadLineService;
import com.javaweb.clothingstore.service.ShopService;
import com.javaweb.clothingstore.util.CodeUtil;
import com.javaweb.clothingstore.util.HttpServletRequestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/superadmin")
public class HeadLineOperationController {
    @Autowired
    private HeadLineService headLineService;

    @Autowired
    private ShopService shopService;

    @RequestMapping("/to_addheadline")
    public String toAddHeadLIne(Map<String,Object> modelMap) {
        try {
            ShopExecution se = shopService.getShopList(new Shop(), 0, 100);
            modelMap.put("shopList", se.getShopList());
        } catch (Exception e) {
            modelMap.put("success", false);
            modelMap.put("errMsg", e.getMessage());
        }
        return "superadmin/aoeheadline";
    }

    @RequestMapping("/getheadlinelist")
    public String getHeadLineList(Map<String, Object> modelMap) {
        HeadLineExecution he = headLineService.getHeadLineList(new HeadLine(), 0, 0);
        if (he.getState() == HeadLineEnum.SUCCESS.getState()) {
            modelMap.put("success", true);
            modelMap.put("headLineList", he.getHeadLineList());
            return "superadmin/headlinelist";
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", he.getStateInfo());
            return "redirect: /superadmin/to_mainpage";
        }
    }

    @RequestMapping("/addheadline")
    @ResponseBody
    private Map<String, Object> addHeadLine(HttpServletRequest request) {
        Map<String, Object> modelMap = new HashMap<String, Object>();
        if (!CodeUtil.checkVerifyCode(request)) {
            modelMap.put("success", false);
            modelMap.put("errMsg", "输入了错误的验证码");
            return modelMap;
        }
        String headLineStr = HttpServletRequestUtil.getString(request, "headLineStr");
        ObjectMapper mapper = new ObjectMapper();
        HeadLine headLine = null;
        try {
            headLine = mapper.readValue(headLineStr, HeadLine.class);
        } catch (Exception e) {
            modelMap.put("success", false);
            modelMap.put("errMsg", "init HeadLine exception" + e.getMessage());
            return modelMap;
        }
        CommonsMultipartFile lineImg = null;
        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        if (commonsMultipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
            lineImg = (CommonsMultipartFile) multipartHttpServletRequest.getFile("lineImg");
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "上传图片不能为空");
            return modelMap;
        }
        if (headLine != null && lineImg != null) {
            HeadLineExecution he = null;
            try {
                ImageHolder thumbnail = new ImageHolder(lineImg.getInputStream(), lineImg.getOriginalFilename());
                he = headLineService.addHeadLine(headLine, thumbnail);
                if (he.getState() == HeadLineEnum.SUCCESS.getState()) {
                    modelMap.put("success", true);
                } else {
                    modelMap.put("success", false);
                    modelMap.put("errMsg", he.getStateInfo());
                }
            } catch (IOException e) {
                modelMap.put("success", false);
                modelMap.put("errMsg", e.getMessage());
            }
            return modelMap;
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "请输入完整的头条信息和照片");
            return modelMap;
        }
    }

    @RequestMapping("/getheadlinebyid")
    public String getHeadLineById(Map<String, Object> modelMap, HttpServletRequest request) {
        long lineId = HttpServletRequestUtil.getLong(request, "lineId");
        if (lineId > -1) {
            HeadLine headLine = headLineService.getHeadLIneById(lineId);
            if (headLine != null) {
                modelMap.put("success", true);
                modelMap.put("headLine",headLine);
                return "superadmin/aoeheadline";
            } else {
                modelMap.put("success", false);
                modelMap.put("errMsg", "can not get headline");
                return "redirect: /superadmin/getheadlinelist";
            }
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "headLineId is NULL");
            return "redirect: /superadmin/to_mainpage";
        }
    }

    @RequestMapping(value = "/editheadline", method = RequestMethod.POST)
    @ResponseBody
    private Map<String, Object> editHeadLine(HttpServletRequest request) {
        Map<String, Object> modelMap = new HashMap<String, Object>();
        boolean statusChange = HttpServletRequestUtil.getBoolean(request, "statusChange");
        if (!statusChange&&!CodeUtil.checkVerifyCode(request)) {
            modelMap.put("success", false);
            modelMap.put("errMsg", "验证码错误");
            return modelMap;
        }
        String headLineStr = HttpServletRequestUtil.getString(request, "headLineStr");
        ObjectMapper mapper = new ObjectMapper();
        HeadLine headLine = null;
        try {
            headLine = mapper.readValue(headLineStr, HeadLine.class);
        } catch (Exception e) {
            modelMap.put("success", false);
            modelMap.put("errMsg", "init headline exception" + e.getMessage());
            return modelMap;
        }
        CommonsMultipartFile lineImg = null;
        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        if (commonsMultipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
            lineImg = (CommonsMultipartFile) multipartHttpServletRequest.getFile("lineImg");
        }
        if (headLine != null && headLine.getLineId() != null) {
            HeadLineExecution he = null;
            try {
                if (lineImg == null) {
                    he = headLineService.editHeadLine(headLine, null);
                } else {
                    ImageHolder thumbnail = new ImageHolder(lineImg.getInputStream(), lineImg.getOriginalFilename());
                    he = headLineService.editHeadLine(headLine, thumbnail);
                }
                if (he.getState() == HeadLineEnum.SUCCESS.getState()) {
                    modelMap.put("success", true);
                } else {
                    modelMap.put("success", false);
                    modelMap.put("errMsg", he.getStateInfo());
                }
            } catch (Exception e) {
                modelMap.put("success", false);
                modelMap.put("errMsg", "edit headline exception " + e.getMessage());
            }
            return modelMap;
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "HeadLineID is NULL");
            return modelMap;
        }
    }

    @RequestMapping("/removeheadline")
    @ResponseBody
    private Map<String, Object> removeHeadLine(HttpServletRequest request) {
        Map<String, Object> modelMap = new HashMap<String, Object>();
        long lineId = HttpServletRequestUtil.getLong(request, "lineId");
        if (lineId > -1) {
            try {
                HeadLineExecution he = headLineService.removeHeadLine(lineId);
                if (he.getState() == HeadLineEnum.SUCCESS.getState()) {
                    modelMap.put("success", true);
                } else {
                    modelMap.put("success", false);
                    modelMap.put("errMsg", he.getStateInfo());
                }
            } catch (Exception e) {
                modelMap.put("success", false);
                modelMap.put("errMsg", "remove headline exception "+e.getMessage());
                return modelMap;
            }
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "HeadLineID is NULL");
        }
        return modelMap;
    }
}
