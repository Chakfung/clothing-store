package com.javaweb.clothingstore.service;

import com.javaweb.clothingstore.dto.HeadLineExecution;
import com.javaweb.clothingstore.dto.ImageHolder;
import com.javaweb.clothingstore.entity.HeadLine;

public interface HeadLineService {
    HeadLineExecution getHeadLineList(HeadLine headLineCondition, int pageIndex, int pageSize);

    HeadLine getHeadLIneById(long lineId);

    HeadLineExecution addHeadLine(HeadLine headLine, ImageHolder thumbnail);

    HeadLineExecution editHeadLine(HeadLine headLine, ImageHolder thumbnail);

    HeadLineExecution removeHeadLine(long headLineId);
}
