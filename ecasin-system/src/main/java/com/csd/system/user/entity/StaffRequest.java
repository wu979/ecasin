package com.csd.system.user.entity;

import com.csd.common.service.RequestService;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/2/27 16:47.
 */
public class StaffRequest extends RequestService {

    /**是否激活*/
    private String active;


    /**人员状态*/
    private String state;


    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
