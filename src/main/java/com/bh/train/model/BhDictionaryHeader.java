package com.bh.train.model;

import com.bh.train.common.model.BaseModel;

import java.util.Date;

public class BhDictionaryHeader extends BaseModel {
    private String headerCode;

    private String headerName;

    private String dictionaryType;

    private String memo;

    private Date addTime;

    private Date updateTime;

    private String enabledFlag;

    public String getHeaderCode() {
        return headerCode;
    }

    public void setHeaderCode(String headerCode) {
        this.headerCode = headerCode == null ? null : headerCode.trim();
    }

    public String getHeaderName() {
        return headerName;
    }

    public void setHeaderName(String headerName) {
        this.headerName = headerName == null ? null : headerName.trim();
    }

    public String getDictionaryType() {
        return dictionaryType;
    }

    public void setDictionaryType(String dictionaryType) {
        this.dictionaryType = dictionaryType == null ? null : dictionaryType.trim();
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getEnabledFlag() {
        return enabledFlag;
    }

    public void setEnabledFlag(String enabledFlag) {
        this.enabledFlag = enabledFlag == null ? null : enabledFlag.trim();
    }
}