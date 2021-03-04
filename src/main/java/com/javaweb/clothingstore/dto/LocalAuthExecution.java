package com.javaweb.clothingstore.dto;

import com.javaweb.clothingstore.entity.LocalAuth;
import com.javaweb.clothingstore.enums.LocalAuthStateEnum;

import java.util.List;

public class LocalAuthExecution {
    private int state;
    private String stateinfo;
    private int count;
    private LocalAuth localAuth;
    private List<LocalAuth> localAuthList;

    public LocalAuthExecution() {

    }

    public LocalAuthExecution(LocalAuthStateEnum localAuthStateEnum) {
        this.state = localAuthStateEnum.getState();
        this.stateinfo = localAuthStateEnum.getStateInfo();
    }

    public LocalAuthExecution(LocalAuthStateEnum localAuthStateEnum, LocalAuth localAuth) {
        this.state = localAuthStateEnum.getState();
        this.stateinfo = localAuthStateEnum.getStateInfo();
        this.localAuth = localAuth;
    }

    public LocalAuthExecution(LocalAuthStateEnum localAuthStateEnum, List<LocalAuth> localAuthList) {
        this.state = localAuthStateEnum.getState();
        this.stateinfo = localAuthStateEnum.getStateInfo();
        this.localAuthList = localAuthList;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getStateinfo() {
        return stateinfo;
    }

    public void setStateinfo(String stateinfo) {
        this.stateinfo = stateinfo;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public LocalAuth getLocalAuth() {
        return localAuth;
    }

    public void setLocalAuth(LocalAuth localAuth) {
        this.localAuth = localAuth;
    }

    public List<LocalAuth> getLocalAuthList() {
        return localAuthList;
    }

    public void setLocalAuthList(List<LocalAuth> localAuthList) {
        this.localAuthList = localAuthList;
    }
}
