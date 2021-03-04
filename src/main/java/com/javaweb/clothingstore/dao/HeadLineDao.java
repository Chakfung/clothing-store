package com.javaweb.clothingstore.dao;

import com.javaweb.clothingstore.entity.HeadLine;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HeadLineDao {
    List<HeadLine> queryHeadLine(@Param("headLineCondition") HeadLine headLineCondition
            , @Param("rowIndex") int rowIndedx, @Param("pageSize") int pageSize);

    HeadLine queryHeadLIneById(long lineId);

    int insertHeadLine(HeadLine headLine);

    int updateHeadLine(HeadLine headLine);

    int deleteHeadLine(long lineId);
}
