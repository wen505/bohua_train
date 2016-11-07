package com.bh.train.model;

import java.io.Serializable;

public class BhRecruitWithBLOBs extends BhRecruit implements Serializable {
    private String jobDuty;

    private String jobRequest;

    private static final long serialVersionUID = 1L;

    public String getJobDuty() {
        return jobDuty;
    }

    public void setJobDuty(String jobDuty) {
        this.jobDuty = jobDuty == null ? null : jobDuty.trim();
    }

    public String getJobRequest() {
        return jobRequest;
    }

    public void setJobRequest(String jobRequest) {
        this.jobRequest = jobRequest == null ? null : jobRequest.trim();
    }
}