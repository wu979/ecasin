package com.csd.busines.company.po;

public class Company {
    /**公司组织架构ID*/
    private String companyId;

    /**公司所属单位ID*/
    private String companyOrgId;

    /**父级ID*/
    private String companyParentId;

    /**公司组织架构名称*/
    private String companyName;

    /**有无子部门(0否,1是)*/
    private String companyHasChild;

    /**层级（0顶级）*/
    private Integer companyLevel;

    /**类型（0总公司，1直属部门，2分公司，3分公司部门）*/
    private String companyType;

    /**是否有效（0无效，1有效）*/
    private String companyIsValid;

    /**创建人ID*/
    private String companyCretateUserid;

    /**创建人名称*/
    private String companyCreateUsername;

    /**创建时间*/
    private String companyCeeateTime;

    /**修改人ID*/
    private String companyLastUpdateUserid;

    /**修改人名称*/
    private String companyLastUpdateUsername;

    /**修改时间*/
    private String companyLastUpdateTime;

    
    public String getCompanyId() {
        return companyId;
    }

    
    public void setCompanyId(String companyId) {
        this.companyId = companyId;
    }

    
    public String getCompanyOrgId() {
        return companyOrgId;
    }

    
    public void setCompanyOrgId(String companyOrgId) {
        this.companyOrgId = companyOrgId;
    }

    
    public String getCompanyParentId() {
        return companyParentId;
    }

    
    public void setCompanyParentId(String companyParentId) {
        this.companyParentId = companyParentId;
    }

    
    public String getCompanyName() {
        return companyName;
    }

    
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    
    public String getCompanyHasChild() {
        return companyHasChild;
    }

    
    public void setCompanyHasChild(String companyHasChild) {
        this.companyHasChild = companyHasChild;
    }

    
    public Integer getCompanyLevel() {
        return companyLevel;
    }

    
    public void setCompanyLevel(Integer companyLevel) {
        this.companyLevel = companyLevel;
    }

    
    public String getCompanyType() {
        return companyType;
    }

    
    public void setCompanyType(String companyType) {
        this.companyType = companyType;
    }

    
    public String getCompanyIsValid() {
        return companyIsValid;
    }

    
    public void setCompanyIsValid(String companyIsValid) {
        this.companyIsValid = companyIsValid;
    }

    
    public String getCompanyCretateUserid() {
        return companyCretateUserid;
    }

    
    public void setCompanyCretateUserid(String companyCretateUserid) {
        this.companyCretateUserid = companyCretateUserid;
    }

    
    public String getCompanyCreateUsername() {
        return companyCreateUsername;
    }

    
    public void setCompanyCreateUsername(String companyCreateUsername) {
        this.companyCreateUsername = companyCreateUsername;
    }

    
    public String getCompanyCeeateTime() {
        return companyCeeateTime;
    }

    
    public void setCompanyCeeateTime(String companyCeeateTime) {
        this.companyCeeateTime = companyCeeateTime;
    }

    
    public String getCompanyLastUpdateUserid() {
        return companyLastUpdateUserid;
    }

    
    public void setCompanyLastUpdateUserid(String companyLastUpdateUserid) {
        this.companyLastUpdateUserid = companyLastUpdateUserid;
    }

    
    public String getCompanyLastUpdateUsername() {
        return companyLastUpdateUsername;
    }

    
    public void setCompanyLastUpdateUsername(String companyLastUpdateUsername) {
        this.companyLastUpdateUsername = companyLastUpdateUsername;
    }

    
    public String getCompanyLastUpdateTime() {
        return companyLastUpdateTime;
    }

    
    public void setCompanyLastUpdateTime(String companyLastUpdateTime) {
        this.companyLastUpdateTime = companyLastUpdateTime;
    }
}