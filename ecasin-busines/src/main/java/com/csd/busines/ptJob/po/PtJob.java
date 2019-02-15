package com.csd.busines.ptJob.po;

public class PtJob {
    /**员工职位ID*/
    private String ptId;

    /**公司ID*/
    private String ptOrgId;

    /**部门ID*/
    private String ptDepId;

    /**职位ID*/
    private String ptJobId;

    /**用户ID*/
    private String ptUserId;

    /**职位类型(1主职位,2兼职职位)*/
    private String ptJobType;

    /**创建人ID*/
    private String ptCreateUserId;

    /**创建时间*/
    private String ptCreateTime;

    /**修改时间*/
    private String ptUpdateTime;

    /**修改人ID*/
    private String ptUpdateUserId;

    /**是否生效*/
    private String ptIsValid;

    
    public String getPtId() {
        return ptId;
    }

    
    public void setPtId(String ptId) {
        this.ptId = ptId;
    }

    
    public String getPtOrgId() {
        return ptOrgId;
    }

    
    public void setPtOrgId(String ptOrgId) {
        this.ptOrgId = ptOrgId;
    }

    
    public String getPtDepId() {
        return ptDepId;
    }

    
    public void setPtDepId(String ptDepId) {
        this.ptDepId = ptDepId;
    }

    
    public String getPtJobId() {
        return ptJobId;
    }

    
    public void setPtJobId(String ptJobId) {
        this.ptJobId = ptJobId;
    }

    
    public String getPtUserId() {
        return ptUserId;
    }

    
    public void setPtUserId(String ptUserId) {
        this.ptUserId = ptUserId;
    }

    
    public String getPtJobType() {
        return ptJobType;
    }

    
    public void setPtJobType(String ptJobType) {
        this.ptJobType = ptJobType;
    }

    
    public String getPtCreateUserId() {
        return ptCreateUserId;
    }

    
    public void setPtCreateUserId(String ptCreateUserId) {
        this.ptCreateUserId = ptCreateUserId;
    }

    
    public String getPtCreateTime() {
        return ptCreateTime;
    }

    
    public void setPtCreateTime(String ptCreateTime) {
        this.ptCreateTime = ptCreateTime;
    }

    
    public String getPtUpdateTime() {
        return ptUpdateTime;
    }

    
    public void setPtUpdateTime(String ptUpdateTime) {
        this.ptUpdateTime = ptUpdateTime;
    }

    
    public String getPtUpdateUserId() {
        return ptUpdateUserId;
    }

    
    public void setPtUpdateUserId(String ptUpdateUserId) {
        this.ptUpdateUserId = ptUpdateUserId;
    }

    
    public String getPtIsValid() {
        return ptIsValid;
    }

    
    public void setPtIsValid(String ptIsValid) {
        this.ptIsValid = ptIsValid;
    }
}