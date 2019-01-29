package com.csd.system.userRole.po;

public class UserRole {
    /**角色ID*/
    private String relationRoleId;

    /**职位ID*/
    private String relationJobId;

    /**是否生效*/
    private String relationIsValid;

    
    public String getRelationRoleId() {
        return relationRoleId;
    }

    
    public void setRelationRoleId(String relationRoleId) {
        this.relationRoleId = relationRoleId;
    }

    
    public String getRelationJobId() {
        return relationJobId;
    }

    
    public void setRelationJobId(String relationJobId) {
        this.relationJobId = relationJobId;
    }

    
    public String getRelationIsValid() {
        return relationIsValid;
    }

    
    public void setRelationIsValid(String relationIsValid) {
        this.relationIsValid = relationIsValid;
    }
}