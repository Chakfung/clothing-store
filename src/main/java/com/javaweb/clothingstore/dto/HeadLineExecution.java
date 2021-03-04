package com.javaweb.clothingstore.dto;

import com.javaweb.clothingstore.entity.HeadLine;
import com.javaweb.clothingstore.enums.HeadLineEnum;

import java.util.List;

public class HeadLineExecution {
    private int state;
    private String stateInfo;
    private List<HeadLine> headLineList;
    private HeadLine headLine;

    public HeadLineExecution() {

    }

    public HeadLineExecution(HeadLineEnum headLineEnum) {
        this.state = headLineEnum.getState();
        this.stateInfo = headLineEnum.getStateInfo();
    }

    public HeadLineExecution(HeadLineEnum headLineEnum, List<HeadLine> headLineList) {
        this.state = headLineEnum.getState();
        this.stateInfo = headLineEnum.getStateInfo();
        this.headLineList = headLineList;
    }

    public HeadLineExecution(HeadLineEnum headLineEnum, HeadLine headLine) {
        this.state = headLineEnum.getState();
        this.stateInfo = headLineEnum.getStateInfo();
        this.headLine = headLine;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getStateInfo() {
        return stateInfo;
    }

    public void setStateInfo(String stateInfo) {
        this.stateInfo = stateInfo;
    }

    public List<HeadLine> getHeadLineList() {
        return headLineList;
    }

    public void setHeadLineList(List<HeadLine> headLineList) {
        this.headLineList = headLineList;
    }

    public HeadLine getHeadLine() {
        return headLine;
    }

    public void setHeadLine(HeadLine headLine) {
        this.headLine = headLine;
    }
}
