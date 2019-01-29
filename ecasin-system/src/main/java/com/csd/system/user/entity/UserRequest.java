package com.csd.system.user.entity;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Pattern;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 17:19.
 */
public class UserRequest {

    /**电话*/
    @NotEmpty(message = "手机号为必填项")
    @Pattern(regexp="^[1][3,4,5,7,8][0-9]{9}$",message = "手机号不正确")
    private String userPhone;

    /**密码*/
    @NotEmpty(message = "密码为必填项")
    @Pattern(regexp="^[a-zA-Z0-9]{6,12}$",message = "密码不能含有非法字符，长度在6-10之间")
    private String userPassword;

    /**重复密码*/
    @NotEmpty(message = "密码为必填项")
    @Pattern(regexp="^[a-zA-Z0-9]{6,10}$",message = "密码不能含有非法字符，长度在6-10之间")
    private String repeatPassword;

    /**验证码*/
    @NotEmpty(message = "验证码为必填项")
    private String code;

    /**类型(1注册,2修改密码)*/
    private String type;


    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getRepeatPassword() {
        return repeatPassword;
    }

    public void setRepeatPassword(String repeatPassword) {
        this.repeatPassword = repeatPassword;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

}
