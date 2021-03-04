package com.javaweb.clothingstore.service.Impl;

import com.javaweb.clothingstore.dao.HeadLineDao;
import com.javaweb.clothingstore.dto.HeadLineExecution;
import com.javaweb.clothingstore.dto.ImageHolder;
import com.javaweb.clothingstore.entity.HeadLine;
import com.javaweb.clothingstore.enums.HeadLineEnum;
import com.javaweb.clothingstore.exceptions.HeadLineException;
import com.javaweb.clothingstore.service.HeadLineService;
import com.javaweb.clothingstore.util.ImageUtil;
import com.javaweb.clothingstore.util.PageCalculator;
import com.javaweb.clothingstore.util.PathUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class HeadLineServiceImpl implements HeadLineService {
    @Autowired
    private HeadLineDao headLineDao;


    @Override
    public HeadLineExecution getHeadLineList(HeadLine headLineCondition, int pageIndex, int pageSize)  {
        int rowSize = PageCalculator.calculateRowIndex(pageIndex, pageSize);
        List<HeadLine> headLineList = headLineDao.queryHeadLine(headLineCondition, rowSize, pageSize);
        HeadLineExecution he;
        if (headLineList != null && headLineList.size() > 0) {
            he = new HeadLineExecution(HeadLineEnum.SUCCESS, headLineList);
        } else {
            he = new HeadLineExecution(HeadLineEnum.NULL_HEADLINE);
        }
        return he;
    }

    @Override
    public HeadLine getHeadLIneById(long lineId) {
        return headLineDao.queryHeadLIneById(lineId);
    }

    @Override
    @Transactional
    public HeadLineExecution addHeadLine(HeadLine headLine, ImageHolder thumbnail)  {
        if (headLine == null) {
            return new HeadLineExecution(HeadLineEnum.NULL_HEADLINE);
        }
        String lineImg = null;
        try {
            headLine.setEnableStatus(1);
            headLine.setCreateTime(new Date());
            headLine.setLastEditTime(new Date());
            if (thumbnail != null) {
                 lineImg= addHeadLineImg(headLine, thumbnail);
                int effectedNum = headLineDao.insertHeadLine(headLine);
                if (effectedNum <= 0) {
                    ImageUtil.deleteFileorPath(lineImg);
                    throw new HeadLineException("添加头条失败");
                } else {
                    return new HeadLineExecution(HeadLineEnum.SUCCESS);
                }
            } else {
                return new HeadLineExecution(HeadLineEnum.NULL_IMG);
            }
        } catch (Exception e) {
            ImageUtil.deleteFileorPath(lineImg);
            throw new HeadLineException("add headline exception" + e.getMessage());
        }

    }

    @Override
    public HeadLineExecution editHeadLine(HeadLine headLine, ImageHolder thumbnail)  {
        if (headLine == null) {
            return new HeadLineExecution(HeadLineEnum.NULL_HEADLINE);
        }
        try {
            if (thumbnail != null) {
                String oldlineImg = headLineDao.queryHeadLIneById(headLine.getLineId()).getLineImg();
                String newlineImg = addHeadLineImg(headLine, thumbnail);
                int effectedNum = headLineDao.updateHeadLine(headLine);
                if (effectedNum <= 0) {
                    ImageUtil.deleteFileorPath(newlineImg);
                    return new HeadLineExecution(HeadLineEnum.ERROR);
                } else {
                    ImageUtil.deleteFileorPath(oldlineImg);
                    return new HeadLineExecution(HeadLineEnum.SUCCESS);
                }
            } else {
                int effectedNum = headLineDao.updateHeadLine(headLine);
                if (effectedNum <= 0) {
                    return new HeadLineExecution(HeadLineEnum.ERROR);
                } else {
                    return new HeadLineExecution(HeadLineEnum.SUCCESS);
                }
            }
        } catch (Exception e) {
            throw new HeadLineException("Edit HeadLine Exception" + e.getMessage());
        }
    }


    @Override
    public HeadLineExecution removeHeadLine(long headLineId) {
        if (headLineId > -1) {
            String oldlineImg = headLineDao.queryHeadLIneById(headLineId).getLineImg();
            int effectedNum = headLineDao.deleteHeadLine(headLineId);
            if (effectedNum <= 0) {
                return new HeadLineExecution(HeadLineEnum.ERROR);
            } else {
                ImageUtil.deleteFileorPath(oldlineImg);
                return new HeadLineExecution(HeadLineEnum.SUCCESS);
            }
        } else {
            return new HeadLineExecution(HeadLineEnum.NULL_HEADLINE);
        }
    }

    private String addHeadLineImg(HeadLine headLine,ImageHolder thumbanil) {
        String lineImg = ImageUtil.generatehlThumbnail(thumbanil, PathUtil.getHeadLineImagePath());
        headLine.setLineImg(lineImg);
        return lineImg;
    }
}
