package com.bh.train.model;

import com.bh.train.common.model.BaseModel;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

public class BhRecruit extends BaseModel implements Serializable {
    private Integer recruitId;

    private String recruitJob;

    private Integer sn;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")  //取日期时使用
    private Date releaseTime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")  //取日期时使用
    private Date updateTime;

    private String enabledFlag;

    private static final long serialVersionUID = 1L;

    public Integer getRecruitId() {
        return recruitId;
    }

    public void setRecruitId(Integer recruitId) {
        this.recruitId = recruitId;
    }

    public String getRecruitJob() {
        return recruitJob;
    }

    public void setRecruitJob(String recruitJob) {
        this.recruitJob = recruitJob == null ? null : recruitJob.trim();
    }

    public Integer getSn() {
        return sn;
    }

    public void setSn(Integer sn) {
        this.sn = sn;
    }

    public Date getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Date releaseTime) {
        this.releaseTime = releaseTime;
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