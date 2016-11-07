package com.bh.train.model;

import com.bh.train.common.model.BaseModel;

import java.util.Date;

public class BhCourseInfo extends BaseModel{
    private Integer id;

    private String classType;

    private String className;

    private Integer classHour;

    private String classUnit;

    private Integer chargingStandard;

    private String chargingUnit;

    private String studentType;

    private Integer peopleNum;

    private String isStart;

    private String offLine;

    private Date addTime;

    private Date updateTime;

    private String enabledFlag;

    private String description;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public Integer getClassHour() {
        return classHour;
    }

    public void setClassHour(Integer classHour) {
        this.classHour = classHour;
    }

    public String getClassUnit() {
        return classUnit;
    }

    public void setClassUnit(String classUnit) {
        this.classUnit = classUnit;
    }

    public Integer getChargingStandard() {
        return chargingStandard;
    }

    public void setChargingStandard(Integer chargingStandard) {
        this.chargingStandard = chargingStandard;
    }

    public String getChargingUnit() {
        return chargingUnit;
    }

    public void setChargingUnit(String chargingUnit) {
        this.chargingUnit = chargingUnit;
    }

    public Integer getPeopleNum() {
        return peopleNum;
    }

    public void setPeopleNum(Integer peopleNum) {
        this.peopleNum = peopleNum;
    }

    public String getIsStart() {
        return isStart;
    }

    public void setIsStart(String isStart) {
        this.isStart = isStart;
    }

    public String getOffLine() {
        return offLine;
    }

    public void setOffLine(String offLine) {
        this.offLine = offLine;
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
        this.enabledFlag = enabledFlag;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getClassType() {
        return classType;
    }

    public void setClassType(String classType) {
        this.classType = classType;
    }

    public String getStudentType() {
        return studentType;
    }

    public void setStudentType(String studentType) {
        this.studentType = studentType;
    }
}