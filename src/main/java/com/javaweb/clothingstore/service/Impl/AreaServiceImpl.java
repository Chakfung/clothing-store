package com.javaweb.clothingstore.service.Impl;

import com.javaweb.clothingstore.dao.AreaDao;
import com.javaweb.clothingstore.entity.Area;
import com.javaweb.clothingstore.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AreaServiceImpl implements AreaService {
    @Autowired
    private AreaDao areaDao;

    public List<Area> getAreaList() {
        return areaDao.queryArea();
    }

    @Override
    public int addAreaList(List<Area> areaList) {
        int effectedNum = areaDao.batchInsertArea(areaList);
        return effectedNum;
    }

    @Override
    public int removeArea(long areaId) {
        int effectedNum = areaDao.deleteAreaById(areaId);
        return effectedNum;
    }

    @Override
    public int editArea(Area area) {
        int effectedNum = areaDao.updateArea(area);
        return effectedNum;
    }
}
