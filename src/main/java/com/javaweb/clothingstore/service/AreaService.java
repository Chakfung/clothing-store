package com.javaweb.clothingstore.service;

import com.javaweb.clothingstore.entity.Area;

import java.util.List;

public interface AreaService {
    List<Area> getAreaList();

    int addAreaList(List<Area> areaList);

    int removeArea(long areaId);

    int editArea(Area area);
}
