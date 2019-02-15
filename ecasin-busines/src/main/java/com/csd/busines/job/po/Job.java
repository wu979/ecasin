package com.csd.busines.job.po;

public class Job {
    /**职位ID*/
    private String jobId;

    /**职位公司ID*/
    private String jobOrgId;

    /**职工部门ID*/
    private String jobDepId;

    /**职位名称*/
    private String jobName;

    /**创建人ID*/
    private String jobCreateUserId;

    /**创建时间*/
    private String jobCreateTime;

    /**修改时间*/
    private String jobUpdateTime;

    /**修改人ID*/
    private String jobUpdateUserId;

    /**是否生效*/
    private String jobIsValid;

    /**职位类型(0超级管理,1平台管理,2普通职位)*/
    private String jobType;

    
    public String getJobId() {
        return jobId;
    }

    
    public void setJobId(String jobId) {
        this.jobId = jobId;
    }

    
    public String getJobOrgId() {
        return jobOrgId;
    }

    
    public void setJobOrgId(String jobOrgId) {
        this.jobOrgId = jobOrgId;
    }

    
    public String getJobDepId() {
        return jobDepId;
    }

    
    public void setJobDepId(String jobDepId) {
        this.jobDepId = jobDepId;
    }

    
    public String getJobName() {
        return jobName;
    }

    
    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    
    public String getJobCreateUserId() {
        return jobCreateUserId;
    }

    
    public void setJobCreateUserId(String jobCreateUserId) {
        this.jobCreateUserId = jobCreateUserId;
    }

    
    public String getJobCreateTime() {
        return jobCreateTime;
    }

    
    public void setJobCreateTime(String jobCreateTime) {
        this.jobCreateTime = jobCreateTime;
    }

    
    public String getJobUpdateTime() {
        return jobUpdateTime;
    }

    
    public void setJobUpdateTime(String jobUpdateTime) {
        this.jobUpdateTime = jobUpdateTime;
    }

    
    public String getJobUpdateUserId() {
        return jobUpdateUserId;
    }

    
    public void setJobUpdateUserId(String jobUpdateUserId) {
        this.jobUpdateUserId = jobUpdateUserId;
    }

    
    public String getJobIsValid() {
        return jobIsValid;
    }

    
    public void setJobIsValid(String jobIsValid) {
        this.jobIsValid = jobIsValid;
    }


    public String getJobType() {
        return jobType;
    }


    public void setJobType(String jobType) {
        this.jobType = jobType;
    }
}