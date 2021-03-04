package com.javaweb.clothingstore.controller.superadmin;

import com.javaweb.clothingstore.entity.Area;
import com.javaweb.clothingstore.service.AreaService;
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
public class AreaOperationConroller {
    @Autowired
    private AreaService areaService;

    @RequestMapping("/getarealist")
    public String getAreaList(Map<String, Object> modelMap) {
        List<Area> areaList = areaService.getAreaList();
        if (areaList != null && areaList.size() > 0) {
            modelMap.put("success", true);
            modelMap.put("areaList", areaList);
            return "/superadmin/arealist";
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "can not get areaList");
            return "redirect: /superadmin/to_mainpage";
        }
    }

    @RequestMapping(value = "/addarea", method = RequestMethod.POST)
    @ResponseBody
    private Map<String, Object> addAreaList(@RequestBody List<Area> areaList, HttpServletRequest request) {
        Map<String, Object> modelMap = new HashMap<String, Object>();
        if (areaList != null && areaList.size() > 0) {
            for (int i = 0; i < areaList.size(); i++) {
                areaList.get(i).setCreateTime(new Date());
                areaList.get(i).setLastEditTime(new Date());
            }
            try {
                int effectedNum = areaService.addAreaList(areaList);
                if (effectedNum>0) {
                    modelMap.put("success", true);
                } else {
                    modelMap.put("success", false);
                    modelMap.put("errMsg", "can not add area");
                }
            } catch (Exception e) {
                modelMap.put("success", false);
                modelMap.put("errMsg", "add area error"+e.getMessage());
                return modelMap;
            }
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "arealist is null");
        }
        return modelMap;
    }

    @RequestMapping("/removearea")
    @ResponseBody
    private Map<String, Object> removeArea(HttpServletRequest request) {
        Map<String, Object> modelMap = new HashMap<String, Object>();
        long areaId = HttpServletRequestUtil.getLong(request, "areaId");
        if (areaId > -1) {
            try {
                int effectedNum = areaService.removeArea(areaId);
                if (effectedNum > 0) {
                    modelMap.put("success", true);
                } else {
                    modelMap.put("success", false);
                    modelMap.put("errMsg", "can not remove area");
                }
            } catch (Exception e) {
                modelMap.put("success", true);
                modelMap.put("errMsg", "remove area exception " + e.getMessage());
                return modelMap;
            }
        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "areaId is NULL");
        }
        return modelMap;
    }
}
