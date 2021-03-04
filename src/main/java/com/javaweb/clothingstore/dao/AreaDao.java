package com.javaweb.clothingstore.dao;

import com.javaweb.clothingstore.entity.Area;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface AreaDao {

    List<Area> queryArea();

    int batchInsertArea(List<Area> areaList);

    int deleteAreaById(long areaId);

    int updateArea(Area area);
}
