package com.bh.train.model;

import java.util.Date;

public class BhPermission {
    private Integer prmissionId;

    private String permissionName;

    private String permissionCode;

    private String description;

    private Integer parentId;

    private Integer permissionSn;

    private String url;

    private String permissionType;

    private String memo;

    private Date addTime;

    private Date updateTime;

    private String enabledFlag;

    private  String isBindRole;

    public Integer getPrmissionId() {
        return prmissionId;
    }

    public void setPrmissionId(Integer prmissionId) {
        this.prmissionId = prmissionId;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName == null ? null : permissionName.trim();
    }

    public String getPermissionCode() {
        return permissionCode;
    }

    public void setPermissionCode(String permissionCode) {
        this.permissionCode = permissionCode == null ? null : permissionCode.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getPermissionSn() {
        return permissionSn;
    }

    public void setPermissionSn(Integer permissionSn) {
        this.permissionSn = permissionSn;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getPermissionType() {
        return permissionType;
    }

    public void setPermissionType(String permissionType) {
        this.permissionType = permissionType == null ? null : permissionType.trim();
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

    public String getIsBindRole() {
        return isBindRole;
    }

    public void setIsBindRole(String isBindRole) {
        this.isBindRole = isBindRole;
    }
}