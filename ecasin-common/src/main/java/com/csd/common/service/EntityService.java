package com.csd.common.service;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/2/19 13:58.
 */
public class EntityService {


    /**公司名称*/
    private String entityOrgName;


    /**部门名称*/
    private String entityDepName;


    /**职位名称*/
    private String entityJobName;


    /**常量对应名称*/
    private String entityConstantName;


    /**常量对应值*/
    private String entityConstantValue;



    public String getEntityOrgName() {
        return entityOrgName;
    }

    public void setEntityOrgName(String entityOrgName) {
        this.entityOrgName = entityOrgName;
    }

    public String getEntityDepName() {
        return entityDepName;
    }

    public void setEntityDepName(String entityDepName) {
        this.entityDepName = entityDepName;
    }

    public String getEntityJobName() {
        return entityJobName;
    }

    public void setEntityJobName(String entityJobName) {
        this.entityJobName = entityJobName;
    }

    public String getEntityConstantName() {
        return entityConstantName;
    }

    public void setEntityConstantName(String entityConstantName) {
        this.entityConstantName = entityConstantName;
    }

    public String getEntityConstantValue() {
        return entityConstantValue;
    }

    public void setEntityConstantValue(String entityConstantValue) {
        this.entityConstantValue = entityConstantValue;
    }
}
