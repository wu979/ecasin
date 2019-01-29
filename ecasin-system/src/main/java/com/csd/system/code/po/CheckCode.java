package com.csd.system.code.po;

public class CheckCode {
    /**短信验证码ID*/
    private String codeId;

    /**用户手机号*/
    private String codePhone;

    /**验证码*/
    private Integer codeNumber;

    /**1用户注册 2更换手机号码 3变更密码*/
    private String codeType;

    /**短信发送时间*/
    private String codeTime;

    
    public String getCodeId() {
        return codeId;
    }

    
    public void setCodeId(String codeId) {
        this.codeId = codeId;
    }

    
    public String getCodePhone() {
        return codePhone;
    }

    
    public void setCodePhone(String codePhone) {
        this.codePhone = codePhone;
    }

    
    public Integer getCodeNumber() {
        return codeNumber;
    }

    
    public void setCodeNumber(Integer codeNumber) {
        this.codeNumber = codeNumber;
    }

    
    public String getCodeType() {
        return codeType;
    }

    
    public void setCodeType(String codeType) {
        this.codeType = codeType;
    }

    
    public String getCodeTime() {
        return codeTime;
    }

    
    public void setCodeTime(String codeTime) {
        this.codeTime = codeTime;
    }
}