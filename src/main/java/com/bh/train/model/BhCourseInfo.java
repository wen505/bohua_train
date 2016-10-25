package com.bh.train.model;

import com.bh.train.common.model.BaseModel;

import java.util.Date;

public class BhCourseInfo extends BaseModel{
    private Integer id;

    private Integer classType;

    private String className;

    private Integer classHour;

    private String classUnit;

    private Integer chargingStandard;

    private String chargingUnit;

    private String studentAge;

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

    public Integer getClassType() {
        return classType;
    }

    public void setClassType(Integer classType) {
        this.classType = classType;
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

    public String getStudentAge() {
        return studentAge;
    }

    public void setStudentAge(String studentAge) {
        this.studentAge = studentAge;
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
}