package com.csd.busines.job.request;

import com.csd.common.service.RequestService;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/2/19 13:09.
 */
public class JobRequest extends RequestService {


    private String roleId;


    private String jobType;


    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getJobType() {
        return jobType;
    }

    public void setJobType(String jobType) {
        this.jobType = jobType;
    }
}
