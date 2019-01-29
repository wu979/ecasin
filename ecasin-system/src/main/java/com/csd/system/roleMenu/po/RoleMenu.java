package com.csd.system.roleMenu.po;

public class RoleMenu {
    /**菜单ID*/
    private String relationMenuId;

    /**角色ID*/
    private String relationRoleId;

    /**是否生效*/
    private String relationIsValid;

    
    public String getRelationMenuId() {
        return relationMenuId;
    }

    
    public void setRelationMenuId(String relationMenuId) {
        this.relationMenuId = relationMenuId;
    }

    
    public String getRelationRoleId() {
        return relationRoleId;
    }

    
    public void setRelationRoleId(String relationRoleId) {
        this.relationRoleId = relationRoleId;
    }

    
    public String getRelationIsValid() {
        return relationIsValid;
    }

    
    public void setRelationIsValid(String relationIsValid) {
        this.relationIsValid = relationIsValid;
    }
}