package com.csd.system.role.request;

import com.csd.common.service.RequestService;
import org.hibernate.validator.constraints.NotBlank;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/30 17:02.
 */
public class RoleRequest extends RequestService {

    @NotBlank(message = "参数错误,请重试")
    private String roleId;


    @NotBlank(message = "参数错误,请重试")
    private String roleType;


    @NotBlank(message = "参数错误,请重试")
    private String menuId;


    private String menuPid;


    private String[] jobIds;

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String[] getJobIds() {
        return jobIds;
    }

    public void setJobIds(String[] jobIds) {
        this.jobIds = jobIds;
    }

    public String getRoleType() {
        return roleType;
    }

    public void setRoleType(String roleType) {
        this.roleType = roleType;
    }

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId;
    }

    public String getMenuPid() {
        return menuPid;
    }

    public void setMenuPid(String menuPid) {
        this.menuPid = menuPid;
    }
}

