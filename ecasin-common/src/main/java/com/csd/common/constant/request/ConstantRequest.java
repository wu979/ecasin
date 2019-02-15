package com.csd.common.constant.request;

import com.csd.common.service.RequestService;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/2/14 15:32.
 */
public class ConstantRequest extends RequestService {

    private String constantType;


    public String getConstantType() {
        return constantType;
    }

    public void setConstantType(String constantType) {
        this.constantType = constantType;
    }
}
