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
}
