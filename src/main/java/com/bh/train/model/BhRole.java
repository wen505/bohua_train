package com.bh.train.model;

import java.util.Date;

/**
 * 角色实体类
 */
public class BhRole {
    private Integer roleId;

    private String roleName;

    private String memo;

    private String enabledFlag;

    private Date addTime;

    private Date updateTime;

    private String isBindUser;

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public String getEnabledFlag() {
        return enabledFlag;
    }

    public void setEnabledFlag(String enabledFlag) {
        this.enabledFlag = enabledFlag == null ? null : enabledFlag.trim();
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

    /**
     * 是否绑定用户
     */
    public String getIsBindUser() {
        return isBindUser;
    }

    public void setIsBindUser(String isBindUser) {
        this.isBindUser = isBindUser;
    }
}