package com.csd.log.systemLog.po;

public class SystemLog {
    /**日志主键*/
    private String logId;

    /**被操作表名字*/
    private String logTable;

    /**被操作业务名字*/
    private String logBusiness;

    /**操作类型(1新增,2修改,3删除)*/
    private String logType;

    /**操作人ID*/
    private String logCreateUserId;

    /**操作人姓名*/
    private String logCreateUserName;

    /**操作时间*/
    private String logCreateTime;

    /**日志类型(1业务,2异常)*/
    private String logMethodType;

    /**ip*/
    private String logIp;

    /**参数*/
    private String logParams;

    
    public String getLogId() {
        return logId;
    }

    
    public void setLogId(String logId) {
        this.logId = logId;
    }

    
    public String getLogTable() {
        return logTable;
    }

    
    public void setLogTable(String logTable) {
        this.logTable = logTable;
    }

    
    public String getLogBusiness() {
        return logBusiness;
    }

    
    public void setLogBusiness(String logBusiness) {
        this.logBusiness = logBusiness;
    }

    
    public String getLogType() {
        return logType;
    }

    
    public void setLogType(String logType) {
        this.logType = logType;
    }

    
    public String getLogCreateUserId() {
        return logCreateUserId;
    }

    
    public void setLogCreateUserId(String logCreateUserId) {
        this.logCreateUserId = logCreateUserId;
    }

    
    public String getLogCreateUserName() {
        return logCreateUserName;
    }

    
    public void setLogCreateUserName(String logCreateUserName) {
        this.logCreateUserName = logCreateUserName;
    }

    
    public String getLogCreateTime() {
        return logCreateTime;
    }

    
    public void setLogCreateTime(String logCreateTime) {
        this.logCreateTime = logCreateTime;
    }

    
    public String getLogMethodType() {
        return logMethodType;
    }

    
    public void setLogMethodType(String logMethodType) {
        this.logMethodType = logMethodType;
    }

    
    public String getLogIp() {
        return logIp;
    }

    
    public void setLogIp(String logIp) {
        this.logIp = logIp;
    }

    
    public String getLogParams() {
        return logParams;
    }

    
    public void setLogParams(String logParams) {
        this.logParams = logParams;
    }
}