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


    private String[] jobIds;

    @NotBlank(message = "参数错误,请重试")
    private String roleType;

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
}
