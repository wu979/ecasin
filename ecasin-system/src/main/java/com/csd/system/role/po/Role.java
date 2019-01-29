package com.csd.system.role.po;

public class Role {
    /**角色ID*/
    private String roleId;

    /**公司ID*/
    private String roleOrgId;

    /**层级（1超级管理员,2平台管理员,3普通角色）*/
    private String roleType;

    /**角色名称*/
    private String roleName;

    /**角色标识码*/
    private String roleCode;

    /**创建人ID*/
    private String roleCreateUserId;

    /**创建时间*/
    private String roleCreateTime;

    /**修改时间*/
    private String roleUpdateTime;

    /**修改人ID*/
    private String roleUpdateUserId;

    /**是否生效*/
    private String roleIsValid;

    
    public String getRoleId() {
        return roleId;
    }

    
    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    
    public String getRoleOrgId() {
        return roleOrgId;
    }

    
    public void setRoleOrgId(String roleOrgId) {
        this.roleOrgId = roleOrgId;
    }

    
    public String getRoleType() {
        return roleType;
    }

    
    public void setRoleType(String roleType) {
        this.roleType = roleType;
    }

    
    public String getRoleName() {
        return roleName;
    }

    
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    
    public String getRoleCode() {
        return roleCode;
    }

    
    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    
    public String getRoleCreateUserId() {
        return roleCreateUserId;
    }

    
    public void setRoleCreateUserId(String roleCreateUserId) {
        this.roleCreateUserId = roleCreateUserId;
    }

    
    public String getRoleCreateTime() {
        return roleCreateTime;
    }

    
    public void setRoleCreateTime(String roleCreateTime) {
        this.roleCreateTime = roleCreateTime;
    }

    
    public String getRoleUpdateTime() {
        return roleUpdateTime;
    }

    
    public void setRoleUpdateTime(String roleUpdateTime) {
        this.roleUpdateTime = roleUpdateTime;
    }

    
    public String getRoleUpdateUserId() {
        return roleUpdateUserId;
    }

    
    public void setRoleUpdateUserId(String roleUpdateUserId) {
        this.roleUpdateUserId = roleUpdateUserId;
    }

    
    public String getRoleIsValid() {
        return roleIsValid;
    }

    
    public void setRoleIsValid(String roleIsValid) {
        this.roleIsValid = roleIsValid;
    }
}