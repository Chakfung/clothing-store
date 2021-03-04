package com.javaweb.clothingstore.dto;

import com.javaweb.clothingstore.entity.ProductBrand;
import com.javaweb.clothingstore.enums.ProductBrandStateEnum;

import java.util.List;

public class ProductBrandExecution {
    private int state;
    private String stateInfo;
    private List<ProductBrand> productBrandList;

    public ProductBrandExecution() {

    }

    public ProductBrandExecution(ProductBrandStateEnum productBrandStateEnum) {
        this.state = productBrandStateEnum.getState();
        this.stateInfo = productBrandStateEnum.getStateInfo();
    }

    public ProductBrandExecution(ProductBrandStateEnum productBrandStateEnum, List<ProductBrand> productBrandList) {
        this.state = productBrandStateEnum.getState();
        this.stateInfo = productBrandStateEnum.getStateInfo();
        this.productBrandList = productBrandList;
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

    public List<ProductBrand> getProductBrandList() {
        return productBrandList;
    }

    public void setProductBrandList(List<ProductBrand> productBrandList) {
        this.productBrandList = productBrandList;
    }
}
